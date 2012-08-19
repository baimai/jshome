/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Hashtable;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadException;
import javazoom.upload.UploadFile;
import model.Database;
import model.companyMasterTable;
import model.entity.productGroupMasterEntity;
import model.entity.userSecurityEntity;
import model.productGroupMasterTable;

/**
 *
 * @author Achilles
 */
public class productGroup extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            request.setCharacterEncoding("utf-8");
            int uploadlimit = 1024 * 1024 * 1024;
            Vector listeners = null; // No upload listeners
            String parser = MultipartFormDataRequest.COSPARSER; // Cos parser
            String encoding = "utf-8";
            MultipartFormDataRequest mr;
            mr = new MultipartFormDataRequest(request, listeners, uploadlimit, parser, encoding);
            try {
                //productCode=&companyCode=&price1=500.00&price2=400.00&price3=300.00&picLoc=&iconLoc=&nameTh=กกกก&nameEn=ssss&spec1Th=1&spec1En=a&spec2Th=2&spec2En=b&spec3Th=3&spec3En=c&spec4Th=4&spec4En=d&spec5Th=5&spec5En=e&spec6Th=6&spec6En=f&remarkTh=gg&remarkEn=fff
                if (MultipartFormDataRequest.isMultipartFormData(request)) {
                    if (mr.getParameter("action") != null && !mr.getParameter("action").equals("")) {
                        Database db = new Database();
                        int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
                        productGroupMasterTable pgmt = new productGroupMasterTable(db);
                        companyMasterTable cmt = new companyMasterTable(db);
                        productGroupMasterEntity pgm = new productGroupMasterEntity();
                        HttpSession s = request.getSession(true);
                        userSecurityEntity lc = (userSecurityEntity) s.getAttribute("loginDetail");
                        // int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
                        Hashtable files = mr.getFiles();
                        UploadFile upFile = (UploadFile) files.get("upload");
                        UploadBean u = new UploadBean();
                        if (upFile.getFileName() != null && !upFile.getFileName().equals("")) {
                            String filename = upFile.getFileName();
                            String filetype = filename.substring(filename.lastIndexOf("."), filename.length());
                            if ((filetype.indexOf("gif") == -1) && (filetype.indexOf("jpeg") == -1) && (filetype.indexOf("jpg") == -1) && (filetype.indexOf("png") == -1)) {
                            } else {
                                if (filetype.endsWith("gif")) {
                                    upFile.setFileName(filename + ".gif");
                                } else if (filetype.endsWith("jpeg")) {
                                    upFile.setFileName(filename + ".jpeg");
                                } else if (filetype.endsWith("jpg")) {
                                    upFile.setFileName(filename + ".jpg");
                                } else if (filetype.endsWith("png")) {
                                    upFile.setFileName(filename + ".png");
                                }
                                u.setFolderstore(getServletContext().getRealPath("upload/picture/icon"));
                            }
                        }
                        u.store(mr, "upload");
                        if (mr.getParameter("uploadtmp") != null) {
                            pgm.setProductIconLoc(mr.getParameter("uploadtmp"));
                        }
                        if (upFile.getFileName() != null && !upFile.getFileName().equals("")) {
                            pgm.setProductIconLoc("upload/picture/icon" + "/" + upFile.getFileName());
                        }
                        pgm.setCompanyId(Company_Id);
                        if (mr.getParameter("productGroupId") != null && !mr.getParameter("productGroupId").equals("")) {
                            pgm.setProductGroupId(Integer.parseInt(mr.getParameter("productGroupId")));
                        }
                        if (mr.getParameter("productGroupCode") != null) {
                            pgm.setProductGroupCode(mr.getParameter("productGroupCode"));
                        }
                        if (mr.getParameter("productGNameT") != null) {
                            pgm.setProductGNameT(mr.getParameter("productGNameT"));
                        }
                        if (mr.getParameter("productGNameE") != null) {
                            pgm.setProductGNameE(mr.getParameter("productGNameE"));
                        }
                        if (mr.getParameter("productRemarkT") != null) {
                            pgm.setProductRemarkT(mr.getParameter("productRemarkT"));
                        }
                        if (mr.getParameter("productRemarkE") != null) {
                            pgm.setProductRemarkE(mr.getParameter("productRemarkE"));
                        }
                        if (mr.getParameter("productGDisplayFlag") != null) {
                            pgm.setProductGDisplayFlag(mr.getParameter("productGDisplayFlag"));
                        }
                        pgm.setCreateDate(Timestamp.valueOf(db.getNow()));
                        pgm.setUpdateDate(Timestamp.valueOf(db.getNow()));
                        pgm.setUserId(lc.getUserId());

                        if (mr.getParameter("action").equals("Add")) {
                            Boolean checkDuplicate = pgmt.checkDuplicate(pgm);
                            if (checkDuplicate == false) {
                                pgmt.add(pgm);
                            } else {
                                db.close();
                                response.sendRedirect("addProductGroup.jsp?error=1");
                            }
                        }
                        if (mr.getParameter("action").equals("Edit")) {
                            pgmt.update(pgm);
                        }
                        if (mr.getParameter("action").equals("Del")) {
                            pgmt.remove(pgm);
                        }
                        db.close();
                        if (mr.getParameter("action").equals("Edit")) {
                            out.println("productGNameT" + pgm.getProductGNameT());
                            response.sendRedirect("addProductGroup.jsp?valid=1&productGroupId=" + pgm.getProductGroupId());
                        } else if (mr.getParameter("action").equals("Add")) {
                            response.sendRedirect("addProductGroup.jsp?valid=1&menuCodeId=" + pgm.getProductGroupId());
                        }
                    }
                }
                
            } catch (Exception ex) {
                ex.printStackTrace(out);

            } finally {
                out.close();
            }
        } catch (UploadException ex) {
            Logger.getLogger(productDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
