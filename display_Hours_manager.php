<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Employee Hours</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
          crossorigin="anonymous">
</head>

<body>
<?php include('navbar.php');
include('db_connection.php');
$id = (int)$_GET['id'];
$first = $_GET['first'];
$last = $_GET['last'];

echo '<h5>Select period to view hours for ' . $first ." " . $last . '</h5>';


$query = mysqli_query($conn, "select Year(Hours.Date), Employees.EmployeeID, Employees.fName, Employees.lName, sum(Hours.hours), Company.CompName, Contracts.contID
from Employees, Hours, Contracts, Company
where Hours.EmployeeID = Employees.EmployeeID and
Contracts.contID = Hours.contID and
Contracts.CompID = Company.CompID and
Employees.EmployeeID = $id 
group by Year(Date);");

$fname = $row['fName'];
$lname = $row['Name'];

$num_rows = mysqli_num_rows($query);
if (!$num_rows <= 1) {
    while ($row = mysqli_fetch_array($query)) {
        $year = $row['Year(Hours.Date)'];
        $fname = $row['fName'];
        $lname = $row['lName'];
        echo '<h6><a href="hours_report_manager.php?year='.$year.'&fname='.$fname.'&lname='.$lname.'&id='.$id.'">' . $year . '</a> </br>';
    }
    echo '<h6><a href="hours_report_manager.php?year=all&fname='.$fname.'&lname='.$lname.'&id='.$id.'">All</a> </br>';
} else
    while ($row = mysqli_fetch_array($query)) {
        echo '<h6><a href="hours_report_manager.php?year='.$year.'">' . $year . '</a> </br>';
    }
?>





</body>
</html>