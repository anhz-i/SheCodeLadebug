<%-- 
    Document   : test
    Created on : Jul 4, 2022, 2:34:15 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
<!--        <form action="test" method="get">
            Email: <input type="text" name="email" required /> <br>
            Password: <input type="text" name="password" required /> <br>
            <input type="submit" value="Submit" /><br>
        </form>-->
        <form action="signup" method="post">
                                      
                <!--<label for="email-login">Email</label>-->
                <input type="email" placeholder="Enter your email" name="email">                                
                <!--<label for="pass-login">Password</label>-->
                <input type="password" placeholder="Enter your password" name="pass">
                <!--<label for="pass-login2">Confirm Password</label>-->
                <input type="password" placeholder="Re-enter your password" name="cfpass">
                <input type="button" value="Sign up with Email">
           
        </form>
    </body>
</html>
