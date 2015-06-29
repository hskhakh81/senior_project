<%-- 
    Document   : index
    Author     : hskhakh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project - Harpreet Khakh</title>
        <link rel="stylesheet" type="text/css" href="page_style.css"/>
    </head>
    <body>
        <div id="header">
            <%@include file="header.jsp" %>
        </div>
        
        <div id="content">
            <h2>Welcome</h2>
            <p>This project will show trends of students in courses. </p>
            <p>
                <b>Quick How-To</b>
                <ol>
                    <li> Upload csv files using 'File upload' page </li>
                    <li> Use Analysis page to analyze trends </li>
                </ol>

                <b>Technology</b>
                <ul>
                    <li> Java EE (on Apache TomEE)</li>
                    <li> My SQL database </li>
                </ul>

                <b>Behind the scenes</b>
                <ul>
                    <li> Uploading file reads each row, validates it and adds it to database table </li>
                    <li> Feedback provided to user for error rows </li>
                    <li> Analysis reads uploaded data, shows different trends in graphical format</li>
                </ul>

            </p>
        </div>
        
        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
