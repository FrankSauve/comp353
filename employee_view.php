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
?>

<body>
<div id="container">
    <h1>My Profile</h1>
    <form name="profileOptions" method="get">
        <div class="form-group">
            <label>Contract History</label>
            <?php
            $sql = "SELECT EmployeeHistory.teamID, EmployeeHistory.contID, Company.CompName, EmployeeHistory.isActive FROM EmployeeHistory, Contracts, Company WHERE EmployeeHistory.EmployeeID = '$empID' AND EmployeeHistory.contID = Contracts.ContID AND Company.CompID = Contracts.CompID";
            $result = $conn->query($sql);

            // Every row involving the employee's history populates the table
            if ($result->num_rows > 0) {
                echo "<table border='1'>
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
                echo "<table border='1'>
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
        <div class="form-group">
            <label>Contract Preference</label>
            <select class="form-control" id="pref" name="preference">
                <?php

                $sql = "SELECT Category FROM Preferences WHERE EmployeeID = '$empID'";
                $result = $conn->query($sql);
                if($result->num_rows > 0){
                    //add selected option
                    $selectedCategory = $result['Category'];
                    echo "<option selected>$selectedCategory</option>";

                    //add other options
                    $sql = "SELECT DISTINCT Category FROM Preferences WHERE EmployeeID != 'empID' AND Category !='$selectedCategory'";
                    $result = $conn->query($sql);
                    while($categories = $result->fetch_assoc()) {
                        echo "<option>" . $categories['Category'] . "</option>";
                    }
                    echo "<option>No Preference</option>";
                }
                else{
                    // Insert possible preference options
                    $sql = "SELECT DISTINCT Category FROM Preferences WHERE EmployeeID != 'empID'";
                    $result = $conn->query($sql);
                    while($categories = $result->fetch_assoc()) {
                        echo "<option>" . $categories['Category'] . "</option>";
                    }
                    echo "<option selected>No Preference</option>";
                }
                ?>
            </select>
        </div>
    </form>
</div>
</body>
</html>