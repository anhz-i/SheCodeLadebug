<%-- 
    Document   : login
    Created on : Jun 20, 2022, 10:56:39 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.Section" %>
<%@page import="model.Task" %>
<%@page import="model.Project" %>
<%@page import="DAL.TaskDAO" %>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">  
        <title>The Grapes</title>
        <link rel="icon" type="image/x-icon" href="<c:url value="/assets/image/favicon_io/favicon.ico"/>">                                
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
        </script>
    </head>
    <body>

        <%@include file="LeftAside.jsp" %>


        <main>
            <section>
                <div class="title-row">
                    <div class="title">
                        <h3>${requestScope.project.name}</h3>                        
                    </div>
                    <div>
                        <a href="addcomment?projectid=${requestScope.project.id}" title="comment"><i class="fa-solid fa-comment"></i></a>
                    </div>

                </div>
                <div>
                    <a href="addsection?projectid=${requestScope.project.id}" title="Add Section"><i class="fa-solid fa-plus"></i>Add Section</a>                                        
                </div>
                <div>
                    <a href="addtask?projectid=${requestScope.project.id}" title="Add Task"><i class="fa-solid fa-plus"></i>Ask Task</a>                    
                </div>
                <hr>
                <div class="content">
                    <%
                    TaskDAO t = new TaskDAO();
                    Project p = (Project) request.getAttribute("project");
                    try {
                        List<Task> taskpro = t.getTaskbyProjectID(p.getId());
                        for (Task itask : taskpro) {
                            if (itask.getSectionID() == null) {
                    %>
                    <div class="task">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <div>
                                <input type="checkbox" name="" id=""> 
                                <p><%=itask.getName()%></p>    
                            </div>
                            <div>
                                <a href="deletetask?id=<%=itask.getId()%>"><i class="fa-regular fa-trash-can"></i></a>
                                <a href="updatetask?id=<%=itask.getId()%>"><i class="fa-regular fa-pen-to-square"></i></a>
                                <a href="addcomment?taskid=<%=itask.getId()%>"><i class="fa-regular fa-comment"></i></a>                                
                            </div>
                        </div>
                        <% if (itask.getDueDate() != null) {%>
                        <a href="" class="calendar"><i class="fa-solid fa-calendar-days"></i><%=itask.getDueDate()%></a>                       
                            <% } %>                        
                    </div>
                    <hr>
                    <%
                        }
                        }
                    } catch (Exception ex) {                            
                    }
                    %>                 

                </div>                                         
                <div class="content">
                    <%
                    List<Section> section = (List<Section>) request.getAttribute("section");
                    for (Section item : section) {
                    %>
                    <div style="display: flex; align-items: center; justify-content: space-between;">
                        <div>
                            <h3><%=item.getName()%></h3>
                        </div>
                        <div>
                            <a href="deletesection?id=<%=item.getId()%>"><i class="fa-regular fa-trash-can"></i></a>
                            <a href="updatesection?id=<%=item.getId()%>"><i class="fa-regular fa-pen-to-square"></i></a>
                        </div>
                    </div>
                    <%
                        try {
                            List<Task> task = t.getTaskbySectionID(item.getId());
                            for (Task itask : task) {
                    %>
                    <div class="task">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <div>
                                <input type="checkbox" name="" id=""> 
                                <p><%=itask.getName()%></p>
                            </div>
                            <div>
                                <a href="deletetask?id=<%=itask.getId()%>"><i class="fa-regular fa-trash-can"></i></a>
                                <a href="updatetask?id=<%=itask.getId()%>"><i class="fa-regular fa-pen-to-square"></i></a>
                                <a href=""><i class="fa-regular fa-comment"></i></a>
                            </div>
                        </div>
                        <% if (itask.getDueDate() != null) {%>
                        <a href="" class="calendar"><i class="fa-solid fa-calendar-days"></i><%=itask.getDueDate()%></a>                       
                            <% } %>  
                    </div>
                    <hr>
                    <%
                            }
                        } catch (Exception ex) {                            
                        }
                    %>
                    <div>
                        <a href="addtask?projectid=${requestScope.project.id}&&sectionid=<%=item.getId()%>" title="Add Task"><i class="fa-solid fa-plus"></i>Ask Task</a>                    
                    </div>
                    <%
                    }
                    %>                    

                </div>              
            </section>
            <div class="clear"></div>
        </main>        

    </body>
</html>