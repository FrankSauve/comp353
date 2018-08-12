<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Top Clients</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        .pad {
                margin-top: 30px;
                margin-left: 200px;
                margin-right: 200px;
                margin-bottom: 30px;
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
echo "<h5>Quebec Employees</h5>";

$query1 = mysqli_query($conn, "select Employees.EmployeeID, Employees.fName,lName, Insurance.typeDescript, EmployeeType.Descript, PostalCode.Province From Employees 
                                        inner join EmployeeHistory on Employees.EmployeeID = EmployeeHistory.EmployeeID
                                        inner join Contracts on EmployeeHistory.ContID = Contracts.ContID
                                        inner join Company on Contracts.CompID = Company.CompID 
                                        inner join PostalCode on Company.PostalCode = PostalCode.PostalCode
                                        inner join Insurance on Employees.InsuranceID = Insurance.InsuranceID
                                        inner join EmployeeType on Employees.EDID = EmployeeType.EDID
                                        where PostalCode.Province ='QC' group by Employees.EmployeeID;");

$num_rows = mysqli_num_rows($query1);
echo $num_rows . " Results Found" . '</br>' . '</br>';

echo "<div class=\"pad\">
      <table class = 'w3-table-all w3-card-4' border='2'>
            
            <tr>
                <th>Employee ID</th>
                <th>Employee Name</th>
                <th>Type of Coverage</th>
                <th>Type of Employee</th>
                <th>Province</th>
            </tr>";

while ($row1 = mysqli_fetch_array($query1)) {
    echo "<tr>";
    echo "<td>" . $row1['EmployeeID'] . "</td>";
    echo "<td>" . $row1['fName'] . " " . $row1['lName'] . "</td>";
    echo "<td>" . $row1['typeDescript'] . "</td>";
    echo "<td>" . $row1['Descript'] . "</td>";
    echo "<td>" . $row1['Province'] . "</td>";
    echo "</tr>";
}
echo "</table></div>";
?>
</div>
</body>
</html>
