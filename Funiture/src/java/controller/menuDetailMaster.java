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
import model.entity.menuDetailMasterEntity;
import model.entity.userSecurityEntity;
import model.menuDetailMasterTable;
import model.menuGroupMasterTable;

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 *
 * @author Jik
 */
public class menuDetailMaster extends HttpServlet {

  //  private int menu_Code_Id;
  //  private int menuCodeId;

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
                        menuDetailMasterTable mdt = new menuDetailMasterTable(db);
                        menuDetailMasterEntity md = new menuDetailMasterEntity();
                        companyMasterTable cmt = new companyMasterTable(db);
                        HttpSession s = request.getSession(true);
                        userSecurityEntity lc = (userSecurityEntity) s.getAttribute("loginDetail");
                        int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
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
                            md.setMenuCIconLoc(mr.getParameter("uploadtmp"));
                        }
                        if (upFile.getFileName() != null && !upFile.getFileName().equals("")) {
                            md.setMenuCIconLoc("upload/picture/icon" + "/" + upFile.getFileName());
                        }
                        if (mr.getParameter("menuCodeId") != null && !mr.getParameter("menuCodeId").equals("")) {
                            md.setMenuCodeId(Integer.parseInt(mr.getParameter("menuCodeId")));
                            out.println("menuCodeId" + md.getMenuCodeId());
                        }
                        if (mr.getParameter("menuGroupId") != null) {
                            md.setMenuGroupId(Integer.parseInt(mr.getParameter("menuGroupId")));
                            out.println("menuGroupId" + md.getMenuGroupId());
                        }
                        if (mr.getParameter("menuModel") != null) {
                            md.setMenuGroupId(Integer.parseInt(mr.getParameter("menuModel")));
                            out.println("menuModel" + md.getMenuModel());
                         }
                        if (mr.getParameter("menuSeq") != null && !mr.getParameter("menuSeq").equals("")) {
                            md.setMenuSeq(Integer.parseInt(mr.getParameter("menuSeq")));
                            out.println("menuSeq" + md.getMenuSeq());
                        }
                        if (mr.getParameter("menuCNameT") != null) {
                            md.setMenuCNameT(mr.getParameter("menuCNameT"));
                            out.println("menuCNameT" + md.getMenuCNameT());
                        }
                        if (mr.getParameter("menuCNameE") != null) {
                            md.setMenuCNameE(mr.getParameter("menuCNameE"));
                            out.println("menuCNameE" + md.getMenuCNameE());
                        }
                        if (mr.getParameter("picId") != null && !mr.getParameter("picId").equals(""))  {
                            md.setPicId(Integer.parseInt(mr.getParameter("picId")));
                            out.println("picId" + md.getPicId());
                        }
                           if (mr.getParameter("menuCPicLoc") != null) {
                            md.setMenuCPicLoc(mr.getParameter("menuCPicLoc"));
                            out.println("menuCPicLoc" + md.getMenuCPicLoc());
                        }
                           if (mr.getParameter("menuCIconLoc") != null) {
                            md.setMenuCIconLoc(mr.getParameter("menuCIconLoc"));
                            out.println("menuCIconLoc" + md.getMenuCIconLoc());
                        }
                            if (mr.getParameter("showListSts") != null) {
                            md.setShowListSts(mr.getParameter("showListSts"));
                            out.println("showListSts" + md.getShowListSts());
                        }
                        if (mr.getParameter("menuCRemarkT") != null) {
                            md.setMenuCRemarkT(mr.getParameter("menuCRemarkT"));
                            out.println("menuCRemarkT" + md.getMenuCRemarkT());
                        }
                        if (mr.getParameter("menuCRemarkE") != null) {
                            md.setMenuCRemarkE(mr.getParameter("menuCRemarkE"));
                            out.println("menuCRemarkE" + md.getMenuCRemarkE());
                        }
                      
                        md.setCompanyId(Company_Id);
                        out.println("companyId" + md.getCompanyId());
                        md.setCreateDate(Timestamp.valueOf(db.getNow()));
                        out.println("createDate" + md.getCreateDate());
                        md.setUpdateDate(Timestamp.valueOf(db.getNow()));
                        out.println("updateDate" + md.getUpdateDate());
                        md.setUserId(lc.getUserId());
                      
                        if (mr.getParameter("action").equals("Add")) {
                            
                            Boolean chechDuplicate = mdt.checkDuplicate(md);
                            if (chechDuplicate == false) {
                                mdt.add(md);
                            } else {
                                db.close();
                                response.sendRedirect("menuDetailMaster.jsp?error=1");
                            }
                        }
                        if (mr.getParameter("action").equals("Edit")) {
                            mdt.update(md);
                        }
                        if (mr.getParameter("action").equals("Del")) {
                            md.setMenuCodeId(Integer.parseInt(mr.getParameter("menuCodeId")));
                            out.print(md.getMenuCodeId());
                            mdt.remove(md);
                        }
                        out.println("menuCNameT" + md.getMenuCNameT());
                        out.println("menuCodeId" + md.getMenuCodeId());
                        // out.println("quantity" + pgm.getQuantity());
                        db.close();
                        if (mr.getParameter("action").equals("Edit")) {
                         //   out.println("getMenuCNameT" + md.getMenuCNameT());
                            response.sendRedirect("menuDetailMaster.jsp?valid=1&menuCodeId=" +md.getMenuCodeId());
                        } else if (mr.getParameter("action").equals("Add")) {
                            response.sendRedirect("menuDetailMaster.jsp?valid=1");
                        }
                    }

                }
            } catch (Exception ex) {
                ex.printStackTrace(out);


            } finally {
                out.close();
            }
        } catch (UploadException ex) {
            Logger.getLogger(menuDetailMaster.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

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
