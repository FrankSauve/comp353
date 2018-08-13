<?php include('navbar.php');?>
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
    <h1>Add employee to contract</h1>
    <?php
    echo "<div class=\"pad\">";
    include('db_connection.php');
    echo '<form action="#" method="post">';

    $sql = "SELECT DISTINCT(CompName) FROM Company";
    $result = $conn->query($sql);

    echo 'Please select a Company:   <select name="Company_Selection" >';
    echo '<option value=""></option>';
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        echo '<option value="' . $row['CompName'] . '">' . $row['CompName'] . '</option>';
    }
    echo '</select>';
    echo '     ' . '<input class="btn btn-primary" type ="submit" name="submit" value="Submit"/>';
    echo '</form>';
    #$conn->close();
    '<br/>';

    if (isset($_POST['submit'])) {
        $selected_val = $_POST['Company_Selection'];
        echo "Company selected: <Strong>" . $selected_val . "</Strong><br>";
        echo "<br> This Company has the following Contracts, please select a contract to add an employee to";
        echo '<form action="#" method="post">';

        $sql1 = "SELECT  ContID FROM Contracts 
                inner join Company on Contracts.CompID = Company.CompID
                where Company.CompName = '" . $selected_val . "'";
        $result1 = $conn->query($sql1);

        echo 'Please select a contract:   <select name="Contracts_Selection">';
        echo '<option value=""></option>';
        // output data of each row
        while ($row1 = $result1->fetch_assoc()) {
            echo '<option value="' . $row1['ContID'] . '">' . $row1['ContID'] . '</option>';
        }
        echo '</select>';
        echo '     ' . '<input class="btn btn-primary" type ="submit" name="Enter" value="Submit"/>';
        echo '</form>';
    }

    echo '<br>';

    if (isset($_POST['Enter'])) {
        $selected_Cont = (int)$_POST['Contracts_Selection'];
        $sql2 = "select CompName, Contracts.ContID from Company 
                  inner join Contracts on Company.CompID = Contracts.CompID 
                  where ContID = " . $selected_Cont . " ";
        $result2 = $conn->query($sql2);
        while ($row2 = $result2->fetch_assoc()) {

            echo "The company selected is <Strong>" . $row2['CompName'] . "</Strong> and contract # is <Strong>"
                . $row2['ContID'] . "</Strong></br>";
        }

            $sql3 = "select EmployeeID, fName, lName
                    from Employees
                    where EDID = 3 and EmployeeID
                    not in (select EmployeeID from EmployeeHistory where isActive = 1) order by fName";

            $result3 = $conn->query($sql3);
            echo "</br>";
            echo "Select employees to add to contract</br>";

        $sql6 = "select max(EmployeeHistory.ContID), Teams.TeamID, Employees.fName, Employees.lName from EmployeeHistory
        inner join Teams on EmployeeHistory.teamID = Teams.TeamID
        inner join Employees on Teams.ManagerID = Employees.EmployeeID
        where contID= $selected_Cont" ;

        $result6 = $conn->query($sql6);
        $row6 = $result6 ->fetch_assoc();
        $teamID = $row6['TeamID'];

        $result7 = $conn->query($sql2);
        $row7 = $result7 ->fetch_assoc();

        $contID = $row7['ContID'];

            echo '<form action="#" method="post">';

            while ($row3 = $result3->fetch_assoc()) {
                $id = $row3['EmployeeID'];
                $fname = $row3['fName'];
                $lname = $row3['lName'];

                echo "<tr>";
                echo '<input type="hidden" name="ContID" value = "' . $contID . '"readonly </input>';
                echo '<input type="hidden" name="teamID" value = "' . $teamID . '"readonly </input>';
                echo "<td><input type='checkbox' name='checkbox[]' value='$id'> $fname $lname<br></td>";
                echo "</tr>";
            }

            echo '     ' . '<input class="btn btn-primary" type ="submit" name="add" value="Submit"/>';
            echo '</form>';

    }
    if (isset($_POST['add'])) {
        $selected_ContID = (int)$_POST['ContID'];
        $teamID = (int)$_POST['teamID'];
        $checkbox = $_POST['checkbox'];
        foreach ($checkbox as $id) {
            $id = (int)$id;
            $sql5 = "insert into EmployeeHistory(EmployeeID,teamID,contID,isActive) values($id,$teamID,$selected_ContID,1)";
            if ($conn->query($sql5) === TRUE) {

            }

            else {
                echo "Error adding record: ". $conn->error;
            }
        }
        echo '<br><div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> Record updated successfully for Responsible</div>';
    }
    ?>
</div>
</body>