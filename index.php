<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
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
?>
<div id="container">
    <h1>Index of COMP 353 project</h1>
    <h3>Contributors</h3>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">ID</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">François Crispo-Sauvé</th>
            <td>27454139</td>
        </tr>
        <tr>
            <th scope="row">Sarbeng Frimpong</th>
            <td>29344039</td>
        </tr>
        <tr>
            <th scope="row">William Leclerc</th>
            <td>27424973</td>
        </tr>
        <tr>
            <th scope="row">Lior Zaks</th>
            <td>26983308</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>