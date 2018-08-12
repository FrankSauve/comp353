<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">

<head>
    <meta charset="UTF-8">
    <title>Manager Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
          crossorigin="anonymous">
    <style>
        .h3 { margin-left:50px;}
        .links { margin-left:50px;}

    </style>
</head>
<?php include('navbar.php') ?>
<html>
</br>
<h3 class="h3">Please Select a Task</h3>
<a class="links" href="empSearch_manager.php?type=hour">Employee Hours Report</a> </br>
<a class="links" href="contractSearch_manager.php?type=hour">Contract Hours Report</a> </br>
<a class="links" href="contractSearch_manager.php?type=remove">Remove Employee from Contract</a></br>
<a class="links" href="viewContracts_manager.php">View Contracts</a></br>
<a class="links"" href="top_contracts.php">View Clients With Most Contracts</a></br>
<a class="links" href="top_ratings.php">View Highest Ratings Grouped by City</a></br>
<a class="links" href="contract_details.php">Contracts Recorded Within the Last 10 Days in All Categories</a>

</body>
</html>
