<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    <style>
        .profil{
            color:whitesmoke;
        }
    </style>
</head>
<body>

<?php
include('db_connection.php');
session_start();

// If the user is logged in
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
    // Get user info
    $username = $_SESSION['username'];
    $sql = "SELECT EmployeeID, fName, lName, EDID FROM Employees WHERE username = '$username'";
    $result = $conn->query($sql);
    // If the user is an employee
    if($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $empID = $row["EmployeeID"];
        $fName = $row["fName"];
        $lName = $row["lName"];
        $EDID = $row["EDID"];
        $_SESSION['EDID'] = $EDID; // Set session variable for EDID
        //Get descript of user
        $sql = "SELECT Descript FROM EmployeeType WHERE EDID = '$EDID'";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        $descript = $row["Descript"];
    }
    // If the user is a client
    else {
        // Get the name of the company
        $sql = "SELECT CompID, CompName FROM Company WHERE username = '$username'";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        $compID = $row["CompID"];
        $fName = $row["CompName"];
        $lName = "";
        $descript = "Client";
    }

    if(isset($EDID)){
        // If user is a sales associate
        if ($EDID == 2) {
            echo "<nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">
            <a class=\"navbar-brand\" href=\"#\">COMP 353</a>
            <div class=\"collapse navbar-collapse\">
                <div class=\"navbar-nav\">
                    <a class=\"nav-item nav-link active\" href=\"./\">Home</a>
                    <a class=\"nav-item nav-link\" href=\"./client_creation.php\">Client Creation</a>
                    <a class=\"nav-item nav-link\" href=\"./contract_creation.php\">Contract Creation</a>
                    <a class=\"nav-item nav-link\" href=\"./employee_view.php\">My Profile</a>
                    <a class=\"nav-item nav-link\" href=\"./employee_hours.php\">My Hours</a>
                    <a class=\"nav-item nav-link\" href=\"./logout.php\">Logout</a>
                </div>
            </div>
            <ul class=\"nav navbar-nav ml-auto\">
                <li class=\"nav-item profil\">$fName $lName ($descript)</li>
            </ul>
        </nav>";
        }
         //If User is an admin.
        if ($EDID == 4) {
            echo "<nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">
            <a class=\"navbar-brand\" href=\"#\">COMP 353</a>
            <div class=\"collapse navbar-collapse\">
                <div class=\"navbar-nav\">
                    <a class=\"nav-item nav-link active\" href=\"./\">Home</a>
                    <a class=\"nav-item nav-link\" href=\"./adminview.php\">Maintenance</a>
                    <a class=\"nav-item nav-link\" href=\"./logout.php\">Logout</a>
                </div>
            </div>
            <ul class=\"nav navbar-nav ml-auto\">
                <li class=\"nav-item profil\">$fName $lName ($descript)</li>
            </ul>
        </nav>";
        }

        //If User is a manager.
        if ($EDID == 1) {
            echo "<nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">
            <a class=\"navbar-brand\" href=\"#\">COMP 353</a>
            <div class=\"collapse navbar-collapse\">
                <div class=\"navbar-nav\">
                    <a class=\"nav-item nav-link active\" href=\"./\">Home</a>
                    <a class=\"nav-item nav-link\" href=\"./home_manager.php\">Reports</a>
                    <a class=\"nav-item nav-link\" href=\"./employee_view.php\">My Profile</a>
                    <a class=\"nav-item nav-link\" href=\"./employee_hours.php\">My Hours</a>
                    <a class=\"nav-item nav-link\" href=\"./logout.php\">Logout</a>
                </div>
            </div>
            <ul class=\"nav navbar-nav ml-auto\">
                <li class=\"nav-item profil\">$fName $lName ($descript)</li>
            </ul>
        </nav>";
        }
        //If User is an Employee.
        if ($EDID == 3) {
            echo "<nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">
            <a class=\"navbar-brand\" href=\"#\">COMP 353</a>
            <div class=\"collapse navbar-collapse\">
                <div class=\"navbar-nav\">
                    <a class=\"nav-item nav-link active\" href=\"./\">Home</a>
                    <a class=\"nav-item nav-link\" href=\"./employee_view.php\">My Profile</a>
                    <a class=\"nav-item nav-link\" href=\"./employee_hours.php\">My Hours</a>
                    <a class=\"nav-item nav-link\" href=\"./logout.php\">Logout</a>
                </div>
            </div>
            <ul class=\"nav navbar-nav ml-auto\">
                <li class=\"nav-item profil\">$fName $lName ($descript)</li>
            </ul>
        </nav>";
        }
    }
    //If User is an Client.
    else {
        echo "<nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">
            <a class=\"navbar-brand\" href=\"#\">COMP 353</a>
            <div class=\"collapse navbar-collapse\">
                <div class=\"navbar-nav\">
                    <a class=\"nav-item nav-link active\" href=\"./\">Home</a>
                    <a class=\"nav-item nav-link\" href=\"./client_view.php\">Dashboard</a>
                    <a class=\"nav-item nav-link\" href=\"./logout.php\">Logout</a>
                </div>
            </div>
            <ul class=\"nav navbar-nav ml-auto\">
                <li class=\"nav-item profil\">$fName $lName ($descript)</li>
            </ul>
        </nav>";
    }
}
// If the user is not logged in
else {
    echo "<nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">
            <a class=\"navbar-brand\" href=\"#\">COMP 353</a>
            <div class=\"collapse navbar-collapse\">
                <div class=\"navbar-nav\">
                    <a class=\"nav-item nav-link active\" href=\"./\">Home</a>
                    <a class=\"nav-item nav-link\" href=\"./login.php\">Login</a>
                    <a class=\"nav-item nav-link\" href=\"./register.php\">Register</a>
                </div>
            </div>
        </nav>";
    }
?>
</body>
</html>

