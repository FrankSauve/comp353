<?php
$year = $_GET['year'];
$first = $_GET['fname'];
$last = $_GET['lname'];
$id = $_GET['id'];
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Employee Hours</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
          crossorigin="anonymous">
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

echo "</br>";
echo '<h5>Hours for ' . $first . " " . $last . ' in ' . $year . '</h5>';
echo "</br>";
if ($year !== 'all') {
    $query = mysqli_query($conn, "select Year(Hours.Date), Employees.EmployeeID, Employees.fName, Employees.lName, sum(Hours.hours), Company.CompName, Contracts.contID
from Employees, Hours, Contracts, Company
where Hours.EmployeeID = Employees.EmployeeID and
Contracts.contID = Hours.contID and
Contracts.CompID = Company.CompID and
Employees.EmployeeID = $id and
Year(Hours.Date) = $year 
group by Contracts.contID;");

    echo "<table class = 'w3-table-all w3-card-4' border='2'>
            <tr>
                <th>Contract ID</th>
                <th>Company Name</th>
                <th>Hours</th>
            </tr>";

    while ($row = mysqli_fetch_array($query)) {
        echo "<tr>";
        echo "<td>" . $row['contID'] . "</td>";
        echo "<td>" . $row['CompName'] . "</td>";
        echo "<td>" . $row['sum(Hours.hours)'] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
}
else

{
    $query = mysqli_query($conn, "select Year(Hours.Date), Employees.EmployeeID, Employees.fName, Employees.lName, sum(Hours.hours), Company.CompName, Contracts.contID
    from Employees, Hours, Contracts, Company
    where Hours.EmployeeID = Employees.EmployeeID and
    Contracts.contID = Hours.contID and
    Contracts.CompID = Company.CompID and
    Employees.EmployeeID = $id 
    group by Contracts.contID;");

        echo "<table class = 'w3-table-all w3-card-4' border='2'>
                <tr>
                    <td>Contract ID</td>
                    <td>Company Name</td>
                    <td>Hours</td>
                </tr>";

        while ($row = mysqli_fetch_array($query)) {
            echo "<tr>";
            echo "<td>" . $row['contID'] . "</td>";
            echo "<td>" . $row['CompName'] . "</td>";
            echo "<td>" . $row['sum(Hours.hours)'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";
}
?>
</div>
</body>
</html>
