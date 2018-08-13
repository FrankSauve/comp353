<?php include('navbar.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Search</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
          crossorigin="anonymous">
    <style>
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
        <h1>Employee Search</h1>
        <?php
        include('db_connection.php');

        // Check if the user is authorized to see this page
        // If the user is not logged in
        if (isset($_SESSION['loggedin']) == false && $_SESSION['loggedin'] == false) {
            echo "<script type='text/javascript'>document.location.href='unauthorized.html';</script>";
        }
        // If the user is an employee
        else if (isset($_SESSION['EDID']) && $_SESSION['EDID'] != 1) {
            echo "<script type='text/javascript'>document.location.href='unauthorized.html';</script>";
        }
        echo '<form action="empSearch_manager.php" method="GET" id="searchpage">';
        echo '<div class="form-group">
            <label>Employee Name</label>';
        echo '<input class="form-control" type="text" name="q" id="q" placeholder="Search Employee"/>';
        echo '</div>';
        echo '<input class="btn btn-primary" type="submit" id="ebutton" value="Search"/></br>';
        echo '</form>';
        ?>

        <?php
        if (!isset($_GET['q'])) {
            echo '';
        } else {
            $q = $_GET['q'];

            if ($type = 'hour') {
                $query = mysqli_query($conn, "SELECT * FROM Employees where fName like '%$q%' or lName like '%$q%' order by fName");
                $num_rows = mysqli_num_rows($query);
                echo $num_rows . " Results Found" . '</br>' . '</br>';
                while ($row = mysqli_fetch_array($query)) {
                    $id = $row['EmployeeID'];
                    $firstName = $row['fName'];
                    $lastName = $row['lName'];
                    echo '<h6><a href="display_Hours_manager.php?id=' . $id . '&first=' . $firstName . '&last=' . $lastName . '">' . $firstName . ' ' . $lastName . '</a> </br>';
                }
            }
        }
        ?>
    </div>
</body>
</html>

