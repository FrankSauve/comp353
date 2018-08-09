<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    <style>
        #container {
            margin-top: 30px;
            margin-left: 200px;
            margin-right: 200px
        }
    </style>

</head>

<body>

<?php
include('navbar.php');
include('db_connection.php');
$error = false; // Becomes true if there is a validation error

// Username validation
if (isset($_POST['username']) && $_POST['username'] == '') {
    echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Username can not be empty.</div>';
    $error = true;
}
// Password validation
else if (isset($_POST['password'])) {
    if ($_POST['password'] == '') {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Password can not be empty.</div>';
        $error = true;
    }
}
// Validation passed
if (isset($_POST['username']) && !$error) {
    $username = $_POST['username'];
    $password = hash("md5" ,$_POST['password']);

    // Fetch password of the user
    $sql = "SELECT * FROM Users WHERE username = '$username'";
    $result = $conn->query($sql);
    // If there is no user with that username
    if ($result->num_rows == 0) {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Username does not exist.</div>';
    }
    // If the user exists
    else {
        $row = $result->fetch_assoc();
        // Compare md5 hashes of the login password with the password in DB
        if ($password == $row["Password"]) {
            echo '<div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> You are now logged in.</div>';
            $_SESSION['loggedin'] = true;
            $_SESSION['username'] = $row['username'];
            header('Location: index.php'); // Redirect to navbar
        }
        else {
            echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Password is incorrect.</div>';
        }
    }
}
?>

<div onSubmit="submit()" id="container">
    <h1>Login</h1>
    <form action="login.php" method="post">
        <div class="form-group">
            <label>Username</label>
            <input id="username" name="username" type="text" class="form-control" placeholder="Username">
        </div>
        <div class="form-group">
            <label>Password</label>
            <input id="password" name="password" type="password" class="form-control" placeholder="Password">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>