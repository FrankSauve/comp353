<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Top Clients</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
          crossorigin="anonymous">
    <style>
        .tftable { margin-right:100px;}

    </style>
</head>

<body>

<?php include('navbar.php');
include('db_connection.php');



echo "</br>";
echo "<h5>Contracts Recorded Within the Last 10 Days in All Categories</h5>";
echo "</br>";

$query = mysqli_query($conn, "select Contracts.*, Company.CompName, Employees.fName, Employees.lName
                                    from Contracts 
                                    inner join Company on Contracts.CompID = Company.CompID 
                                    inner join CreatedBy on Contracts.contID = CreatedBy.contID 
                                    inner join Employees on CreatedBy.EmployeeID = Employees.EmployeeID 
                                    where StartDate >= (CURDATE()-10) order by StartDate, ContID;");

echo "<div style= 'float: left'>
      <table class = 'tftable' border='2'>
            
            <tr>
                <td align='center'>Contract ID</td>
                <td align='center'>Company ID</td>
                <td align='center'>Company Name</td>
                <td align='center'>Responsible ID</td>
                <td align='center'>AVC</td>
                <td align='center'>IV</td>
                <td align='center'>StartDate</td>
                <td align='center'>Category</td>
                <td align='center'>Type Of Service</td>
                <td align='center'>Sales Associate</td>
            </tr>";

while ($row = mysqli_fetch_array($query)) {
    echo "<tr>";
    echo "<td align='center'>" . $row['ContID'] . "</td>";
    echo "<td align='center'>" . $row['CompID'] . "</td>";
    echo "<td nowrap='' align='center'>" . $row['CompName'] . "</td>";
    echo "<td align='center'>" . $row['RespoID'] . "</td>";
    echo "<td align='center'>$" . $row['AVC'] . "</td>";
    echo "<td align='center'>$" . $row['IV'] . "</td>";
    echo "<td nowrap='' align='center'>" . $row['StartDate'] . "</td>";
    echo "<td align='center'>" . $row['Category'] . "</td>";
    echo "<td align='center'>" . $row['TypeOfService'] . "</td>";
    echo "<td nowrap='' align='center'>" . $row['fName'] ." ". $row['lName']."</td>";
    echo "</tr>";
}
echo "</table></div>";



?>


</body>
</html>
