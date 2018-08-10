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
</head>

<body>
<?php include('navbar.php');
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

    echo "<table border='1'>
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
else

{
    $query = mysqli_query($conn, "select Year(Hours.Date), Employees.EmployeeID, Employees.fName, Employees.lName, sum(Hours.hours), Company.CompName, Contracts.contID
    from Employees, Hours, Contracts, Company
    where Hours.EmployeeID = Employees.EmployeeID and
    Contracts.contID = Hours.contID and
    Contracts.CompID = Company.CompID and
    Employees.EmployeeID = $id 
    group by Contracts.contID;");

        echo "<table border='1'>
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


</body>
</html>
