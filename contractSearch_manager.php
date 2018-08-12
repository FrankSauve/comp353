<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contract Hours</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <style>
        .pad {
            padding-left: 1em;
            padding-top: 1em;
        }
        #container {
             margin-top: 30px;
             margin-left: 200px;
             margin-right: 200px;
             margin-bottom: 30px;
        }
    </style>
</head>
<body>
<?php
$type = $_GET['type'];
include('navbar.php');
// Check if the user is authorized to see this page
// If the user is not logged in
if (isset($_SESSION['loggedin']) == false && $_SESSION['loggedin'] == false) {
    header('Location: unauthorized.html');
}
// If the user is not a manager
else if (isset($_SESSION['EDID']) && $_SESSION['EDID'] != 1) {
    header('Location: unauthorized.html');
}
?>

<div id="container">
    <h1>Contract Hours</h1>
    <?php
    echo "<div class=\"pad\">";
    include('db_connection.php');
    echo '<form action="#" method="post">';

    $sql = "SELECT DISTINCT(CompName) FROM Company";
    $result = $conn->query($sql);

    echo 'Please select a Company:   <select name="Company_Selection" >';
    echo '<option value=""></option>';
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        echo '<option value="' . $row['CompName'] . '">' . $row['CompName'] . '</option>';
    }
    echo '</select>';
    echo '     ' . '<input class="btn btn-primary" type ="submit" name="submit" value="Submit"/>';
    echo '</form>';
    #$conn->close();
    '<br/>';

    if (isset($_POST['submit'])) {
        $selected_val = $_POST['Company_Selection'];
        echo "Company selected: <Strong>" . $selected_val . "</Strong><br>";
        echo "<br> This Company has the following Contracts, please select a contract to remove employees from";
        echo '<form action="#" method="post">';

        $sql1 = "SELECT  ContID FROM Contracts inner join Company on Contracts.CompID = Company.CompID
                where Company.CompName = '" . $selected_val . "'";
        $result1 = $conn->query($sql1);

        echo 'Please select a contract:   <select name="Contracts_Selection">';
        echo '<option value=""></option>';
        // output data of each row
        while ($row1 = $result1->fetch_assoc()) {
            echo '<option value="' . $row1['ContID'] . '">' . $row1['ContID'] . '</option>';
        }
        echo '</select>';
        echo '     ' . '<input class="btn btn-primary" type ="submit" name="Enter" value="Submit"/>';
        echo '</form>';
    }

    echo '<br>';

    if (isset($_POST['Enter'])) {
        $selected_Cont = (int)$_POST['Contracts_Selection'];
        $sql2 = "select CompName, Contracts.ContID from Company 
                  inner join Contracts on Company.CompID = Contracts.CompID 
                  where ContID = " . $selected_Cont . " ";
        $result2 = $conn->query($sql2);
        while ($row2 = $result2->fetch_assoc()) {
            echo "The company selected is <Strong>" . $row2['CompName'] . "</Strong> and contract # is <Strong>"
                . $row2['ContID'] . "</Strong></br>";
        }

        if ($type == 'hour') {
            $sql3 = "select EmployeeHistory.EmployeeID, Employees.fName, Employees.lName, sum(Hours.hours), Company.CompName
                from EmployeeHistory
                inner join Employees on EmployeeHistory.EmployeeID = Employees.EmployeeID
                inner join Hours on EmployeeHistory.EmployeeID = Hours.EmployeeID and EmployeeHistory.contID = Hours.contID
                inner join Company on (select Contracts.CompID from Contracts inner join Company on Contracts.CompID = Company.CompID where Contracts.contID = $selected_Cont)=Company.CompID
                where EmployeeHistory.contID = $selected_Cont
                group by Employees.fName;";

            $result3 = $conn->query($sql3);
            echo "Employess and hours";
            echo "<table class = 'w3-table-all w3-card-4' border='2'>
                <tr>
                    <th>Employee ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Total Hours</th>
                </tr>";

            while ($row3 = $result3->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row3['EmployeeID'] . "</td>";
                echo "<td>" . $row3['fName'] . "</td>";
                echo "<td>" . $row3['lName'] . "</td>";
                echo "<td>" . $row3['sum(Hours.hours)'] . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        } else if ($type == 'remove') {

            $sql4 = "select Employees.fName, Employees.lName,Employees.EmployeeID, EmployeeHistory.ContID
                from EmployeeHistory
                inner join Employees on EmployeeHistory.EmployeeID = Employees.EmployeeID
                inner join Company on (select Contracts.CompID from Contracts inner join Company on Contracts.CompID = Company.CompID where Contracts.contID = $selected_Cont)=Company.CompID
                where EmployeeHistory.contID = $selected_Cont and EmployeeHistory.isActive = 1;";

            $result4 = $conn->query($sql4);
            echo "</br>";
            echo "Select employees to remove from contract</br>";
            echo '<form action="#" method="post">';
            while ($row4 = $result4->fetch_assoc()) {
                $id = $row4['EmployeeID'];
                $fname = $row4['fName'];
                $lname = $row4['lName'];
                $contID = $row4['ContID'];
                echo "<tr>";
                echo '<input type="hidden" name="ContID" value = "' . $contID . '"readonly </input>';
                echo "<td><input type='checkbox' name='checkbox[]' value='$id'> $fname $lname<br></td>";
                echo "</tr>";
            }

            echo '     ' . '<input class="btn btn-primary" type ="submit" name="delete" value="Submit"/>';
            echo '</form>';
        }
    }
    if (isset($_POST['delete'])) {
        $selected_ContID = (int)$_POST['ContID'];
        $checkbox = $_POST['checkbox'];
        foreach ($checkbox as $id) {
            $id = (int)$id;
            $sql5 = "update EmployeeHistory set isActive = 0 where EmployeeID = $id and contID = $selected_ContID";
            if ($conn->query($sql5) === TRUE) {
                echo '<div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> Record updated successfully</div>';
            } else {
                echo "Error deleting record: " . $conn->error;
            }
        }
    }

    ?>
</div>
</body>