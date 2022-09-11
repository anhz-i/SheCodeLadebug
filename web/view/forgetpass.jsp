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

        <script src="https://kit.fontawesome.com/4d809b9711.js" crossorigin="anonymous"></script>    </head>
    <body>
        <header>
            <nav class="" >
                <a href="index.html"><img src="<c:url value="/assets/image/logo/2.png"/>" alt="logohome" style="width: 150px;"></a>                
            </nav>        
        </header>

        <hr>
        <main>
            <h1 class="title">Enter your email</h1>
            <p style="color: red;">${requestScope.mes}</p>
            <div class="login">
                <div class="login-main">
                    <form action="forgetpass" method="post">
                        <div>
                            <label for="email ">Email</label>
                            <input type="email" id="email" name="email" >
                        </div>       
                        <div class="bton-login">
                            <input class="theme-background" type="submit" value="Send">
                        </div>
                    </form>
                </div>                
            </div>            
            <p style="color: red;">${requestScope.error}</p>
        </main>          
    </body>
</html>

