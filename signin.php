<!DOCTYPE html>
<html>
    <head>
        <title>Healcare bot</title>
        <meta name="viewport" content="width=device-width,initial=1.0">
        <link rel="stylesheet" href="signin.css" type="text/css">
        <link rel="icon" type="image/x-icon" href="robot.png">
    </head>
    <body>
        <div class='body'>
            <fieldset>
                <form method="POST" action="signinphp.php">
                    <h1>HEALTHCARE BOT</h1>
                    <h3>SIGNIN</h3>
                    <label for="name">User Name:</label>
                    <input type="text" id="username" name="username" placeholder="Enter name">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" placeholder="Enter email">
                    <label for="password1">Password:</label>
                    <input type="password" id="password1" name="password1" placeholder="Enter password">
                    <label for="password2">Conform Password:</label>
                    <input type="password" id="password2" name="password2" placeholder="Renter password">
                    <input type="submit" value="Submit">
                </form>
            </fieldset>    
        </div>
    </body>
</html>