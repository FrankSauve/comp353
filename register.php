<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

  <style>
    #container{
      margin-top: 30px;
      margin-left: 200px;
      margin-right: 200px;
    }
  </style>
</head>
<body>
  <?php include('navbar.php')?>
  <div onSubmit="submit()" id="container">
    <h1>Register</h1>
    <form>
      <div class="form-group">
        <label>Username</label>
        <input id="username" type="text" class="form-control" placeholder="Username">
      </div>
      <div class="form-group">
        <label>Password</label>
        <input id="password" type="password" class="form-control" placeholder="Password">
      </div>
      <div class="form-group">
        <label>Confirm Password</label>
        <input id="confirmPassword" type="password" class="form-control" placeholder="Confirm Password">
      </div>
      <div class="form-group">
        <label>Type of user</label>
        <select id="type" class="form-control">
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
  const type = document.getElementById('type');
  
  // Called on submit
  function submit(){
    validateForm();
  }

  // Used to validate the login form
  function validateForm(){
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