<%-- 
    Document   : login
    Created on : Jun 20, 2022, 10:56:39 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
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
        <script type="text/javascript">
            function onDelete(id) {
                if (confirm("Are you sure to delete?")) {
                    window.location = "deleteproject?id=" + id;
                }
            }
            function deleteTask(id) {
                window.location = "deletetask?id=" + id;
            }
            function showView() {
                var sort = document.getElementById("sort");
//                pro.setAttribute('style', 'display: flex');
                if (sort.style.display === 'none') {
                    sort.style.display = 'flex';
                } else {
                    sort.style.display = 'none';
                }
            }
        </script>
    </head>
    <body>

        <%@include file="LeftAside.jsp" %>


        <main>
            <section>
                <div class="title-row">
                    <div class="title">
                        <h3>Inbox</h3>
                    </div>
                    <div>
                        <i onclick="showView()" style="cursor: pointer;" class="fa-solid fa-bars-staggered"></i>
                        <div id="sort" style="flex-direction: column; background-color: white; padding: 20px; border-radius: 6px; box-shadow: 3px 3px 3px #ccc; display: none; position: absolute; width: 180px; right: 30px;">
                            <a href="sorttask?sortby=priority">Sort by Priority</a>                            
                            <a href="sorttask?sortby=duedate">Sort By Due Date</a>
                        </div>
                    </div>

                </div>
                <hr>
                <div class="content">                    
                    <c:forEach items="${requestScope.task}" var="t">
                        <div class="task">
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                <div>
                                    <input type="checkbox" name="" id="" onclick="deleteTask(${t.id})"> 
                                    <p>${t.name}</p>
                                </div>
                                <div>
                                    <a href="deletetask?id=${t.id}"><i class="fa-regular fa-trash-can"></i></a>
                                    <a href="updatetask?id=${t.id}"><i class="fa-regular fa-pen-to-square"></i></a>
                                    <a href=""><i class="fa-regular fa-comment"></i></a>
                                </div>
                            </div>
                            <c:if test="${(t.dueDate!=null)}">
                                <a href="" class="calendar"><i class="fa-solid fa-calendar-days"></i>${t.dueDate}</a>
                                </c:if>

                        </div>
                        <hr>
                    </c:forEach>                    
                    <div>
                        <a href="addtask?projectid=&&sectionid=" title="Add Task"><i class="fa-solid fa-plus"></i>Ask Task</a>                    
                    </div>
                </div>                
            </section>
            <div class="clear"></div>
        </main>        

    </body>
</html>