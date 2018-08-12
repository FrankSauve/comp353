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
<div>
<?php
include('db_connection.php');

// Check if the user is authorized to see this page
// If the user is not logged in
if (isset($_SESSION['loggedin']) == false && $_SESSION['loggedin'] == false) {
    header('Location: unauthorized.html');
}

if (isset($_SESSION['username']) == TRUE) {
    $user = ($_SESSION['username']);
}
echo '<INPUT TYPE="text" NAME="firstbox" value = "' . $user . '"style="display: none" </input>';

echo "<div class=\"pad\">";
echo '<form action="#" method="post">';

$sql = "SELECT ContID FROM Contracts inner join Company on Contracts.CompID = Company.CompID
                where Company.username = '" . $user . "'";
$result = $conn->query($sql);

echo '<label>Company ID</label>';
echo '<select name="Contracts_Selection" class="form-control" >';
echo '<option value=""></option>';
// output data of each row
while ($row = $result->fetch_assoc()) {
    echo '<option value="' . $row['ContID'] . '">' . $row['ContID'] . '</option>';
}
echo '</select><br>';
echo '     ' . '<input type ="submit" name="Enter" value="Submit" class="btn btn-primary"/>';
echo '</form>';

if (isset($_POST['Enter'])) {
    $selected_Cont = (int)$_POST['Contracts_Selection'];
    $sql2 = "select CompName, Contracts.ContID from Company 
                  inner join Contracts on Company.CompID = Contracts.CompID 
                  where ContID = " . $selected_Cont . " ";
    $result2 = $conn->query($sql2);

    while ($row2 = $result2->fetch_assoc()) {
        echo "<h5>The company selected is <Strong>" . $row2['CompName'] . "</Strong> and contract # is <Strong>"
            . $row2['ContID'] . "</Strong></h5>";
    }

    echo "<br> click <a href ='manager_RatingView.php?ID=$selected_Cont'>here</a> to see other ratings that your contract manager has.";

    echo '<form action="#" method="post">';

    $sql3 = "select ContID, Company.CompName, Responsible.fName, Responsible.lName, AVC, IV, StartDate, Category, 
                 TypeOfService, Rating,  Company.PostalCode, PostalCode.City, PostalCode.Province  from Contracts 
                 inner join Company on Contracts.CompID = Company.CompID
                 inner join Responsible on Contracts.RespoID = Responsible.RespoID
                 Inner join PostalCode on Company.PostalCode = PostalCode.PostalCode Where ContID =" . $selected_Cont . " ";


    $sql4 = "select DISTINCT (fName),lName from Responsible";

    $sql5 = "select Category from TypeOfContracts";

    $sql6 = "select PostalCode, City, Province from PostalCode";

    $sql7 = "select CompName from Company";

    $result3 = $conn->query($sql3);
    $result4 = $conn->query($sql4);
    $result5 = $conn->query($sql5);
    $result6 = $conn->query($sql6);
    $result7 = $conn->query($sql7);

    while ($row3 = $result3->fetch_assoc()) {

        echo '<br><label>Contract ID:</label> <input type="text" name ="ContID" id="ContID" class="form-control" value= "' . $row3['ContID'] . '" readonly </input>';

        echo '<br>Company Name: <input type="text" name ="CompName" id="CompName" class="form-control" value= "' . $row3['CompName'] . '" readonly </input>';

        echo '<br>Responsible Name: <input type="text" name ="Responsible" id="Responsible" class="form-control" value= "' . $row3['fName'] . " " . $row3['lName'] . '" readonly </input>';

        echo '<br>Annual Contract Value: <input type="text" name="AVC" id="AVC" class="form-control" value= "' . $row3['AVC'] . '" readonly </input>';

        echo '<br>Initial Value: <input type="text" name="IV" id="IV" class="form-control" value= "' . $row3['IV'] . '" readonly </input>';

        echo '<br>Start date of the contract: <input type="text" name="StartDate" id="StartDate" class="form-control" value= "' . $row3['StartDate'] . '" 
                    readonly </input>';

        echo '<br>Category: <input type="text" name="Category" id="Category" class="form-control" value= "' . $row3['Category']  . '" readonly </input>';

        echo '<br>Address: <input type="text" name="Address:" id="Address:" class="form-control" value= "' . $row3['PostalCode'] . ", " . $row3['City'] . ", " . $row3['Province'] . '" readonly </input>';

        echo '<br>Rating: <input type="text" name = "Rating" id="Rating" class="form-control" value= "' . $row3['Rating'] . '" readonly </input>
              <span style="color:#A9A9A9;">1 = Dissatisfied, 10 = Satisfied </span>';

        echo '<br> Change Rating: <span style="color:#A9A9A9;">1 </span><input type="radio" name = "radio" id="radio" value= "1" </input>';

        echo '<span style="color:#A9A9A9;">  2 </span><input type="radio" name = "radio" id="radio" value= "2" </input>';

        echo '<span style="color:#A9A9A9;">  3 </span><input type="radio" name = "radio" id="radio" value= "3" </input>';

        echo '<span style="color:#A9A9A9;">  4 </span><input type="radio" name = "radio" id="radio" value= "4" </input>';

        echo '<span style="color:#A9A9A9;">  5 </span><input type="radio" name = "radio" id="radio" value= "5" </input>';

        echo '<span style="color:#A9A9A9;">  6 </span><input type="radio" name = "radio" id="radio" value= "6" </input>';

        echo '<span style="color:#A9A9A9;">  7 </span><input type="radio" name = "radio" id="radio" value= "7" </input>';

        echo '<span style="color:#A9A9A9;">  8 </span><input type="radio" name = "radio" id="radio" value= "8" </input>';

        echo '<span style="color:#A9A9A9;">  9 </span><input type="radio" name = "radio" id="radio" value= "9" </input>';

        echo '<span style="color:#A9A9A9;">  10 </span><input type="radio" name = "radio" id="radio" value= "10" </input>';


    }
    echo '<br><input type ="submit" name="Update" value="Update" class="btn btn-primary"/>';
    echo '</form>';
}
if (isset($_POST['Update'])) {
    $Select_Contract = (int)$_POST['ContID'];
    $rating_update = (int)$_POST['radio'];


    if(isset($_POST['radio']))
    {
        $sql8 = "Update Contracts set Rating = $rating_update where ContID = $Select_Contract ";
        if ($conn->query($sql8) === TRUE) {
            //  echo "Record updated successfully for Contract ID: " . $selected_Comp . $Select_Contract;
        } else {
            echo "Error updating record: " . $rating_update . $conn->error;
        }
        echo '<br><div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> Record has been updated successfully.</div>';
    }
    else {
        echo '<br><div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Something is wrong with the input please make sure you have filled in all the fields correctly! </div>';
    }
}

echo "</div>";

$conn->close();
?>
</div>
</body>
