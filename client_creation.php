<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Client Creation</title>
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
<?php
    include('navbar.php');
    include('db_connection.php');
    $error = false; // Changes to true if there is a validation error

    // Check if the user is authorized to see this page
    // If the user is not logged in
    if (isset($_SESSION['loggedin']) == false && $_SESSION['loggedin'] == false) {
        header('Location: unauthorized.html');
    }
    // If the user is not a sales associate
    else if (isset($_SESSION['EDID']) && $_SESSION['EDID'] != 2) {
        header('Location: unauthorized.html');
    }

    // Remembers the values of the form onchange of province select
    if(isset($_POST['province'])) {
        $selectedProvince = $_POST['province'];
    }
    if (isset($_POST['city'])) {
        $selectedCity = $_POST['city'];
    }
    if(isset($_POST['compName'])) {
        $selectedCompName = $_POST['compName'];
    }
    else {
        $selectedCompName = ""; // Default company name is empty
    }
    if (isset($_POST['province']) && isset($_POST['city'])) {
        // Get the postal code for the City/Province combination
        $sql = "SELECT PostalCode FROM PostalCode WHERE Province='$selectedProvince' AND City='$selectedCity'";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        $postalCode = $row['PostalCode'];
    }
    else {
        $postalCode = ""; // Default postal code is empty
    }

    // Company Name validation
    if (isset($_POST['compName']) && $_POST['compName'] == '') {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Company Name can not be empty.</div>';
        $error = true;
    }
    // First name validation
    else if (isset($_POST['fName']) && $_POST['fName'] == '') {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> First Name can not be empty.</div>';
        $error = true;
    }
    // Middle name validation
    else if (isset($_POST['mName']) && $_POST['mName'] == '') {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Middle Name can not be empty.</div>';
        $error = true;
    }
    // Last name validation
    else if (isset($_POST['lName']) && $_POST['lName'] == '') {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Last Name can not be empty.</div>';
        $error = true;
    }
    // Phone number validation
    else if (isset($_POST['contact']) && $_POST['contact'] == '') {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Phone Number can not be empty.</div>';
        $error = true;
    }
    else if (isset($_POST['contact']) && !preg_match("^\d{3}-\d{3}-\d{4}$^", $_POST['contact'])) {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Phone Number must follow the format ###-###-####.</div>';
        $error = true;
    }
    // Email validation
    else if (isset($_POST['email']) && $_POST['email'] == '') {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Email can not be empty</div>';
        $error = true;
    }
    else if (isset($_POST['email']) && !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
        echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Email must follow the format example@domain.com</div>';
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
    if (isset($_POST['username']) && !$error) {
        $companyName = $_POST['compName'];
        $username = $_POST['username'];
        $password = hash("md5", $_POST['password']);
        $fName = $_POST['fName'];
        $lName = $_POST['lName'];
        $contact = $_POST['contact'];
        $email = $_POST['email'];
        $postalCode = $_POST['postalCode'];

        // Fetches users with the username from the form
        $sql = "SELECT * FROM Users WHERE Username = '$username'";
        $result = $conn->query($sql);
        // If there exists a user with that username, show error.
        if ($result->num_rows > 0) {
            echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> Username already exists.</div>';
        } else {
            // Insert in Users table
            $sql = "INSERT INTO Users VALUES ('$username', '$password')";
            // If the insert was successful
            if ($conn->query($sql) === TRUE) {
                // Insert in the Company table
                $sql = "INSERT INTO Company (CompName, PostalCode, username) VALUES ('$companyName', '$postalCode', '$username')";
                if ($conn->query($sql) === TRUE) {
                    // Insert in the Responsible table
                    $sql = "INSERT INTO Responsible (fName, mName, lName, contact, Email) VALUES ('$fName', 'mName', '$lName', '$contact', '$email')";
                    if ($conn->query($sql) === TRUE) {
                        // Client successfully added to all tables
                        echo '<div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> Client was created.</div>';
                    }
                }
            }
        }
    }

?>
<body>
<div id="container">
    <h1>Client Creation</h1>
    <form name="clientForm" action="client_creation.php" method="post">
        <div class="form-group">
            <label>Company Name</label>
            <input id="compName" name="compName" type="text" class="form-control" placeholder="Company Name" value="<?php echo $selectedCompName ?>">
        </div>
        <div class="form-group">
            <label>Province</label>
            <select class="form-control" id="province" name="province" onchange="clientForm.submit()">
                <?php
                // Insert all the provinces in the select
                $sql = "SELECT DISTINCT Province FROM PostalCode ORDER BY Province ASC";
                $result = $conn->query($sql);
                while($provinces = $result->fetch_assoc()) {
                    // Set the selected province in the drop down
                    if ($provinces['Province'] == $selectedProvince) {
                        echo "<option selected>$provinces[Province]</option>";
                    }
                    else{
                        echo "<option>$provinces[Province]</option>";
                    }
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label>City</label>
            <select class="form-control" id="city" name="city" onchange="clientForm.submit()">
                <?php
                // Insert cities based on the province selected above
                $sql = "SELECT DISTINCT City FROM PostalCode WHERE province = '$selectedProvince' ORDER BY City ASC";
                $result = $conn->query($sql);
                while($cities = $result->fetch_assoc()) {
                    if($cities['City'] == $selectedCity) {
                        echo "<option selected>$cities[City]</option>";
                    }
                    else {
                        echo "<option>$cities[City]</option>";
                    }
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label>Postal Code (Selected by Province/City)</label>
            <input id="postalCode" name="postalCode" type="text" class="form-control" placeholder="Postal Code" value="<?php echo $postalCode ?>">
        </div>
        <div class="form-group">
            <label>First Name</label>
            <input id="fName" name="fName" type="text" class="form-control" placeholder="First Name">
        </div>
        <div class="form-group">
            <label>Middle Name</label>
            <input id="mName" name="mName" type="text" class="form-control" placeholder="Middle Name">
        </div>
        <div class="form-group">
            <label>Last Name</label>
            <input id="lName" name="lName" type="text" class="form-control" placeholder="Last Name">
        </div>
        <div class="form-group">
            <label>Phone Number (###-###-####)</label>
            <input id="contact" name="contact" type="text" class="form-control" placeholder="###-###-####">
        </div>
        <div class="form-group">
            <label>Email</label>
            <input id="email" name="email" type="text" class="form-control" placeholder="example@domain.com">
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