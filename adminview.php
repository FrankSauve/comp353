<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    <style>
        #container {
            margin-top: 30px;
            margin-left: 200px;
            margin-right:200px;
        }

        div1 {padding-left:1em;}

    </style>
</head>
<body>
<?php include('navbar.php')?>

<div1>
    Please Select a contract:
    <?php

    include('db_connection.php');

    echo '<form action="#" method="post">';

    $sql = "SELECT  DISTINCT(CompanyName)  FROM Contracts";
    $result = $conn->query($sql);

    echo '<select name="Contracts_Selection">';
    echo '<option value=""></option>';
    // output data of each row
     while($row = $result->fetch_assoc()) {
         echo '<option value="'.$row['CompanyName'].'">'.$row['CompanyName'].'</option>';
     }
     echo '</select>';
     echo '<input type ="submit" name="submit" value="Submit"/>';
     echo '</form>';
    $conn->close();
    '<br/>';

    if(isset($_POST['submit'])){
             $selected_val = $_POST['Contracts_Selection'];
        echo "you have selected this shit and I dislike you: " .$selected_val;
    }
    ?>

</div1>

</body>