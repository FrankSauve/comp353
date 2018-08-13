<?php
    include('navbar.php');
    session_unset();
    session_destroy();
echo "<script type='text/javascript'>document.location.href='index.php';</script>"; // Redirect to home
    echo '<div id="error" class="alert alert-success" role="alert"><strong>SUCCESS: </strong> You are now logged out.</div>';


