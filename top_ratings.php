<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Top Ratings</title>
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

echo "</br>";
echo "<h5>Top Ratings for Category Silver Grouped by Cities</h5>";
echo "</br>";

$query = mysqli_query($conn, "select Contracts.contID, Company.CompName, PostalCode.City, ar
from Contracts
inner join Company on Contracts.CompID = Company.CompID
inner join PostalCode on Company.PostalCode = PostalCode.PostalCode
join (
    select Contracts.contID, avg(Rating) as ar
    from Contracts
    where Contracts.Category = 'Silver'
    group by CompID
    order by ar desc, CompID
    limit 20
) dt on Contracts.contID = dt.contID
group by PostalCode.City order by ar desc;");

echo "<div class=\"pad\">
      <table class = 'w3-table-all w3-card-4' border='2'>
            
            <tr>
                <th align='center'>Company Name</th>
                <th align='center'>City</th>
                <th align='center'>Avergae Rating</th>
            </tr>";

while ($row = mysqli_fetch_array($query)) {
    echo "<tr>";
    echo "<td align='center'>" . $row['CompName'] . "</td>";
    echo "<td align='center'>" . $row['City'] . "</td>";
    echo "<td align='center'>" . $row['ar'] . "</td>";
    echo "</tr>";
}
echo "</table></div>";

echo "</br>";

echo "</br>";

$query2 = mysqli_query($conn, "select Contracts.contID, Company.CompName, PostalCode.City, ar
from Contracts
inner join Company on Contracts.CompID = Company.CompID
inner join PostalCode on Company.PostalCode = PostalCode.PostalCode
join (
    select Contracts.contID, avg(Rating) as ar
    from Contracts
    where Contracts.Category = 'Gold'
    group by CompID
    order by ar desc, CompID
    limit 20
) dt on Contracts.contID = dt.contID
group by PostalCode.City order by ar desc;");

echo "<div class=\"pad\">
<br>
<h5>Top Ratings for Category Gold Grouped by Cities</h5>
      <table class = 'w3-table-all w3-card-4' border='2'>
            
            <tr>
                <td align='center'>Company Name</td>
                <td align='center'>City</td>
                <td align='center'>Avergae Rating</td>
            </tr>";

while ($row2 = mysqli_fetch_array($query2)) {
    echo "<tr>";
    echo "<td align='center'>" . $row2['CompName'] . "</td>";
    echo "<td align='center'>" . $row2['City'] . "</td>";
    echo "<td align='center'>" . $row2['ar'] . "</td>";
    echo "</tr>";
}
echo "</table></div>";

echo "</br>";

echo "</br>";

$query3 = mysqli_query($conn, "select Contracts.contID, Company.CompName, PostalCode.City, ar
from Contracts
inner join Company on Contracts.CompID = Company.CompID
inner join PostalCode on Company.PostalCode = PostalCode.PostalCode
join (
    select Contracts.contID, avg(Rating) as ar
    from Contracts
    where Contracts.Category = 'Premium'
    group by CompID
    order by ar desc, CompID
    limit 20
) dt on Contracts.contID = dt.contID
group by PostalCode.City order by ar desc;");

echo "<div class=\"pad\">
<br>
<h5>Top Ratings for Category Premium Grouped by Cities</h5>
      <table class = 'w3-table-all w3-card-4' border='2'>
            
            <tr>
                <td align='center'>Company Name</td>
                <td align='center'>City</td>
                <td align='center'>Avergae Rating</td>
            </tr>";

while ($row3 = mysqli_fetch_array($query3)) {
    echo "<tr>";
    echo "<td align='center'>" . $row3['CompName'] . "</td>";
    echo "<td align='center'>" . $row3['City'] . "</td>";
    echo "<td align='center'>" . $row3['ar'] . "</td>";
    echo "</tr>";
}
echo "</table></div>";

echo "</br>";

echo "</br>";

$query4 = mysqli_query($conn, "select Contracts.contID, Company.CompName, PostalCode.City, ar
from Contracts
inner join Company on Contracts.CompID = Company.CompID
inner join PostalCode on Company.PostalCode = PostalCode.PostalCode
join (
    select Contracts.contID, avg(Rating) as ar
    from Contracts
    where Contracts.Category = 'Diamond'
    group by CompID
    order by ar desc, CompID
    limit 20
) dt on Contracts.contID = dt.contID
group by PostalCode.City order by ar desc;");

echo "<div class=\"pad\">
<br>
<h5>Top Ratings for Category Diamond Grouped by Cities</h5>
      <table class = 'w3-table-all w3-card-4' border='2'>
            
            <tr>
                <td align='center'>Company Name</td>
                <td align='center'>City</td>
                <td align='center'>Avergae Rating</td>
            </tr>";

while ($row4 = mysqli_fetch_array($query4)) {
    echo "<tr>";
    echo "<td align='center'>" . $row4['CompName'] . "</td>";
    echo "<td align='center'>" . $row4['City'] . "</td>";
    echo "<td align='center'>" . $row4['ar'] . "</td>";
    echo "</tr>";
}
echo "</table></div>";
?>
</div>
</body>
</html>
