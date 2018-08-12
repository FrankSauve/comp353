<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Hours</title>
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
        #addHours {
            margin-top: 30px;
        }
    </style>
</head>
<?php
    include('navbar.php');
    $error = false;

    // Check if the user is authorized to see this page
    // If the user is not logged in
    if (isset($_SESSION['loggedin']) == false && $_SESSION['loggedin'] == false) {
        header('Location: unauthorized.html');
    }
    // If the user is an employee
    else if (!isset($_SESSION['EDID'])) {
        header('Location: unauthorized.html');
    }

    // Get employeeID from username
    $username = $_SESSION['username'];
    $sql = "SELECT EmployeeID FROM Employees WHERE username='$username'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $employeeID = $row['EmployeeID'];

    // Date validation
    if (isset($_POST['date']) && $_POST['date'] == '') {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Date can not be empty.</div>';
        $error = true;
    }
    else if (isset($_POST['date']) && !preg_match("^\d{4}-\d{2}-\d{2}$^", $_POST['date'])) {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Date is not in the YYYY-MM-DD format.</div>';
        $error = true;
    }
    // ContractID validation
    else if (isset($_POST['contractID']) && $_POST['contractID'] == '') {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> ContractID can not be empty.</div>';
        $error = true;
    }
    else if(isset($_POST['contractID']) && !is_numeric($_POST['contractID'])) {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> ContractID must be numeric.</div>';
        $error = true;
    }
    // Hours validation
    else if (isset($_POST['hours']) && $_POST['hours'] == '') {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Hours can not be empty.</div>';
        $error = true;
    }
    else if (isset($_POST['hours']) && !is_numeric($_POST['hours'])) {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Hours must be numeric</div>';
        $error = true;
    }

    if (!$error && isset($_POST['date']) && isset($_POST['contractID']) && isset($_POST['hours'])) {
        $date = $_POST['date'];
        $contractID = $_POST['contractID'];
        $hours = $_POST['hours'];
        $sql = "INSERT INTO Hours (Date, EmployeeID, contID, hours) VALUES ('$date', '$employeeID','$contractID', '$hours')";
        if ($conn->query($sql) === TRUE) {
            echo '<div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> Hours added successfully.</div>';
        }
        else {
            echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Adding hours failed.</div>';
        }
    }
?>
<body>
    <div id="container">
        <h1>My Hours</h1>
        <?php
            // Get hours
            $sql = "SELECT Date, ContID, hours FROM Hours WHERE EmployeeID = '$employeeID'";
            $result = $conn->query($sql);

            echo "<table class = 'w3-table-all w3-card-4' border='1'>
            <tr>
            <th>Date</th>
            <th>Contract ID</th>
            <th>Hours</th>
            </tr>";
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row['Date'] . "</td>";
                echo "<td>" . $row['ContID'] . "</td>";
                echo "<td>" . $row['hours'] . "</td>";
                echo "</tr>";
            }
            echo '</table>';
        ?>
        <h1 id="addHours">Add Hours</h1>
        <form action="employee_hours.php" method="post">
            <div class="form-group">
                <label>Date (YYYY-MM-YY)</label>
                <input id="date" name="date" type="text" class="form-control" placeholder="YYYY-MM-DD">
            </div>
            <div class="form-group">
                <label>Contract ID</label>
                <input id="contractID" name="contractID" type="text" class="form-control" placeholder="Contract ID">
            </div>
            <div class="form-group">
                <label>Hours</label>
                <input id="hours" name="hours" type="text" class="form-control" placeholder="Hours">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>
</html>