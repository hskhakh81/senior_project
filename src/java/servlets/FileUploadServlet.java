package servlets;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

/**
 *
 * @author hskhakh
 */
@MultipartConfig
public class FileUploadServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //define variables
        String upload_log = "";
        String line = null;
        int upload_type = 2; //will be stored in table upload_type_master
        DataSource ds;
        Connection con = null;
        Statement st = null;
        PreparedStatement pst = null;
        long counter = 0;
        long records_inserted = 0;
        String user = "hkhakh";
        
        //get File Part
        Part file = request.getPart("filename");
        String file_name = getFileNameFromPart(file);
        
        
        if (file != null) {
            try {
                // Get a handle to the JNDI environment naming context
                Context env = (Context) new InitialContext().lookup("java:comp/env");
                // Get value for upload path
                String uploadPath = (String) env.lookup("UploadPath");

                upload_log = "Uploading file ... ";
                
                //upload file
                byte[] b = new byte[1024];
                InputStream inFile = file.getInputStream();
                FileOutputStream outFile = new FileOutputStream(
                        new File(uploadPath + File.separator + getFileNameFromPart(file)));
                while (inFile.read(b) > 0) {
                    outFile.write(b);
                }

                upload_log = upload_log.concat("File uploaded, adding contents to database...");
            
                inFile.close();
                outFile.close();
                
                BufferedReader in = new BufferedReader(new FileReader(
                                new File(uploadPath + File.separator + file_name)));
                
                File dir = new File(uploadPath);
                for(File f: dir.listFiles()) {
                    System.out.println(f.getName());
                }
                //insert file into database
                //get jdbc datasource
                ds = (DataSource) env.lookup("jdbc/csci198");
                //get connection from datasource
                con = ds.getConnection();
                //create statement
                st = con.createStatement();
                
                ResultSet rs1 = st.getGeneratedKeys();
                
                
                int file_id = st.executeUpdate("insert into Upload_Header (file_name, upload_type) "
                        + " values ('" + file_name + "','" + upload_type + "')");
                
                System.out.println("File_id after insert:" + file_id);
                
                pst = con.prepareStatement("insert into upload_detail (file_id, "
                        + "line_num, line_content, created_by, created_on) "
                        + "values (?,?,?)");
                //insert records
                while((line = in.readLine()) != null) {
                    //  file_name, line_number, line_contents
                    System.out.println(line);
                    pst.setInt(1, file_id);
                    pst.setLong(2, ++counter);
                    pst.setString(3, line);
                    pst.setString(4, user);
                    pst.setDate(5, new java.sql.Date(System.currentTimeMillis()));
                    records_inserted += pst.executeUpdate();
                    
                }
                //close file
                in.close();
                
                //close statement and connection
                //if (!st.isClosed()) st.close();
                //if (!con.isClosed()) con.close();
                
                upload_log = upload_log.concat("File added to database (" + records_inserted + " records inserted)... finishing file processing ...");

                //move file to processed folder
                //check if processed folder exists in uploadPath folder
                //request.setAttribute("file_name", uploadPath);
                

            } catch (NamingException ne) {
                request.setAttribute("upload_status", "failed.");
                request.setAttribute("error", "Naming Exception: " + ne);
            } catch (SQLException e) {
                request.setAttribute("upload_status", "failed.");
                request.setAttribute("error", "SQL Exception: " + e);
            } finally {
                //close statement and connection
                try {
                   if (pst != null && !pst.isClosed()) pst.close();
                   if (st != null && !st.isClosed()) st.close();
                   if (con != null && !con.isClosed()) con.close();
                } catch (SQLException e) {
                    request.setAttribute("upload_status", "failed.");
                    request.setAttribute("error", "SQL Exception: " + e);
                }
            }
            
            upload_log = upload_log.concat("File uploaded successfully.");
            
        } else {
            //part is null
            //TODO: what to do here?
            upload_log = "Nothing to upload";
        }
        
        request.setAttribute("upload_comments", upload_log);
        
        getServletContext().getRequestDispatcher("/FileUpload.jsp").forward(request, response);

        //response.sendRedirect("FileUpload");
    }

    /**
     * Gets file name from Part
     *
     * @param p
     * @return file name, if available in content-disposition header of part,
     * null otherwise
     */
    private String getFileNameFromPart(Part p) {
        //get file name from Part header content-disposition
        String file_name = null;
        //look thorugh all parts of content-disposition header
        for (String s : p.getHeader("content-disposition").split(";")) {
            //check for string starting with filename 
            if (s.trim().startsWith("filename")) {
                //get value (right side of equals sign) and remove quotes
                file_name = s.substring(s.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return file_name;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
