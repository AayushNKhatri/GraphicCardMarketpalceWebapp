<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Register</title>
    
</head>
<style>
@charset "ISO-8859-1";
@charset "ISO-8859-1";

body
{
    margin: 0;
    padding: 0;
    font-family: monospace;
    font-weight: bold;
    
    font-size: larger;
    color: black;
    background-image: url(background-images.jpg);
    background-repeat: no-repeat;
    background-size: cover;
}
.center
{   
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    width: 500px;
    height: 100%;
    opacity: 70%;
    background:#F1F1F1;
    
    border-radius: 15px;
}
.center h1
{
    text-align: center;
    padding: 0 0 20px 0;
}
.center form
{
    padding: 0px 40px;   
    
}
.user_field
{
    height: 90px;
}
.pass_field
{
    height: 90px;
}
.user_field input
{
    margin-top: 10px;
    width: 100%;
    height: 40px;
    font-size: 16px;
    font-family: monospace;
    font-weight: bold;
    border-radius: 10px;
    border: 3px solid;
    background: none;
    outline: none;
}
.pass_field input
{
    margin-top: 10px;
    width: 100%;
    height: 40px;
    font-size: 16px;
    font-family: monospace;
    font-weight: bold;
    border-radius: 10px;
    border: 3px solid;
    background: none;
    outline: none;
}
.user_field input:hover
{
    box-shadow: 2px 7px 15px black;
}
.user_field label
{
    font-size: 20px;
    padding: 8px;
}
.pass_field label
{
    font-size: 20px;
    padding: 8px;
}
.pass_field input:hover
{
    box-shadow: 2px 7px 15px black;
}
input[type = "submit"]
{
    width: 428px;
    height: 50px;
    margin-top: 45px;
    font-size: 20px;
    font-family: monospace;
    font-weight: bold;
    border: 3px solid;
    border-radius: 35px;
}
input[type = "submit"]:hover
{
    box-shadow: 0px 0px 5px black;
    background: black;
    color: white;
}
.create_account
{
    margin:45px 0;
    text-align: center;
    font-size: 20px;
    font-family: monospace;
    font-weight: bold;
}
.create_account button
{
    color: #2691d9;
    text-decoration: none;
    border: none;
}
.create_account button:hover
{
    text-decoration: underline;
}
.forgpass
{
    margin-top: 5px;
}
.forgpass a
{
    font-size: 18px;
    padding: 5px;
    opacity: 50%;
    color: black;
    text-decoration: none;
}
.forgpass a:hover
{
    text-decoration: underline;
    color: black;
    opacity: 100%;
}</style>
<body>
    <div class="center">
        <h1>Register</h1>
<form action="../UserRegister" method="post">
            <div class="user_field">
                <label>First Name</label>
                <input type="text" name="firstname" required>
            </div>
            <div class="user_field">
                <label>Last Name</label>
                <input type="text" name="lastname" required>
            </div>
            <div class="pass_field">
                <label>Username</label>
                <input type="text" name="username" required>
            </div>
            <div class="pass_field">
                <label>Address</label>
                <input type="text" name="address" required>
            </div>
            <div class="pass_field">
                <label>Phone Number</label>
                <input type="number" name="phonenumber" required>
            </div>
            <div class="pass_field">
                <label>Email</label>
                <input type="email" name="email" required>
            </div>
            <div class="pass_field">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>
            <div class="pass_field">
                <label>Re-Password</label>
                <input type="password" name="repass" required>
            </div>
            <div class="login">
                <input type="submit" value="Sign Up">
            </div>
            <div class="create_account">
                <p id="member">Already Member? <a id="Signup" href="Login.jsp">Login</a></p>
            </div>
			<h4>Register fail please enter valid detail</h4>
        </form>
    </div>
</body>
</html>
