<?php include('navbar.php');?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Top Contracts</title>
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
    <h1>Top Contracts</h1>
<?php
include('db_connection.php');



echo "</br>";
echo "<h5>List of clients who have the highest number of contracts in each line of business</h5>";
echo "</br>";

$query = mysqli_query($conn, "select Company.CompID,Company.CompName, count(TypeOfService)
                                        from Contracts
                                        inner join Company on Contracts.CompID = Company.CompID
                                        where TypeOfService = 'Cloud'
                                        group by Company.CompName order by count(TypeOfService) desc limit 1;");

echo "<div class=\"pad\">
<caption align='left'>Cloud</caption>
      <table class = 'w3-table-all w3-card-4' border='2'>
            
            <tr>
                <th align='center'>Company ID</th>
                <th align='center'>Company Name</th>
                <th align='center'>Number of Contracts</th>
            </tr>";

while ($row = mysqli_fetch_array($query)) {
    echo "<tr>";
    echo "<td align='center'>" . $row['CompID'] . "</td>";
    echo "<td align='center'>" . $row['CompName'] . "</td>";
    echo "<td align='center'>" . $row['count(TypeOfService)'] . "</td>";
    echo "</tr>";
}
echo "</table></div>";


$query2 = mysqli_query($conn, "select Company.CompID,Company.CompName, count(TypeOfService)
                                        from Contracts
                                        inner join Company on Contracts.CompID = Company.CompID
                                        where TypeOfService = 'On-premises'
                                        group by Company.CompName order by count(TypeOfService) desc limit 1;");

echo "<div class=\"pad\">
</br>
</br>
<caption>On-premises</caption>
      <table class = 'w3-table-all w3-card-4' border='2'>
            
            <tr>
                <th align='center'>Company ID</th>
                <th align='center' >Company Name</th>
                <th align='center'>Number of Contracts</th>
            </tr>";

while ($row2 = mysqli_fetch_array($query2)) {
    echo "<tr>";
    echo "<td align='center'>" . $row2['CompID'] . "</td>";
    echo "<td align='center'>" . $row2['CompName'] . "</td>";
    echo "<td align='center'>" . $row2['count(TypeOfService)'] . "</td>";
    echo "</tr>";
}
echo "</table></div>";
?>
</div>

</body>
</html>
