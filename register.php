<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    <style>
        #container {
            margin-top: 30px;
            margin-left: 200px;
            margin-right: 200px;
        }
    </style>
</head>
<body>

<?php
include('navbar.php');
include('db_connection.php');

if (isset($_POST['username'])) {
    $username = $_POST['username'];
    // Password is encrypted with md5
    $password = hash("md5", $_POST['password']);
    $typeOfUser = $_POST['typeOfUser'];

    // Fetches users with the username from the form
    $sql = "SELECT Username FROM Users WHERE Username = '$username'";
    $result = $conn->query($sql);
    // If there exists a user with that username, show error.
    if ($result->num_rows > 0) {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Username already exists.</div>';
    }
    else {
        // Query to insert new user
        $sql = "INSERT INTO Users (Username, Password) VALUES ('$username', '$password')";
        // If the insert was successful
        if ($conn->query($sql) === TRUE) {
            echo '<div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> You are registered.</div>';
        } // If there was an error
        else {
            echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Registration failed.</div>';
        }
        $_SESSION['loggedin'] = true;
        $_SESSION['username'] = $username;
        header('Location: index.php'); // Redirect to home
    }
}
?>

<div onSubmit="submit()" id="container">
    <h1>Register</h1>
    <form action="register.php" method="post">
        <div class="form-group">
            <label>Username</label>
            <input id="username" name="username" type="text" class="form-control" placeholder="Username">
        </div>
        <div class="form-group">
            <label>Password</label>
            <input id="password" name="password" type="password" class="form-control" placeholder="Password">
        </div>
        <div class="form-group">
            <label>Confirm Password</label>
            <input id="confirmPassword" name="confirmPassword" type="password" class="form-control" placeholder="Confirm Password">
        </div>
        <div class="form-group">
            <label>Type of user</label>
            <select id="type" name="typeOfUser" class="form-control">
                <option>Employee</option>
                <option>Manager</option>
                <option>Sales Associate</option>
                <option>Admin</option>
                <option>Client</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

<script>
    // DOM elements
    const container = document.getElementById('container');
    const username = document.getElementById('username');
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById('confirmPassword');

    // Called on submit
    function submit() {
        validateForm();
    }

    // Used to validate the register form
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
        // Checks if confirm password is empty
        else if (confirmPassword.value === '') {
            container.innerHTML += '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Confirm Password can not be empty.</div>';
        }
        // Checks if the password == confirm password
        else if (password.value != confirmPassword.value) {
            container.innerHTML += '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Passwords must match.</div>';
        }
    }
</script>
</body>
</html>