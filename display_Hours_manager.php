<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Employee Hours</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
          crossorigin="anonymous">
    <style>
        #container {
            margin-top: 30px;
            margin-left: 200px;
            margin-right: 200px;
            margin-bottom: 30px;
        }
    </style>
</head>

<body>
<?php include('navbar.php');
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
<?php
include('db_connection.php');
$id = (int)$_GET['id'];
$first = $_GET['first'];
$last = $_GET['last'];

echo '<h5>Select period to view hours for ' . $first ." " . $last . '</h5>';

$sql = "select Year(Hours.Date), Employees.EmployeeID, Employees.fName, Employees.lName, sum(Hours.hours), Company.CompName, Contracts.contID
from Employees, Hours, Contracts, Company
where Hours.EmployeeID = Employees.EmployeeID and
Contracts.contID = Hours.contID and
Contracts.CompID = Company.CompID and
Employees.EmployeeID = $id 
group by Year(Date);";
$result = $conn->query($sql);
$num_rows = $result->num_rows;
if ($num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $year = $row['Year(Hours.Date)'];
        $fname = $row['fName'];
        $lname = $row['lName'];
        echo '<h6><a href="hours_report_manager.php?year='.$year.'&fname='.$fname.'&lname='.$lname.'&id='.$id.'">' . $year . '</a> </br>';
    }
    echo '<h6><a href="hours_report_manager.php?year=all&fname='.$fname.'&lname='.$lname.'&id='.$id.'">All</a> </br>';
} else
    while ($row = mysqli_fetch_array($sql)) {
        echo '<h6><a href="hours_report_manager.php?year='.$year.'">' . $year . '</a> </br>';
    }
?>
</div>
</body>
</html>