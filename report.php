<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Client Creation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    <style>
        #container {
            margin-top: 30px;
            margin-left: 200px;
            margin-right: 200px;
            margin-bottom: 30px;
        }
        #title {
            margin-bottom: 30px;
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
        <h1 id="title">Report</h1>
        <p>Number of employees with <strong>Premium</strong> employee plan with working hours <strong>less than 60 hrs/month</strong></p>
        <?php
        echo "<table border='1'>
            <tr>
            <th>EmployeeID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Hours</th>
            </tr>";

        // Get all employees with Premium insurance
        $sql = "SELECT EmployeeID, fName, lName FROM Employees WHERE InsuranceID=(SELECT InsuranceID FROM Insurance WHERE TypeDescript='Premium')";
        $result = $conn->query($sql);

        // Get sum of hours of all employees with insurance plan
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
                echo "<tr>";
                echo "<td>" . $row['EmployeeID'] . "</td>";
                echo "<td>" . $row['fName'] . "</td>";
                echo "<td>" . $row['lName'] . "</td>";
                echo "<td>" . $hours . "</td>";
                echo "</tr>";
            }
        }
        echo "</table>";
        ?>
    </div>
</body>
</html>