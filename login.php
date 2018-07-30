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

if (isset($_POST['username'])) {
    $username = $_POST['username'];
    $password = hash("md5" ,$_POST['password']);

    // Fetch password of the user
    $sql = "SELECT Password FROM Users WHERE Username = '$username'";
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
        }
        $_SESSION['loggedin'] = true;
        $_SESSION['username'] = $username;
        header('Location: index.php'); // Redirect to navbar
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

<script>
    // DOM elements
    const container = document.getElementById('container');
    const username = document.getElementById('username');
    const password = document.getElementById('password');

    // Called on submit
    function submit() {
        validateForm();
    }

    // Used to validate the login form
    function validateForm() {
        // Checks if username is empty
        if (username.value === '') {
            // Create the alert
            container.innerHTML += '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Username can not be empty.</div>';
        }
        // Checks if password is empty
        else if (password.value === '') {
            // Create the alert
            container.innerHTML += '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Password can not be empty.</div>';
        }
    }
</script>
</body>
</html>