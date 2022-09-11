<%-- 
    Document   : ShareProject
    Created on : Jul 18, 2022, 10:23:43 PM
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
        <link rel="icon" type="image/x-icon" href="<c:url value="/assets/image/thegrapes/favicon.png"/>">                                
        <link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
        <link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.min.css"/>">        
        <link rel="stylesheet" href="<c:url value="/assets/css/inbox/style.css"/>">
        <link rel="stylesheet" href="<c:url value="/assets/css/inbox/responsive.css"/>">
        <script src="https://kit.fontawesome.com/4d809b9711.js" crossorigin="anonymous"></script>                
        
    </head>
    <body>
        <h3>Share Project</h3>
        <form action="shareproject" method="post">
            <div>
                <label for="email">Email</label>
                <input type="email" name="email" id="email">
            </div>
            <input type="submit" value="Add">
        </form>
        <p style="color: red;">${requestScope.mes}</p>
        <c:forEach items="${requestScope.shareemail}" var="e">
            <img id="profile-img" src="<c:url value="/assets/image/logo/1.png"/>" alt="" width="40px">                                        
            <p>${e}</p>            
            <a href="deletepermission?id=${sessionScope.project.id}&&email=${e}"><i class="fa-regular fa-trash-can"></i></a>
        </c:forEach>
    </body>
</html>
