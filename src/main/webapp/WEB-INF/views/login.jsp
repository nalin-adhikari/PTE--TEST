<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Users List</title>
        <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    </head>

    <body>
        <div class="generic-container">
            <div class="panel panel-default">



                <!-- Default panel contents -->
                <div class="panel-heading"><span class="lead">Login</span></div>
                <div class="tablecontainer">
                    <form method="POST">
                    <div>
                        <input type="text" name="email" />
                    </div>
                    <div>
                        <input type="password" name="password" />
                    </div>
                    <div>
                        <input type="submit" value="Login" name="submit" />
                    </div>
                </form>
                </div>
        </div>
    </body>
</html>