<%-- 
    Document   : EditAccount
    Created on : Jul 11, 2022, 5:01:50 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">  
        <title>The Grapes</title>
        <link rel="icon" type="image/x-icon" href="<c:url value="assets/image/favicon_io/favicon.ico"/>">                                
        <link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
        <link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.min.css"/>">        
        <link rel="stylesheet" href="<c:url value="/assets/css/login/style.css"/>">
        <link rel="stylesheet" href="<c:url value="/assets/css/login/responsive.css"/>">

        <script src="https://kit.fontawesome.com/4d809b9711.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <nav class="" >
                <a href="project"><img src="<c:url value="/assets/image/logo/2.png"/>" alt="logohome" style="width: 150px;"></a>                
            </nav>        
        </header>

        <hr>
        <main>
            <h1 class="title">Account</h1>
            <p style="color: red;">${requestScope.error}</p>      
            <div class="login">
                <div class="login-main">
                    <form action="updateaccount" method="post">
                        <div>
                            <label for="name">Name</label>
                            <input type="text" id="name" name="name" value="${sessionScope.user.name}">
                        </div>
                        <div>
                            <label for="">Email</label>
                            <p>${sessionScope.user.email}</p>                
                        </div>
                        <div>
                            <label for="">Password</label>                
                            <a href="changepass">Change password</a>
                        </div>
                        <div class="bton-login">
                            <input  class="theme-background" type="submit" value="Save">
                        </div>                    
                    </form>
                </div>                
            </div>            

        </main>              
    </body>
</html>
