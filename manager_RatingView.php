<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <style>
        .pad {
            margin-top: 30px;
            margin-left: 200px;
            margin-right: 200px;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<?php
include('navbar.php');
?>
<div>
    <?php
    include('db_connection.php');
    $findManager = $_GET['ID'];

    echo "<div class=\"pad\">";
    echo '<form action="#" method="post">';

    //Searching for the manager's team ID.
    $sql = "select max(EmployeeHistory.ContID), Teams.TeamID, Employees.fName, Employees.lName from EmployeeHistory
            inner join Teams  on EmployeeHistory.teamID = Teams.TeamID
            inner join Employees on Teams.ManagerID = Employees.EmployeeID
            where contID ='" . $findManager . "'";
    $result = $conn->query($sql);

    while ($row = $result->fetch_assoc()) {
        $findTeam = $row['TeamID'];
    }

    // Finds all the ratings given by other companies to the same manager, based in TeamID
    $sql1 = "select EmployeeHistory.Teamid, Contracts.Rating, Company.CompName ,EmployeeHistory.ContID from EmployeeHistory
            inner join Contracts on EmployeeHistory.ContID = Contracts.ContID
            inner join Company on Contracts.CompID = Company.CompID
            where teamID = ' $findTeam '  and EmployeeHistory.ContID != ' $findManager '
            group by ContID";
    $result1 = $conn->query($sql1);

    echo "<table class=\"w3-table-all w3-card-4\" border = 1> 
        <tr>
        <td><Strong>Company Name</Strong></td>
        <td><Strong>Rating Given</Strong></td>
        </tr>";

    while ($row1 = $result1->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row1['CompName'] . "</td>";
        echo "<td>" . $row1['Rating'] . "</td>";
       echo "</tr>";
    }

    echo "</div>";

    $conn->close();
    ?>
</div>
</body>
