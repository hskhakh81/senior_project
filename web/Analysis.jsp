<%-- 
    Document   : FileUpload
    Author     : hskhakh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project - Harpreet Khakh - Analysis</title>
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
                        <h2>Analysis</h2>
                        
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