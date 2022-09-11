<%-- 
    Document   : login
    Created on : Jun 20, 2022, 10:56:39 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
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
        <script>
            function showprofile() {
                var pro = document.getElementById("account-manage");
//                pro.setAttribute('style', 'display: flex');
                if (pro.style.display === 'none') {
                    pro.style.display = 'block';
                } else {
                    pro.style.display = 'none';
                }
            }
            function confirmDeleteAccount() {
                if (confirm("Are you sure to delete account?")) {
                    window.location = "deleteuser";
                }
            }
            function showCRUD(id) {
                var btn = document.getElementById("crud-btn-"+id);
                if (btn.style.display === 'none') {
                    btn.style.display = 'flex';
                } else {
                    btn.style.display = 'none';
                }
            }
        </script>
    </head>
    <body>        

        <header>
            <div class="header-left">
                <a href=""><i class="fa-solid fa-bars"></i></a>
                <a href="" title="Home"><i class="fa-solid fa-house"></i></a>
                <a href=""><i class="fa-solid fa-magnifying-glass"></i></a>
            </div>  
            <div style="display: flex; align-items: center">
                <a href="" title="Add Task"><i class="fa-solid fa-plus"></i></a>                
                <div class="pro">
                    <img id="profile-img" onclick="showprofile()" style="cursor: pointer;" src="<c:url value="assets/image/thegrapes/1.png"/>" alt="" width="40px">                                        
                    <div id="account-manage" style="background-color: white; padding: 20px; border-radius: 6px; box-shadow: 3px 3px 3px #ccc; display: none; position: absolute; width: 150px; right: 0;">
                        <a href="updateaccount">Edit Account</a>
                        <form action="logout">
                            <input type="submit" value="Log out" style="background: none; border: none;">
                        </form>
                        <!--<a href="logout">Log out</a>-->
                        <a href="deleteuser">Delete Account</a>
                    </div>
                </div>                

            </div>
        </header>

        <aside style="overflow: scroll;">
            <div class="main-aside">
                <div>
                    <a href="project"><i class="fa-solid fa-inbox"></i>Inbox </a>
                </div>
                <div>
                    <a href="today"><i class="fa-solid fa-calendar"></i>Today</a>
                </div>
                <div>
                    <a href="upcoming"><i class="fa-solid fa-calendar-days"></i>Upcoming</a>
                </div>
                <div>
                    <a href="search"><i class="fa-solid fa-magnifying-glass"></i>Search</a>
                </div>
            </div>
            <div class="project">
                <div class="header-project" style="display: flex; justify-content: space-between; justify-items: center;">
                    <h3>Project</h3>       
                    <a style="margin: 15px 12px 10px 0;" href="createproject" title="Add Project" onclick="createproject()"><i class="fa-solid fa-plus"></i></a>
                </div>
                <div class="extra-function">
                    <c:forEach items="${sessionScope.data}" var="c">
                        <div class="project-ele" onmouseover="showCRUD(${c.id})" onmouseout="showCRUD(${c.id})">
                            <div style="display: flex; align-content: center; margin-left: 10px;">
                                <div style="margin-top: 5px; height: 10px; width: 10px; border-radius: 50%; background-color: ${c.color}"></div>
                                <a href="projectcheck?id=${c.id}" style="margin-left: 10px;">${c.name}</a>
                                                  
                        </div>
                    </c:forEach>     
                </div>          
            </div>
        </aside>                    
    </body>
</html>