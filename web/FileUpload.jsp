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
    </head>
    <body>
        <div id="header">
            <%@include file="header.jsp" %>
        </div>
        
        <div id="content">
            <table>
                <tr>
                    <td>
                        <h2>File upload</h2>
                        <form method="post" action="FileUploadServlet" enctype="multipart/form-data">
                            <table>
                                <tr>
                                    <td>Select File </td>
                                    <td><input type="file"  id="filename" 
                                               name="filename" 
                                               onchange="updateFilename(this.value)" 
                                               style="background-color: lemonchiffon" /></td>
                                    
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: right;">
                                        <span id="filename_error" style="color: red"></span>
                                    <!--<td><input type="text" border="0" id="filename_error" > </td> -->
                                    </td>
                                </tr>
                                <tr>
                                    
                                    <td colspan="2" style="padding-top: 10px; text-align: right;">
                                        <input type="Reset" 
                                               onclick="javascript:document.getElementById('filename_error').textContent=''">
                                        <input type="Submit">
                                    </td>
                                </tr>

                            </table>
                        </form>
                    </td>
                    <td>
                        <%=request.getAttribute("upload_status")==null?"":"Upload Status: " + request.getAttribute("upload_status") + "<br/>"%>
                        <%=request.getAttribute("upload_comments")==null?"":"Upload Comments: " + request.getAttribute("upload_comments") + "<br/>"%>
                        <%=request.getAttribute("error")==null?"":"ERROR:" + request.getAttribute("error") + "<br/>"%>
                        
                    </td>
                </tr>
            </table>
        </div>
        
        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>