<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kiki Healthcarebot!!</title>
    <link rel="icon" type="image/x-icon" href="robot.png">
    <link rel="stylesheet" href="robot.css" >
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <?php 
    function function_alert($message) { 
      
      // Display the alert box  
      echo "<script>alert('$message');</script>"; 
  } 
    
    
  // Function call 
  function_alert("LOGGEDIN successfully!!THANK YOU FOR VISITING"); 
  ?>

<nav class="nav">
                <li><a href="login-user.php" title="click here to login">LOGIN</a></li>
                <li><a href="signup-user.php" title="click here to signin">SIGNUP</a></li>
                <li><a href="home2.php" title="click here to go to home">HOME</a></li>
                <li>><a href="about.php" title="click here to know bot">ABOUT BOT</a></li>
                <li><a href="contact.php" title="click here for conatct info">CONTACT</a></li>
				<li><a href="logout-user.php" title="click here to logout">LOGOUT</a></li>
            </nav>
    <div class="wrapper">
        <img style="float:left;width:10vw;height:10vh;" src="robot.png"  >
        <div class="title"><b>Kiki!!</b> Healthcare bot</div>
        <div class="form">
            <div class="bot-inbox inbox">
                <div class="icon">
                    <i class="fas fa-user"></i>
                </div>
                <div class="msg-header">
                    <p>Hello there, how can I help you?</p>
                </div>
            </div>
        </div>
        <div class="typing-field">
            <div class="input-data">
                <input id="data" type="text" name="bot"  placeholder="Type something here.." required>
                <button id="send-btn">Send</button>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function(){
            $("#send-btn").on("click", function(){
                $value = $("#data").val();
                $msg = '<div class="user-inbox inbox"><div class="msg-header"><p>'+ $value +'</p></div></div>';
                $(".form").append($msg);
                $("#data").val('');
                
                // start ajax code
                $.ajax({
                    url: 'message.php',
                    type: 'POST',
                    data: 'text='+$value,
                    success: function(result){
                        $replay = '<div class="bot-inbox inbox"><div class="icon"><i class="fas fa-user"></i></div><div class="msg-header"><p>'+ result +'</p></div></div>';
                        $(".form").append($replay);
                        // when chat goes down the scroll bar automatically comes to the bottom
                        $(".form").scrollTop($(".form")[0].scrollHeight);
                    }
                });
            });
        });
    </script>
    
</body>
</html>