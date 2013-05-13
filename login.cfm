<!DOCTYPE html>
    <head>
        <meta charset="utf-8">
        <title>Nettuts 2-auth Tut - Login</title>
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>

    	<div class="authy-form"> 
		<form method="post" class="user-form" action="gettoken.cfm">

			<!--  Hidden input with my email address --->
			<input value="reybango@gmail.com" name="email" type="hidden">

			<h2>Demo App Login</h2>
			
			<label for="username">Username</label>
			<input id="username" name="username" type="text" value="reybango@gmail.com" placeholder="Enter your username">

			<label for="cellphone">Password</label>
			<input id="pwd" name="pwd" type="password" placeholder="Enter your password">

			<input type="submit" value="Login">			

		</form>
	</div>

    </body>
</html>
