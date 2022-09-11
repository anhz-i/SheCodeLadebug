<%-- 
    Document   : addcomment
    Created on : Jul 14, 2022, 8:00:55 AM
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
        <link rel="icon" type="image/x-icon" href="<c:url value="/assets/image/favicon_io/favicon.ico"/>">                                
        <link rel="stylesheet" href="<c:url value="/assets/css/inbox/style.css"/>">
        <link rel="stylesheet" href="<c:url value="/assets/css/inbox/responsive.css"/>">
        <script src="https://kit.fontawesome.com/4d809b9711.js" crossorigin="anonymous"></script>
        <script>
            function UpdateComment(id) {
                var upcom = document.getElementById("update-comment-"+id);
//                pro.setAttribute('style', 'display: flex');
                if (upcom.style.display === 'none') {
                    upcom.style.display = 'block';
                } else {
                    upcom.style.display = 'none';
                }
            }

        </script>
    </head>
    <body>        
        <header>
            <nav class="" >
                <a href="project"><img src="<c:url value="/assets/image/logo/2.png"/>" alt="logohome" style="width: 150px;"></a>                
            </nav>        
        </header>
        <h3>Comment</h3>
        <div class="content">
            <c:forEach items="${sessionScope.com}" var="t">
                <div class="task">
                    <div style="">
                        <div>
                            <img id="profile-img" src="<c:url value="/assets/image/logo/1.png"/>" alt="" width="40px" style="border-radius: 50%">                                        
                            <h4>${t.email}</h4>
                            <p>${t.datetime}</p>
                        </div>
                        <div class="comment-des">
                            <p>${t.comment}</p>
                            <a href="deletecomment?id=${t.id}"><i class="fa-regular fa-trash-can"></i></a>
                            <i onclick="UpdateComment(${t.id})" class="fa-regular fa-pen-to-square" style="cursor: pointer;"></i>
                        </div>
                        <div id="update-comment-${t.id}" style="display: none;">
                            <form action="updatecomment?id=${t.id}" method="post">
                                <input type="text" name="comment" value="${t.comment}">
                                <input type="submit" value="Update">
                            </form>
                        </div>
                    </div>                   
                </div>                
            </c:forEach>   
        </div>
        <form action="addcomment?projectid=${sessionScope.projectid}" method="post">
            <input type="text" name="comment">
            <input type="submit" value="Comment">
        </form>      
    </body>
</html>
