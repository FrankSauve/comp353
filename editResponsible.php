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

        .pad {padding-left:1em;
            padding-top:1em;
        }

    </style>
</head>
<body>
<?php
include('navbar.php');
?>

<div1>
    <?php
    include('db_connection.php');
    $type = (int)$_GET['RespoID'];
    echo "<div class=\"pad\">";
    echo '<form action="#" method="post">';


    $sql = "select fName, mName, lName, contact, Email
            from Responsible
            where RespoID = $type ";

    $result = $conn->query($sql);


    while ($row = $result->fetch_assoc()) {

            echo 'First Name: <input type="text" name ="firstName" id="firstName"
            value= "' . $row['fName'] . '" </input> <br>';

            echo 'Middle Name: <input type="text" name ="middleName" id="middleName"
            value= "' . $row['mName'] . '" </input> <br>';

            echo 'Last Name: <input type="text" name ="lastName" id="lastName"
            value= "' . $row['lName'] . '" </input> <br>';

            echo 'Phone Number: <input type="text" name ="phoneNumber" id="phoneNumber"
            value= "' . $row['contact'] . '" </input> <br>';

            echo 'Email: <input type="text" name ="email" id="email"
            value= "' . $row['Email'] . '" </input> <br>';
    }

        echo '<br><input type ="submit" name="Update" value="Update"/>';
        echo '</form>';


    if (isset($_POST['Update'])) {
        $New_Phone = $_POST['phoneNumber'];
        $New_Email = $_POST['email'];
        $New_Name = $_POST['firstName'];
        $New_middleName = $_POST['middleName'];
        $New_lName = $_POST['lastName'];
        $ID = $type;

        if (preg_match("/^[0-9]{3}-[0-9]{3}-[0-9]{4}$/", $New_Phone) &&
            filter_var($New_Email, FILTER_VALIDATE_EMAIL) &&
            !empty($New_Name) && !empty($New_middleName) && !empty($New_lName)) {
            $sql2 = "update Responsible
            set fName =  '$New_Name',
             mName =  '$New_middleName',
             lName =  '$New_lName',
             contact =  '$New_Phone',
             Email =  '$New_Email'
            where RespoID =  $ID  ";
            if ($conn->query($sql2) === TRUE) {
                echo "<br> Record updated successfully for Responsible:" . $New_Name . " " . $New_lName . " ";
            } else {
                echo "<br> Error updating record " . $conn->error;
            }
        }
        else {
                Echo "Something is wrong with the input please make sure you have filled in all the fields!";
        }

        header('Location: '.$_SERVER['REQUEST_URI']);
    }
    echo "</div>";

    ?>
</div1>
</body>
