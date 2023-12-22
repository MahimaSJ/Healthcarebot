<?php
session_start();
session_unset();
session_destroy();

function function_alert($message) { 
      
    // Display the alert box  
    echo "<script>alert('$message');</script>"; 
} 
  
  
// Function call 
function_alert("Logged out successfully!!THANK YOU FOR VISITING"); 
header('location: login-user.php');
?>