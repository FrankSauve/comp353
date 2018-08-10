<?php
$type = $_GET['type'];
if ($_GET['q'] === '') {

    header('Location: empSearch_manager.php');

}
if ($_GET['q'] !== '') {
    include('db_connection.php');
    ?>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Employee Search</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
              integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
              crossorigin="anonymous">
    </head>

<body>
    <?php include('navbar.php');
    echo '<form action="empSearch_manager.php" method="GET" id="searchpage">';
    echo '<input type="text" name="q" id="q" placeholder="Search Employee"/>';
    echo '<input type="submit" id="ebutton" value="Search"/></br>';
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

//            echo '<h6><a href="' . $id . '.php">' . $firstName . ' ' . $lastName . '</a> </br>';
                if ($type = 'hour') {
                    echo '<h6><a href="display_Hours_manager.php?id=' . $id . '&first=' . $firstName . '&last=' . $lastName . '">' . $firstName . ' ' . $lastName . '</a> </br>';
                } elseif ($type = contract) {

                }
            }
        }
        ?>


        </body>
        </html>
        <?php
    }
}
?>
