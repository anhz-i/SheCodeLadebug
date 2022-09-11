<%-- 
    Document   : AddTask
    Created on : Jul 6, 2022, 8:48:54 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">  
        <title>The Grapes</title>
        <link rel="icon" type="image/x-icon" href="<c:url value="assets/image/thegrapes/favicon.png"/>">                                
        <link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
        <link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.min.css"/>">        
        <link rel="stylesheet" href="<c:url value="/assets/css/login/style.css"/>">
        <link rel="stylesheet" href="<c:url value="/assets/css/login/responsive.css"/>">

        <script src="https://kit.fontawesome.com/4d809b9711.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <nav class="" >
                <a href="project"><img src="<c:url value="assets/image/thegrapes/1.png"/>" alt="logohome" style="width: 150px;"></a>                
            </nav>        
        </header>

        <hr>
        <main>
            <h1 class="title">Add Section</h1>
            <p style="color: red;">${requestScope.error}</p>      
            <div class="login">
                <div class="login-main">
                    <form action="addsection?projectid=${requestScope.proid}" method="post">
                        <div>
                            <input type="text" name="name" id="name" placeholder="SectionName" required>
                        </div>     
                        <div class="bton-login">
                            <input class="theme-background" type="submit" value="Add section">
                        </div>
                    </form>
                </div>

            </div>            

        </main>      

    </body>
</html>
