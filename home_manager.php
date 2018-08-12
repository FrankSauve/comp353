<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">

<head>
    <meta charset="UTF-8">
    <title>Manager Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
          crossorigin="anonymous">
</head>
<?php include('navbar.php') ?>
<h3>Please Select a Task</h3>
<a href="empSearch_manager.php?type=hour">Employee Hours Report</a> </br>
<a href="contractSearch_manager.php?type=hour">Contract Hours Report</a> </br>
<a href="contractSearch_manager.php?type=remove">Remove Employee from Contract</a></br>
<a href="viewContracts_manager.php?">View Contracts</a></br>
<a href="top_contracts.php?">View Clients With Most Contracts</a>
<a href="top_ratings.php?">View Clients With Most Contracts</a>

</body>
</html>
