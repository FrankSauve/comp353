<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contract Creation</title>
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
    include ('navbar.php');
    include ('db_connection.php');
    $error = false;

    // Check if the user is authorized to see this page
    // If the user is not logged in
    if (isset($_SESSION['loggedin']) == false && $_SESSION['loggedin'] == false) {
        header('Location: unauthorized.html');
    }
    // If the user is not a sales associate
    else if (isset($_SESSION['EDID']) && $_SESSION['EDID'] != 2) {
        header('Location: unauthorized.html');
    }

    if (isset($_SESSION['username']) == TRUE) {
        $user = ($_SESSION['username']);
    }

    // Get the company ID from the company name
    if (isset($_POST['company'])) {
        $selectedCompany = $_POST['company'];
        $sql = "SELECT CompID FROM Company WHERE CompName = '$selectedCompany'";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        $compID = $row['CompID'];
    }

    // Store the selected respo
    if (isset($_POST['respo'])) {
        $selectedRespo = $_POST['respo'];
    }
    // Store the selected category
    if (isset($_POST['category'])) {
        $selectedCategory = $_POST['category'];
    }

    // AVC validation
    if (isset($_POST['AVC'])) {
        if ($_POST['AVC'] == '') {
            echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> AVC can not be empty.</div>';
            $error = true;
        }
        else if (!is_numeric($_POST['AVC'])) {
            echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> AVC must be a number.</div>';
            $error = true;
        }
    }
    // IV validation
    if (isset($_POST['IV']) && !$error) {
        if ($_POST['IV'] == '') {
            echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> IV can not be empty.</div>';
            $error = true;
        }
        else if (!is_numeric($_POST['IV'])) {
            echo '<div id="error" class="alert alert-danger" role="alert"><strong>ERROR: </strong> IV must be a number.</div>';
            $error = true;
        }
    }

    if(isset($_POST['AVC']) && !$error) {
        $avc = $_POST['AVC'];
        $iv = $_POST['IV'];
        $service = $_POST['service'];
        $startDate = date("Y-m-d");
        $manager = explode(" ", $_POST['manager']);
        $fName = $manager[0];
        $lName = $manager[1];


        // Get EmployeeID
        $sql = "SELECT EmployeeID FROM Employees WHERE fName='$fName' AND lName='$lName'";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        $employeeID = $row['EmployeeID'];

        // Get TeamID
        $sql = "SELECT TeamID FROM Teams WHERE ManagerID='$employeeID'";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        $teamID = $row['TeamID'];

        $sql = "INSERT INTO Contracts (CompID, RespoID, AVC, IV, StartDate, Category, TypeOfService) VALUES ('$compID', '$selectedRespo', '$avc', '$iv', '$startDate', '$selectedCategory', '$service')";
        if ($conn->query($sql) === TRUE) {
            // Get the contract ID
            $sql = "SELECT MAX(ContID) FROM Contracts";
            $result = $conn->query($sql);
            $row = $result->fetch_assoc();
            $contID = $row['MAX(ContID)'];

            $sql = "INSERT INTO EmployeeHistory (EmployeeID, teamID, contID, isActive) VALUES ('$employeeID', '$teamID', '$contID', 1)";
            if ($conn->query($sql) === TRUE) {
                echo '<div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> Contract created successfully.</div>';
            }
        }

        //Adding an entry to the CreatedBy table so we can track who is the sales person who created the contract.
        $sql1 = "select EmployeeID from Employees where username = '$user'";
        $result1 = $conn->query($sql1);
        $row1 = $result1->fetch_assoc();
        $saleID = (int)$row1['EmployeeID'];
            $sql2 = "SELECT MAX(ContID) FROM Contracts";
            $result2 = $conn->query($sql2);
            $row2 = $result2->fetch_assoc();
            $contID = (int)$row['MAX(ContID)'];
            $sql3 = "insert into CreatedBy (ContID,EmployeeID) values ('$contID','$saleID')";
            if ($conn->query($sql3) === TRUE) {

            }

    }
?>
<body>
    <div id="container">
        <h1>Contract Creation</h1>
        <form action="contract_creation.php" method="post">
            <div class="form-group">
                <label>Company</label>
                <select class="form-control" id="company" name="company">
                    <?php
                    // Insert all the companies in the select
                    $sql = "SELECT DISTINCT CompName FROM Company ORDER BY CompName ASC";
                    $result = $conn->query($sql);
                    while($companies = $result->fetch_assoc()) {
                        if ($companies['CompName'] == $selectedCompany) {
                            echo "<option selected>$companies[CompName]</option>";
                        }
                        else{
                            echo "<option>$companies[CompName]</option>";
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label>Responsible ID</label>
                <select class="form-control" id="respo" name="respo">
                    <?php
                    // Insert all the responsibles in the select
                    $sql = "SELECT DISTINCT RespoID FROM Responsible ORDER BY RespoID ASC";
                    $result = $conn->query($sql);
                    while($respo = $result->fetch_assoc()) {
                        if ($respo['RespoID'] == $selectedRespo) {
                            echo "<option selected>$respo[RespoID]</option>";
                        }
                        else{
                            echo "<option>$respo[RespoID]</option>";
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label>AVC</label>
                <input id="AVC" name="AVC" type="text" class="form-control" placeholder="AVC">
            </div>
            <div class="form-group">
                <label>IV</label>
                <input id="IV" name="IV" type="text" class="form-control" placeholder="IV">
            </div>
            <div class="form-group">
                <label>Category</label>
                <select class="form-control" id="category" name="category">
                    <?php
                    // Insert all the companies in the select
                    $sql = "SELECT DISTINCT Category FROM TypeOfContracts ORDER BY Category ASC";
                    $result = $conn->query($sql);
                    while($category = $result->fetch_assoc()) {
                        if ($category['Category'] == $selectedCategory) {
                            echo "<option selected>$category[Category]</option>";
                        }
                        else{
                            echo "<option>$category[Category]</option>";
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label>Service</label>
                <select name="service" id="service" class="form-control">
                    <option selected>Cloud</option>
                    <option>On-premises</option>
                </select>
            </div>
            <div class="form-group">
                <label>Manager</label>
                <select class="form-control" id="manager" name="manager">
                    <?php
                    // Insert all the companies in the select
                    $sql = "SELECT fName, lName FROM Employees, Teams WHERE EDID=1 AND ManagerID=EmployeeID ORDER BY lName ASC";
                    $result = $conn->query($sql);
                    while($manager = $result->fetch_assoc()) {
                        echo "<option selected>$manager[fName] $manager[lName]</option>";
                    }
                    ?>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>
</html>