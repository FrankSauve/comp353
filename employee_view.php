<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <style>
        #container {
            margin-top: 30px;
            margin-left: 200px;
            margin-right: 200px;
            margin-bottom: 30px;
        }
    </style>
</head>
<?php
include('navbar.php');
include('db_connection.php');
$error = false; // Changes to true if there is a validation error

// Check if the user is authorized to see this page
// If the user is not logged in
if (isset($_SESSION['loggedin']) == false && $_SESSION['loggedin'] == false) {
    header('Location: unauthorized.html');
}
// If the user is an employee
else if (!isset($_SESSION['EDID'])) {
    header('Location: unauthorized.html');
}

//getting preference upon loading
$sql = "SELECT Category FROM Preferences WHERE EmployeeID = '$empID'";
$result = $conn->query($sql);
//if the employees preference already exists in the DB, display it
if (($result->num_rows > 0)) {
    $selectedPreference = $result->fetch_assoc()['Category'];
}

if(isset($_POST["preference"])) {
    $selectedPreference = $_POST['preference'];
}

// Check the DB for a pre-existing value, otherwise insert a new row
if(isset($_POST["preference"])&& !$error){
    $selectedPreference = $_POST['preference'];

    $sql = "SELECT Category FROM Preferences WHERE EmployeeID = '$empID'";
    $result = $conn->query($sql);
    //if the employees preference already exists in the DB
    if (($result->num_rows > 0)) {
        //Remove it if the user has no preference
        if($selectedPreference === 'No Preference'){
            //Delete record if the user wishes to not express a preference
            $sql = "DELETE FROM Preferences WHERE EmployeeID = '$empID'";
            if ($conn->query($sql) === TRUE) {
                // Employee successfully updated their preferences
                echo '<div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> Preferences Removed.</div>';
            } else {
                echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Unable to delete previous preferences.</div>';
            }
        }
        else if ($selectedPreference != $result->fetch_assoc()) {
            //Update in Preferences table
            $sql = "UPDATE Preferences SET Category = '$selectedPreference' WHERE EmployeeID = '$empID'";
            if ($conn->query($sql) === TRUE) {
                // Employee successfully updated their preferences
                echo '<div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> Preferences Updated.</div>';
            } else {
                echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Unable to update preferences.</div>';
            }
        }
    }
    else{
        // Insert in Preferences table if there are no existing records for that employee
        $sql = "INSERT INTO Preferences VALUES ('$empID', '$selectedPreference')";
        // If the insert was successful
        if ($conn->query($sql) === TRUE) {
            // Employee successfully updated their preferences
            echo '<div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> Preferences Recorded.</div>';
        } else {
            echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Unable to add user preference.</div>';
        }
    }
}


?>

<body>
<div id="container">
    <h1>My Profile</h1>
    <form name="preferenceSelection" action="employee_view.php" method="post">
        <div class="form-group">
            <label>Contract Preference</label>
            <select class="form-control" id="pref" name="preference" onchange="preferenceSelection.submit()">
                <?php

                $checkSelected = false;

                // Insert all the category options into a select (Done rather than inserting manually in case new categories are added)
                $sql = "SELECT DISTINCT Category FROM Preferences";
                $result = $conn->query($sql);
                while($categories = $result->fetch_assoc()) {
                    // Set the selected province in the drop down
                    if ($categories['Category'] == $selectedPreference && !$checkSelected) {
                        echo "<option selected>$categories[Category]</option>";
                        $checkSelected = true;
                    }
                    else {
                        echo "<option>$categories[Category]</option>";
                    }
                }
                if($checkSelected){
                    echo "<option>No Preference</option>";
                }
                else{
                    echo "<option selected>No Preference</option>";
                }
                $checkSelected=false;
                ?>
            </select>
        </div>
    </form>
    <label>Contract History</label>
    <?php
    $sql = "SELECT EmployeeHistory.teamID, EmployeeHistory.contID, Company.CompName, EmployeeHistory.isActive FROM EmployeeHistory, Contracts, Company WHERE EmployeeHistory.EmployeeID = '$empID' AND EmployeeHistory.contID = Contracts.ContID AND Company.CompID = Contracts.CompID";
    $result = $conn->query($sql);

    // Every row involving the employee's history populates the table
    if ($result->num_rows > 0) {
        echo "<table class = 'w3-table-all w3-card-4' border='1'>
        <tr>
        <th>Team ID</th>
        <th>Contract ID</th>
        <th>Company Name</th>
        <th>isActive</th>
        </tr>";

        while($row = mysqli_fetch_array($result)){
            echo "<tr>";
            echo "<td>" . $row['teamID'] . "</td>";
            echo "<td>" . $row['contID'] . "</td>";
            echo "<td>" . $row['CompName'] . "</td>";
            if($row['isActive'] == 0) {
                echo "<td>Inactive</td>";
            }
            else{
                echo "<td>Active</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    }
    // If there is no employee history, a table with an empty row is created
    else{
        echo "<table class = 'w3-table-all w3-card-4' border='1'>
        <tr>
        <th>Team ID</th>
        <th>Contract ID</th>
        <th>Company Name</th>
        <th>isActive</th>
        </tr>";
        echo "<tr>";
        echo "<td>−</td>";
        echo "<td>−</td>";
        echo "<td>−</td>";
        echo "<td>−</td>";
        echo "</table>";
    }

    ?>
</div>
</body>
</html>