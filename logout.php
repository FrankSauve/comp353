<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
</head>

<?php
    include('navbar.php');
    $_SESSION['loggedin'] = false;
    $_SESSION['username'] = "";
    session_unset();
    session_destroy();
    header('Location: index.php'); // Redirect to home
    echo '<div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> You are now logged out.</div>';
?>

</html>