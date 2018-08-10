<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    <style>
        .pad {
            padding-left: 1em;
            padding-top: 1em;
        }

    </style>
</head>
<body>
<?php
include('navbar.php');
?>

<div1>
<?php
echo "<div class=\"pad\">";
include('db_connection.php');
echo '<form action="#" method="post">';

$sql = "SELECT Category FROM TypeOfContracts";
$result = $conn->query($sql);

echo 'Please select contract type:   <select name="Contract_Selection" >';
echo '<option value=""></option>';
// output data of each row
while ($row = $result->fetch_assoc()) {
    echo '<option value="' . $row['Category'] . '">' . $row['Category'] . '</option>';
}
echo '</select>';
echo '     ' . '<input type ="submit" name="submit" value="Submit"/>';
echo '</form>';
#$conn->close();
'<br/>';

if (isset($_POST['submit'])) {
    $selected_val = $_POST['Contract_Selection'];
    echo "Contract type selected: <Strong>" . $selected_val . "</Strong><br>";
    echo "<br> The following contract type is associated with the following companies";
    echo '<form action="#" method="post">';


    $sql1 = "SELECT  Contracts.contID, Company.CompName, Contracts.StartDate
            from Contracts
            inner join Company on Contracts.CompID = Company.CompID
            where Category = '$selected_val' order by StartDate;";
    $result1 = $conn->query($sql1);
    $num_rows = mysqli_num_rows($result1);
    echo $num_rows . " Results Found" . '</br>' . '</br>';

    echo "<table border='1'>
            <tr>
                <td>Contract ID</td>
                <td>Company Name</td>
                <td>Start Date</td>
            </tr>";
    // output data of each row
    while ($row1 = $result1->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row1['contID'] . "</td>";
        echo "<td>" . $row1['CompName'] . "</td>";
        echo "<td>" . $row1['StartDate'] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
}
?>