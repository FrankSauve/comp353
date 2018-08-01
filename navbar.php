<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
</head>
<body>

<?php
session_start();
// If the user is logged in
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
    echo "<nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">
            <a class=\"navbar-brand\" href=\"#\">COMP 353</a>
            <div class=\"collapse navbar-collapse\">
                <div class=\"navbar-nav\">
                    <a class=\"nav-item nav-link active\" href=\"./\">Home</a>
                    <a class=\"nav-item nav-link\" href=\"./logout.php\">Logout</a>
                </div>
            </div>
        </nav>";
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

