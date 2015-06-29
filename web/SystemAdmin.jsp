<%-- 
    Document   : FileUpload
    Author     : hskhakh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project - Harpreet Khakh - System Administration</title>
        <link rel="stylesheet" type="text/css" href="page_style.css"/>
        <script src="scripts.js"></script>
        
        <!-- TODO: validate if logged in user is admin, otherwise redirect to home page -->
        
    </head>
    <body>
        <div id="header">
            <%@include file="header.jsp" %>
        </div>
        
        <div id="content">
            <table>
                <tr>
                    <td>
                        <h2>System Administration</h2>
                        <!-- TODO: upload mappings and data types go here -->
                    </td>
                    
                </tr>
            </table>
        </div>
        
        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>