<%-- 
    Document   : login
    Created on : Jun 20, 2022, 10:56:39 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">  
        <title>The Grapes</title>
        <link rel="icon" type="image/x-icon" href="<c:url value="assets/image/thegrapes/favicon.png"/>">                        
        <link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
        <link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.min.css"/>">            
        <link rel="stylesheet" href="<c:url value="/assets/css/login/style.css"/>">
        <link rel="stylesheet" href="<c:url value="/assets/css/login/responsive.css"/>">
    </head>
    <body>
        <header>
            <nav class="" >
                <a href="index.html"><img src="<c:url value="assets/image/thegrapes/1.png"/>" alt="logohome" style="width: 150px;"></a>                
            </nav>        
        </header>

        <main>
            <h1 class="title">Sign up</h1>
            <div class="login">
                <div class="login-main">
                    <div>
                        <div class="social-login grey-border">
                            <a href="">
                                <img src="<c:url value="/assets/image/login/google.png"/>" alt="" width="30px">
                                Continue with Google
                            </a>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <form action="signup" method="post">
                            <div>                                
                                <label for="email-login">Email</label>
                                <input class="grey-border" id="email-login" type="email" placeholder="Enter your email" name="email" required>                                
                            </div>
                            <div>
                                <label for="pass-login">Password</label>
                                <input class="grey-border" id="pass-login" type="password" placeholder="Enter your password" name="pass" required>
                            </div>
                            <div>
                                <label for="pass-login2">Confirm Password</label>
                                <input class="grey-border" id="pass-login2" type="password" placeholder="Re-enter your password" name="cfpass" required>
                            </div>
                            <div class="bton-login">
                                <input class="theme-background" type="submit" value="Sign up with Email">
                            </div>
                        </form>
                    </div>

                    <p style="color: red;">${requestScope.error}</p>

                    <hr>
                    <p class="create-account">Already signed up? <a href="login">Log in</a></p>
                </div>
                <div class="img-login">
                    <img src="<c:url value="assets/image/thegrapes/3.png"/>" alt="" width="90%">
                </div>
            </div>
                
        </main>        
    </body>
</html>
