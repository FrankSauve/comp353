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

    // TODO: Form validation

    // TODO: Handle form submission

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