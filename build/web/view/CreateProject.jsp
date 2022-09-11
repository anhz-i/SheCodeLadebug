<%-- 
    Document   : CreateProject
    Created on : Jun 24, 2022, 5:08:57 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List" %>
<%@page import="model.Value" %>


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
        <link rel="stylesheet" href="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"/> integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
            <h1 class="title">Add project</h1>
            <p style="color: red;">${requestScope.error}</p>      
            <div class="login">
                <div class="login-main">
                    <form action="createproject" method="post">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input class="form-control" type="text" name="name" id="name" required>
                        </div>
                        <div >
                            <label for="color">Color</label>
                            <select name="color">
                                <%
                                Value x = new Value();
                                List<String> list = x.getColor();                         
                                for (String item : list) {
                                %>
                                <option value="<%=item%>" style="background-color: <%=item%>;"><%=item%></option>
                                <%
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
                                    <img src="<c:url value="/assets/image/View/list.png"/>" alt="list" style="width: 170px;"/>
                                    <input type="radio" name="view" value="list" checked="checked">List
                                </div>
                                <div>
                                    <img src="<c:url value="/assets/image/View/board.png"/>" alt="board" style="width: 170px;"/>
                                    <input type="radio" name="view" value="board">Board
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="bton-login">
                            <input class="theme-background" type="submit" value="Save"/>
                        </div>
                    </form>
                </div>
                <div class="img-login">
                    <img src="<c:url value="/assets/image/login/loginmain (2).png"/>" alt="" width="90%">
                </div>
            </div>            

        </main>        

        <footer>            
        </footer>
    </body>
</html>
