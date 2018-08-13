<?php include('navbar.php'); ?>
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

<?php
// Check if the user is authorized to see this page
// If the user is not logged in
if (isset($_SESSION['loggedin']) == false && $_SESSION['loggedin'] == false) {
    echo "<script type='text/javascript'>document.location.href='unauthorized.html';</script>";
}
// If the user is not a manager
else if (isset($_SESSION['EDID']) && $_SESSION['EDID'] != 1) {
    echo "<script type='text/javascript'>document.location.href='unauthorized.html';</script>";
}
?>
<div id="container">
<?php
include('db_connection.php');

echo "<h5>Contracts Recorded Within the Last 10 Days in All Categories</h5>";

$query = mysqli_query($conn, "select Contracts.*, Company.CompName, Employees.fName, Employees.lName
                                    from Contracts 
                                    inner join Company on Contracts.CompID = Company.CompID 
                                    inner join CreatedBy on Contracts.contID = CreatedBy.contID 
                                    inner join Employees on CreatedBy.EmployeeID = Employees.EmployeeID 
                                    where StartDate >= (CURDATE()-10) order by StartDate, ContID;");

echo "<div class=\"pad\">
      <table  class = 'w3-table-all w3-card-4' border='2'>
            
            <tr>
                <td>Contract ID</td>
                <td>Company ID</td>
                <td>Company Name</td>
                <td>Responsible ID</td>
                <td>AVC</td>
                <td>IV</td>
                <td>StartDate</td>
                <td>Category</td>
                <td>Type Of Service</td>
                <td>Sales Associate</td>
            </tr>";

while ($row = mysqli_fetch_array($query)) {
    echo "<tr>";
    echo "<td>" . $row['ContID'] . "</td>";
    echo "<td>" . $row['CompID'] . "</td>";
    echo "<td nowrap=''>" . $row['CompName'] . "</td>";
    echo "<td>" . $row['RespoID'] . "</td>";
    echo "<td>$" . $row['AVC'] . "</td>";
    echo "<td>$" . $row['IV'] . "</td>";
    echo "<td nowrap=''>" . $row['StartDate'] . "</td>";
    echo "<td>" . $row['Category'] . "</td>";
    echo "<td>" . $row['TypeOfService'] . "</td>";
    echo "<td nowrap=''>" . $row['fName'] ." ". $row['lName']."</td>";
    echo "</tr>";
}
echo "</table></div>";
?>
</div>
</body>
</html>
