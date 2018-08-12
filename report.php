<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Report</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    <style>
        #container {
            margin-top: 30px;
            margin-left: 200px;
            margin-right: 200px;
            margin-bottom: 30px;
        }
        .subtitle {
            margin-top: 30px;
        }
        .data{
            margin-left:50px;
        }
    </style>
</head>
<?php
    include('navbar.php');

    // TODO: Uncomment when manager is created
//    // Check if the user is authorized to see this page
//    // If the user is not logged in
//    if (isset($_SESSION['loggedin']) == false && $_SESSION['loggedin'] == false) {
//        header('Location: unauthorized.html');
//    }
//    // If the user is not a manager
//    else if (isset($_SESSION['EDID']) && $_SESSION['EDID'] != 1) {
//        header('Location: unauthorized.html');
//    }


?>
<body>
    <div id="container">
        <h1>Report</h1>
        <p class="subtitle">Number of employees with <strong>Premium</strong> employee plan with working hours <strong>less than 60 hrs/month</strong></p>
        <div class="data">
        <?php
        // Get all employees with Premium insurance
        $sql = "SELECT EmployeeID, fName, lName FROM Employees WHERE InsuranceID=(SELECT InsuranceID FROM Insurance WHERE TypeDescript='Premium')";
        $result = $conn->query($sql);

        $count = 0;
        // Get sum of hours of all employees with insurance plan
        echo "<table border='1'>
            <tr>
            <th>EmployeeID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Hours</th>
            </tr>";
        while ($row = $result->fetch_assoc()) {
            $employeeID = $row['EmployeeID'];
            $sql = "SELECT SUM(hours) FROM Hours WHERE EmployeeID='$employeeID'";
            $r = $conn->query($sql);
            $r2 = $r->fetch_assoc();
            $hours = $r2['SUM(hours)'];

            // If empty, make it 0
            if ($hours == "") {
                $hours = 0;
            }
            if ($hours < 60){
                $count++;
                echo "<tr>";
                echo "<td>" . $row['EmployeeID'] . "</td>";
                echo "<td>" . $row['fName'] . "</td>";
                echo "<td>" . $row['lName'] . "</td>";
                echo "<td>" . $hours . "</td>";
                echo "</tr>";
            }
        }
        echo "</table>";
        echo "<strong>Total count: </strong>" . $count;
        ?>
        </div>

        <p class="subtitle">Number of Premium contracts delivered in more than <strong>10 business days</strong> having more than 35 employees with <strong>Silver Employee Plan</strong></p>
        <div class="data">
        <?php
            $count2 = 0;
            //Get all premium contracts with a ThirdDeliv date
            $sql =  "SELECT ThirdDeliv, StartDate, ContID FROM Contracts WHERE Category='Premium' AND ThirdDeliv <> ''";
            $result = $conn->query($sql);
            while ($row = $result->fetch_assoc()) {
                // Difference between start date and third delivery date
                $deliveryTime = date_diff(date_create($row['ThirdDeliv']), date_create($row['StartDate']));
                $contID = $row['ContID'];
                // If more than 10 days
                if ($deliveryTime->d > 10) {
                    $sql = "SELECT COUNT(DISTINCT EmployeeHistory.EmployeeID) FROM EmployeeHistory, Employees WHERE contID ='$contID' AND Employees.InsuranceID=(SELECT InsuranceID FROM Insurance WHERE TypeDescript='Premium') AND Employees.EmployeeID=EmployeeHistory.EmployeeID;";
                    $r = $conn->query($sql);
                    $r2 = $r->fetch_assoc();
                    $numEmployees = $r2['COUNT(DISTINCT EmployeeHistory.EmployeeID)'];
                    if($numEmployees > 35) {
                        $count2++;
                    }
                }
            }
            echo "<strong>Total count: </strong>" . $count2;
        ?>
        </div>
        <p class="subtitle">Delivery schedule of <strong>first deliverable</strong> of all types of contracts in each month of  <strong>2017</strong></p>
        <div class="data">
        <?php
            // Contracts in 2017
            $sql = "SELECT StartDate, FirstDeliv, ContID, Category FROM Contracts WHERE StartDate < '2018-01-01' AND StartDate > '2016-12-31' ORDER BY StartDate";
            $result = $conn->query($sql);

            echo "<table border='1'>
                <tr>
                <th>ContID</th>
                <th>Category</th>
                <th>Start Date</th>
                <th>First Delivery</th>
                <th>Days</th>
                </tr>";
            while ($row = $result->fetch_assoc()) {
                // Difference in days
                $difference = date_diff(date_create($row['FirstDeliv']), date_create($row['StartDate']));
                $differenceDays = $difference->d;
                echo "<tr>";
                echo "<td>" . $row['ContID'] . "</td>";
                echo "<td>" . $row['Category'] . "</td>";
                echo "<td>" . $row['StartDate'] . "</td>";
                echo "<td>" . $row['FirstDeliv'] . "</td>";
                echo "<td>" . $differenceDays . "</td>";
                echo "</tr>";
            }
        ?>
        </div>
    </div>
</body>
</html>