<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">


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

<div1>
    <?php
    include('db_connection.php');
    $type = (int)$_GET['RespoID'];
    echo "<div class=\"pad\">";
    echo '<form action="#" method="post">';
    $error = false;


    $sql = "select fName, mName, lName, contact, Email
            from Responsible
            where RespoID = $type ";

    $result = $conn->query($sql);


    while ($row = $result->fetch_assoc()) {

        echo 'First Name: <input type="text" name ="firstName" id="firstName" class="form-control"
            value= "' . $row['fName'] . '" </input> <br>';

        echo 'Middle Name: <input type="text" name ="middleName" id="middleName" class="form-control"
            value= "' . $row['mName'] . '" </input> <br>';

        echo 'Last Name: <input type="text" name ="lastName" id="lastName" class="form-control"
            value= "' . $row['lName'] . '" </input> <br>';

        echo 'Phone Number: <input type="text" name ="phoneNumber" id="phoneNumber" class="form-control"
            value= "' . $row['contact'] . '" </input> <br>';

        echo 'Email: <input type="text" name ="email" id="email" class="form-control"
            value= "' . $row['Email'] . '" </input> <br>';
    }

    echo '<br><input type ="submit" name="Update" value="Update" class="btn btn-primary"/>';
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
            !empty($New_Name) && !empty($New_middleName) && !empty($New_lName))
        {
            $sql2 = "update Responsible
            set fName =  '$New_Name', mName =  '$New_middleName', lName =  '$New_lName',
            contact =  '$New_Phone',Email ='$New_Email'
            where RespoID =  $ID  ";

            if ($conn->query($sql2) === TRUE) {
                header('Refresh:5;Location: '.$_SERVER['REQUEST_URI']);
                echo '<br><div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> Record updated successfully for Responsible:"' .$New_Name. " " . $New_lName . '"</div>';

            }

            else {
                echo '<br> Error updating record " . $conn->error';
            }
        }

        else {
            header('Refresh:5;Location: '.$_SERVER['REQUEST_URI']);
            echo '<br><div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Something is wrong with the input please make sure you have filled in all the fields! </div>';
        }
    }

    echo "</div>";

    ?>
</div1>
</body>
