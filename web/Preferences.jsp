<%-- 
    Document   : FileUpload
    Author     : hskhakh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project - Harpreet Khakh - Preferences</title>
        <link rel="stylesheet" type="text/css" href="page_style.css"/>
        <script src="scripts.js"></script>
    </head>
    <body>
        <div id="header">
            <%@include file="header.jsp" %>
        </div>
        
        <div id="content">
            <table>
                <tr>
                    <td>
                        <h2>Preferences</h2>
                        Look and feel<br/>
                        <!-- TODO: show options for look and feel here -->
                        Landing page <br/>
                        <!-- TODO: show options to select landing page here -->
                    </td>
                    <td>
                        <%=request.getAttribute("file_name")==null?"":request.getAttribute("file_name")%>
                        
                    </td>
                </tr>
            </table>
        </div>
        
        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>