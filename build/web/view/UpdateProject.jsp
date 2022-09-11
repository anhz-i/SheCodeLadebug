<%-- 
    Document   : CreateProject
    Created on : Jun 24, 2022, 5:08:57 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.Value" %>
<%@page import="model.Project" %>
<%@page import="java.util.List" %>


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
            <h1 class="title">Update Project</h1>
            <p style="color: red;">${requestScope.error}</p>      
            <div class="login">
                <div class="login-main">
                    <c:set var="c" value="${requestScope.project}"></c:set>
                    <form action="updateproject?id=${c.id}" method="post">
                        <div>
                            <label for="name">Name</label>
                            <input type="text" name="name" id="name" value="${c.name}" required>
                        </div>
                        <div>
                            <label for="color">Color</label>
                            <select name="color">                        
                                <%
                                Value x = new Value();
                                List<String> list = x.getColor(); 
                                Project p = (Project) request.getAttribute("project");     
                                %>
                                <option value="<%=p.getColor()%>" style="background-color: <%=p.getColor()%>;" selected>${c.color}</option>

                                <%
                                for (String item : list) {
                                    if (!item.equals(p.getColor())) {
                                %>
                                <option value="<%=item%>" style="background-color: <%=item%>;"><%=item%></option>
                                <%
                                    }
                                }
                                %>

                            </select>                    
                        </div>
<!--                        <div>
                            <svg width="24" height="20" class="cxDz6S">
                            <path d="M19.469 1.262c-5.284-1.53-7.47 4.142-7.47 4.142S9.815-.269 4.532 1.262C-1.937 3.138.44 13.832 12 19.333c11.559-5.501 13.938-16.195 7.469-18.07z" stroke="#FF424F" stroke-width="1.5" fill="none" fill-rule="evenodd" stroke-linejoin="round"></path>
                            </svg>
                            Add to favorites
                        </div>-->
                        <div>
                            <label>View</label>                            
                            <div style="display: flex; text-align: center;">
                                <div>
                                    <img src="<c:url value="/assets/image/View/list.png"/>" style="width: 150px;" alt="list"/>
                                    <input type="radio" name="view" value="list" ${c.view == 'list'?'checked':''}>List
                                </div>
                                <div>
                                    <img src="<c:url value="/assets/image/View/board.png"/>" style="width: 150px;" alt="board"/>
                                    <input type="radio" name="view" value="board" ${c.view == 'board'?'checked':''}>Board
                                </div>
                            </div>
                        </div>
                        <div class="bton-login">
                            <input class="theme-background" type="submit" value="Save"/>
                        </div>
                    </form>
                </div>                
            </div>            

        </main>                           
    </body>
</html>
