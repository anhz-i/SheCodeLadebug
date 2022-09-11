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
        <link rel="icon" type="image/x-icon" href="<c:url value="/assets/image/favicon_io/favicon.ico"/>">                                
        <link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
        <link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.min.css"/>">        
        <link rel="stylesheet" href="<c:url value="/assets/css/inbox/style.css"/>">
        <link rel="stylesheet" href="<c:url value="/assets/css/inbox/responsive.css"/>">
        <script src="https://kit.fontawesome.com/4d809b9711.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
            function onDelete(id) {
                if (confirm("Are you sure to delete?")) {
                    window.location = "deleteproject?id=" + id;
                }
            }
            function search(param) {
                var txtSearch = param.value;
                $.ajax({
                    url: "/FinalProject/search",
                    type: "post",
                    data: {
                        txt: txtSearch
                    },
                    success: function (data) {
                        var content = document.getElementById("content");
                        content.innerHTML = data;
                    },
                    error: function (xhr) {
                        console.log("error");
                    }
                });
            }
        </script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>

        <%@include file="LeftAside.jsp" %>


        <main>
            <section>
                <div class="title-row">
                    <div class="title">
                        <h3>Search</h3>
                    </div>
                    <div>
                        <a href="" title="comment"><i class="fa-solid fa-comment"></i></a>
                        <a href="" title="views"><i class="fa-solid fa-bars-staggered"></i></a>
                    </div>

                </div>
                <hr>
                <input oninput="search(this)" type="text" name="txt" placeholder="Search" >

                <div class="content" id="content">                                        
                    <div class="task">
                        <p>hhh</p>
                    </div>
                    <hr>
                </div>                
            </section>
            <div class="clear"></div>
        </main>        

    </body>
</html>