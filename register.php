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
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

<?php
include('navbar.php');
include('db_connection.php');
$error = false; //Becomes true if there is a validation error

// First name validation
if (isset($_POST['fName']) && $_POST['fName'] == '') {
    echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> First Name can not be empty.</div>';
    $error = true;
}
// Last name validation
else if (isset($_POST['lName']) && $_POST['lName'] == '') {
    echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Last Name can not be empty.</div>';
    $error = true;
}
// Username validation
else if (isset($_POST['username']) && $_POST['username'] == '') {
    echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Username can not be empty.</div>';
    $error = true;
}
// Password validation
else if (isset($_POST['password']) && isset($_POST['confirmPassword'])) {
    if ($_POST['password'] == '') {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Password can not be empty.</div>';
        $error = true;
    }
    else if ($_POST['confirmPassword'] == '') {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Confirm Password can not be empty.</div>';
        $error = true;
    }
    else if ($_POST['password'] != $_POST['confirmPassword']) {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Passwords must match.</div>';
        $error = true;
    }
}
// Validation passed
if(isset($_POST['username']) && !$error) {
    $username = $_POST['username'];
    $password = hash("md5" , $_POST['password']);

    // Fetches users with the username from the form
    $sql = "SELECT * FROM Users WHERE Username = '$username'";
    $result = $conn->query($sql);
    // If there exists a user with that username, show error.
    if ($result->num_rows > 0) {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Username already exists.</div>';
    }
    else {
        // Query to insert new user
        $sql = "INSERT INTO Users VALUES ('$username', '$password')";
        // If the insert was successful
        if ($conn->query($sql) === TRUE) {
            echo '<div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> You are registered.</div>';
            // TODO: Insert into the employees table
            $_SESSION['loggedin'] = true;
            $_SESSION['username'] = $username;
            header('Location: index.php'); // Redirect to home
        } // If there was an error
        else {
            echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Registration failed.</div>';
        }
    }
}
?>

<div id="container">
    <h1>Register</h1>
    <form action="register.php" method="post">
        <div class="form-group">
            <label>Type of user</label>
            <select id="typeOfUser" name="typeOfUser" class="form-control">
                <option selected="selected">Employee</option>
                <option>Manager</option>
                <option>Sales Associate</option>
            </select>
        </div>
        <div class="form-group">
            <label>First Name</label>
            <input id="fName" name="fName" type="text" class="form-control" placeholder="First Name">
        </div>
        <div class="form-group">
            <label>Last Name</label>
            <input id="lName" name="lName" type="text" class="form-control" placeholder="Last Name">
        </div>
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

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>