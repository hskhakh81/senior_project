<%-- 
    Document   : FileUpload
    Author     : hskhakh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project - Harpreet Khakh - File Upload</title>
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
                        <h2>User Administration</h2>
                        <!-- TODO: show add new user link -->
                        <!-- TODO: show list of current users, with link to edit/delete/update -->
                    </td>
                    
                </tr>
            </table>
        </div>
        
        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>