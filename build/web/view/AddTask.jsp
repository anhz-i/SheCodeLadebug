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
            <h1 class="title">Add Task</h1>
            <p style="color: red;">${requestScope.error}</p>      
            <div class="login">
                <div class="login-main">
                    <form action="addtask?projectid=${requestScope.proid}&&sectionid=${requestScope.secid}" method="post">
                        <div>
                            <label for="name">Task Name</label>
                            <input type="text" name="name" id="name" placeholder="TaskName" required>
                        </div>
                        <div>
                            <label for="description">Description</label>
                            <input type="text" name="description" id="description" placeholder="Description">
                        </div>
                        <div>
                            <label for="dudedate">Due Date</label>
                            <%                
                            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            String date = simpleDateFormat.format(new Date());
                            %>
                            <input type="date" name="duedate" id="duedate" min="<%=date%>">
                        </div>
                        <label for="">Priority</label>
                        <select name="priority">                
                            <option value="1">Priority 1</option>
                            <option value="2">Priority 2</option>
                            <option value="3">Priority 3</option>
                            <option value="4" selected>Priority 4</option>
                        </select>
<!--                        <div>
                            <input type="checkbox" name="tag" value="Read">Read
                            <div>
                                <input type="text" name="tag">
                                <a href="">Create</a>
                            </div>
                        </div>-->
                        <div class="bton-login">
                            <input  class="theme-background" type="submit" value="Add">
                        </div>
                    </form>
                </div>                
            </div>            

        </main>      

    </body>
</html>
