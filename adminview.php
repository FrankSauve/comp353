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
// Check if the user is authorized to see this page
// If the user is not logged in
if (isset($_SESSION['loggedin']) == false && $_SESSION['loggedin'] == false) {
    header('Location: unauthorized.html');
}
// If the user is not an admin
else if (isset($_SESSION['EDID']) && $_SESSION['EDID'] != 4) {
    header('Location: unauthorized.html');
}
?>

<div1>
    <?php
    echo "<div class=\"pad\">";
    include('db_connection.php');
    echo '<form action="#" method="post">';

    $sql = "SELECT DISTINCT(CompName) FROM Company";
    $result = $conn->query($sql);

    echo 'Please select a Company:   <select class="form-control" name="Company_Selection" >';
    echo '<option value=""></option>';
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        echo '<option value="' . $row['CompName'] . '">' . $row['CompName'] . '</option>';
    }
    echo '</select><br>';
    echo '     ' . '<input type ="submit" name="submit" value="Submit" class="btn btn-primary"/>';
    echo '</form>';
    #$conn->close();
    '<br/>';

    if (isset($_POST['submit'])) {
        $selected_val = $_POST['Company_Selection'];
        echo "<br> This Company has the following Contracts, please click on the contract you want to edit or review:<br>";
        echo '<form action="#" method="post">';

        $sql1 = "SELECT  ContID FROM Contracts inner join Company on Contracts.CompID = Company.CompID
                where Company.CompName = '" . $selected_val . "'";
        $result1 = $conn->query($sql1);

        echo '<select name="Contracts_Selection" class="form-control" >';
        echo '<option value=""></option>';
        // output data of each row
        while ($row1 = $result1->fetch_assoc()) {
            echo '<option value="' . $row1['ContID'] . '">' . $row1['ContID'] . '</option>';
        }
        echo '</select><br>';
        echo '     ' . '<input type ="submit" name="Enter" value="Submit" class="btn btn-primary"/>';
        echo '</form>';
    }
    if (isset($_POST['submit'])) {

    }
    echo '<br>';

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

            echo '<br><label>Contract ID:</label> <input type="text" name ="ContID" id="ContID" class="form-control" value= "' . $row3['ContID'] . '" readonly </input> <br>';

            echo '<br>Company Name: <select class="form-control" name="CompanyName_Selection" >';
            echo '<option selected="selected"> ' . $row3['CompName'] . '</option>';
            // output data of each row
            while ($row7 = $result7->fetch_assoc()) {
                echo '<option value="' . $row7['CompName'] . '">'
                    . $row7['CompName'] . '</option>';
            }
            echo '</select><br>';

            echo 'Responsible Name: <select name="Responsible_Selection" class="form-control">';
            echo '<option selected="selected"> ' . $row3['fName'] . " " . $row3['lName'] . '</option>';
            // output data of each row
            while ($row4 = $result4->fetch_assoc()) {
                echo '<option value="' . $row4['fName'] . " " . $row4['lName'] . '">'
                    . $row4['fName'] . " " . $row4['lName'] . '</option>';
            }
            echo '</select><br>';


            echo 'Annual Contract Value: <input type="text" name="AVC" id="AVC" class="form-control" value= "' . $row3['AVC'] . '" </input><br>';


            echo 'Initial Value: <input type="text" name="IV" id="IV" class="form-control" value= "' . $row3['IV'] . '" </input><br>';


            echo 'Start date of the contract: <input type="text" name="StartDate" id="StartDate" class="form-control" value= "' . $row3['StartDate'] . '" 
                    </input> <span style="color:#A9A9A9;">If changing the date please use the same style.</span><br>';


            echo 'Category: <select name="Category_Selection" class="form-control">';
            echo '<option selected="selected"> ' . $row3['Category'] . '</option>';
            // output data of each row
            while ($row5 = $result5->fetch_assoc()) {
                echo '<option value="' . $row5['Category'] . '">'
                    . $row5['Category'] . '</option>';
            }
            echo '</select><br>';


            echo 'Address: <select name="Address_Selection" class="form-control">';
            echo '<option selected="selected"> ' . $row3['PostalCode'] . " " . $row3['City'] . " " . $row3['Province'] . '</option>';
            // output data of each row
            while ($row6 = $result6->fetch_assoc()) {
                echo '<option value="' . $row6['PostalCode'] . " " . $row6['City'] . " " . $row6['Province'] . '">'
                    . $row6['PostalCode'] . " " . $row6['City'] . " " . $row6['Province'] . '</option>';
            }
            echo '</select><br>';


            echo 'Rating Given by client: <input type="text" id="Rating" class="form-control" value= "' . $row3['Rating'] . '" readonly </input> <br>';
        }
        echo '<br><input type ="submit" name="Update" value="Update" class="btn btn-primary"/>';
        echo '    <input type ="submit" name="Delete" value="Delete" class="btn btn-primary"/>';
        echo '</form>';
    }

    if (isset($_POST['Update'])) {
        $Select_Contract = (int)$_POST['ContID'];
        $selected_Comp = $_POST['CompanyName_Selection'];
        $selected_Respo = $_POST['Responsible_Selection'];
        $SpiltName = explode(" ", $selected_Respo);
        $selected_AVC = (double)$_POST['AVC'];
        $selected_IV = (double)$_POST['IV'];
        $selected_StartDate = $_POST['StartDate'];
        $selected_Category = $_POST['Category_Selection'];
        $selected_Address = $_POST['Address_Selection'];
        $SpiltAddress = explode(" ", $selected_Address);


        if (preg_match("/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/", $selected_StartDate) &&
            !empty($Select_Contract) && !empty($selected_Comp) && !empty($selected_Respo)
            && !empty($selected_AVC) && !empty($selected_IV) && !empty($selected_StartDate)
            && !empty($selected_Category) && !empty($selected_Address) ) {

            //Update IV value in a contract
            $sql8 = "Update Contracts set IV = $selected_IV where ContID = $Select_Contract ";
            if ($conn->query($sql8) === TRUE) {
              //  echo "Record updated successfully for Contract ID: " . $selected_Comp . $Select_Contract;
            } else {
                echo "Error updating record: " . $selected_IV . $Select_Contract . $conn->error;
            }

            //Update Company name in a contract
            $sql9 = "update Contracts set CompID = (select CompID from Company where CompName = '" . $selected_Comp . "') 
                 where ContID = $Select_Contract";
            if ($conn->query($sql9) === TRUE) {
               // echo "<br>Record updated successfully for Company Name: " . $selected_Comp;
            } else {
                echo "Error updating record: " . $conn->error;
            }

            //Update Responsible
            $sql10 = "update Contracts set RespoID = (select respoID from Responsible where fName like '" . $SpiltName[0] . "'
         and lName like '" . $SpiltName[1] . "')
                 where ContID = $Select_Contract";
            if ($conn->query($sql10) === TRUE) {
              //  echo "<br> Record updated successfully for Responsible:" . $SpiltName[0] . " " . $SpiltName[1];
            } else {
                echo "Error updating record: " . $conn->error;
            }

            //Update AVC
            $sql11 = "update Contracts set AVC = $selected_AVC where ContID = $Select_Contract";
            if ($conn->query($sql11) === TRUE) {
              //  echo "<br>Record updated successfully for Annual value cost: " . $selected_AVC;
            } else {
                echo "Error updating record: " . $conn->error;
            }

            //Update Start Date
            $sql12 = "update Contracts set StartDate = '$selected_StartDate'  where ContID = $Select_Contract";
            if ($conn->query($sql12) === TRUE) {
               // echo "<br>Record updated successfully for Date: " . $selected_StartDate;
            } else {
                echo "Error updating record: " . $conn->error . " " . $Select_Contract;
            }

            //Update Category
            $sql12 = "update Contracts set Category = '$selected_Category' where ContID = $Select_Contract";
            if ($conn->query($sql12) === TRUE) {
               // echo "<br>Record updated successfully for Category: " . $selected_Category;
            } else {
                echo "Error updating record: " . $conn->error . " " . $Select_Contract;
            }

            //Update Address
            $postalcode = $SpiltAddress[0] . " " . $SpiltAddress[1];
            $sql10 = "update Company set PostalCode =  '$postalcode' where CompName = '" . $selected_Comp . "'";
            if ($conn->query($sql10) === TRUE) {
                echo "<br> Record updated successfully for Address:" . $postalcode . " " . $SpiltAddress[2] . " " . $SpiltAddress[3];
            } else {
                echo "Error updating record: " . $conn->error;
            }

            echo '<br><div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> Record has been updated successfully.</div>';
        }

        else {
            echo '<br><div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Something is wrong with the input please make sure you have filled in all the fields correctly! </div>';
        }
    }

    if (isset($_POST['Enter'])) {

        $sql11 = "select ContID, Responsible.fName, Responsible.lName, Contracts.RespoID  from Contracts 
                 inner join Responsible on Contracts.RespoID = Responsible.RespoID
                 Where ContID =" . $selected_Cont . " ";

        $result11 = $conn->query($sql11);

        while ($row = $result11->fetch_assoc()) {
            $selected_Respo = $row['RespoID'];
        }

        echo '<br><a href = "editResponsible.php?RespoID=' . $selected_Respo . '">Change Responsible Information.</a>';
    }

    if (isset($_POST['Delete'])){
        $Select_Contract = (int)$_POST['ContID'];
        $sql12 = "delete from Contracts where ContID = = $Select_Contract ";
        $sql13 = "Select * from Hours where ContID = = $Select_Contract ";
        $sql14 = "Select * from EmployeeHistory where ContID = = $Select_Contract ";
        $result13 = $conn->query($sql13);
        $result14 = $conn->query($sql14);

        if ($conn->query($sql12) === TRUE && empty($result13) && empty($result14)) {
            echo "Record deleted successfully";
        } else {
            echo "Error deleting, this Contract probably has been worked on by some employees and is 
            used as a reference to fetch history regarding their work. Therefore, this Contract Can't be deleted.". $conn->error;
        }
    }

    echo "</div>";


    $conn->close();
    ?>

</div1>
</body>