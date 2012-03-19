/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Hashtable;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
import model.entity.companyMasterEntity;

/**
 *
 * @author Jik
 */
public class companyMasterController extends HttpServlet {

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
                if (MultipartFormDataRequest.isMultipartFormData(request)) {
                    if (mr.getParameter("action") != null && !mr.getParameter("action").equals("")) {
                        Database db = new Database();
                        HttpSession s = request.getSession();
                        companyMasterTable cpm = new companyMasterTable(db);
                        companyMasterEntity cp = new companyMasterEntity();
                        Hashtable files = mr.getFiles();
                        UploadFile upFile = (UploadFile) files.get("uploadhead");
                        UploadFile upFile2 = (UploadFile) files.get("uploadcataloge");
                        UploadBean u = new UploadBean();
                        //===============================heade=================================================
                        if (upFile.getFileName() != null && !upFile.getFileName().equals("")) {
                            String filename = upFile.getFileName();
                            String filetype = filename.substring(filename.lastIndexOf("."), filename.length());
                            if ((filetype.indexOf("gif") == -1) && (filetype.indexOf("jpeg") == -1) && (filetype.indexOf("jpg") == -1) && (filetype.indexOf("png") == -1)) {
                            } else {
                                if (filetype.endsWith("gif")) {
                                    upFile.setFileName(System.currentTimeMillis() + ".gif");
                                } else if (filetype.endsWith("jpeg")) {
                                    upFile.setFileName(System.currentTimeMillis() + ".jpeg");
                                } else if (filetype.endsWith("jpg")) {
                                    upFile.setFileName(System.currentTimeMillis() + ".jpg");
                                } else if (filetype.endsWith("png")) {
                                    upFile.setFileName(System.currentTimeMillis() + ".png");
                                }
                                u.setFolderstore(getServletContext().getRealPath("upload/picture/head"));
                            }
                        }
                        u.store(mr, "uploadhead");
                        if (upFile.getFileName() != null) {
                            if (mr.getParameter("uploadheadtmp") != null && upFile.getFileName().equals("")) {
                                cp.setCompanyHeaderLoc(mr.getParameter("uploadheadtmp"));
                            } else
                                if (!upFile.getFileName().equals("")) {
                                cp.setCompanyHeaderLoc("upload/picture/head" + "/" + upFile.getFileName());
                            }
                            out.print(cp.getCompanyHeaderLoc());
                        }
                        //============================================cataloge=======================================================================
                        if (upFile2.getFileName() != null && !upFile2.getFileName().equals("")) {
                            String filename = upFile2.getFileName();
                            String filetype = filename.substring(filename.lastIndexOf("."), filename.length());
                            if ((filetype.indexOf("gif") == -1) && (filetype.indexOf("jpeg") == -1) && (filetype.indexOf("jpg") == -1) && (filetype.indexOf("png") == -1)) {
                            } else {
                                if (filetype.endsWith("gif")) {
                                    upFile2.setFileName(System.currentTimeMillis() + ".gif");
                                } else if (filetype.endsWith("jpeg")) {
                                    upFile2.setFileName(System.currentTimeMillis() + ".jpeg");
                                } else if (filetype.endsWith("jpg")) {
                                    upFile2.setFileName(System.currentTimeMillis() + ".jpg");
                                } else if (filetype.endsWith("png")) {
                                    upFile2.setFileName(System.currentTimeMillis() + ".png");
                                }

                                u.setFolderstore(getServletContext().getRealPath("upload/picture/calaloge"));
                            }
                        }
                        u.store(mr, "uploadcataloge");
                        if (upFile2.getFileName() != null) {
                            if (mr.getParameter("uploadcatalogetmp") != null && upFile2.getFileName().equals("")) {
                                cp.setCompanyCatalogLoc(mr.getParameter("uploadcatalogetmp"));
                            } else if (!upFile.getFileName().equals("")) {
                                cp.setCompanyCatalogLoc("upload/picture/cataloge" + "/" + upFile2.getFileName());
                            }
                        }
                         if (mr.getParameter("companyId") != null && !mr.getParameter("companyId").equals("")) {
                            cp.setCompanyId(Integer.parseInt(mr.getParameter("companyId")));

                        }
                        if (request.getParameter("companyCode") != null) {
                            cp.setCompanyCode(request.getParameter("companyCode"));
                        }
                        if (request.getParameter("companyNameT") != null) {
                            cp.setCompanyNameT(request.getParameter("companyNameT"));
                        }
                        if (request.getParameter("companyNameE") != null) {
                            cp.setCompanyNameE(request.getParameter("companyNameE"));
                        }
                        if (request.getParameter("companyAbbr") != null) {
                            cp.setCompanyAbbr(request.getParameter("companyAbbr"));
                        }
                        if (request.getParameter("companyLogoLoc") != null) {
                            cp.setCompanyLogoLoc(request.getParameter("companyLogoLoc"));
                        }
                        if (request.getParameter("companyAddrT") != null) {
                            cp.setCompanyAddrT(request.getParameter("companyAddrT"));
                        }
                        if (request.getParameter("companyAddrE") != null) {
                            cp.setCompanyAddrE(request.getParameter("companyAddrE"));
                        }
                        if (request.getParameter("companyDistrictT") != null) {
                            cp.setCompanyDistrictT(request.getParameter("companyDistrictT"));
                        }
                        if (request.getParameter("companyDistrictE") != null) {
                            cp.setCompanyDistrictE(request.getParameter("companyDistrictE"));
                        }
                        if (request.getParameter("companyAmphurT") != null) {
                            cp.setCompanyAmphurT(request.getParameter("companyAmphurT"));
                        }
                        if (request.getParameter("companyAmphurE") != null) {
                            cp.setCompanyAmphurE(request.getParameter("companyAmphurE"));
                        }
                        if (request.getParameter("companyProvinceT") != null) {
                            cp.setCompanyProvinceT(request.getParameter("companyProvinceT"));
                        }
                        if (request.getParameter("companyProvinceE") != null) {
                            cp.setCompanyProvinceE(request.getParameter("companyProvinceE"));
                        }
                        if (request.getParameter("companyPostCode") != null) {
                            cp.setCompanyPostCode(request.getParameter("companyPostCode"));
                        }
                        if (request.getParameter("companyTel1") != null) {
                            cp.setCompanyTel1(request.getParameter("companyTel1"));
                        }
                        if (request.getParameter("companyTel2") != null) {
                            cp.setCompanyTel2(request.getParameter("companyTel2"));
                        }
                        if (request.getParameter("companyTel3") != null) {
                            cp.setCompanyTel3(request.getParameter("companyTel3"));
                        }
                        if (request.getParameter("companyFax1") != null) {
                            cp.setCompanyFax1(request.getParameter("companyFax1"));
                        }
                        if (request.getParameter("companyFax2") != null) {
                            cp.setCompanyFax2(request.getParameter("companyFax2"));
                        }
                        if (request.getParameter("companyFax3") != null) {
                            cp.setCompanyFax3(request.getParameter("companyFax3"));
                        }
                        if (request.getParameter("companyMobile1") != null) {
                            cp.setCompanyMobile1(request.getParameter("companyMobile1"));
                        }
                        if (request.getParameter("companyMobile2") != null) {
                            cp.setCompanyMobile2(request.getParameter("companyMobile2"));
                        }
                        if (request.getParameter("companyMobile3") != null) {
                            cp.setCompanyMobile3(request.getParameter("companyMobile3"));
                        }
                        if (request.getParameter("companyEmail1") != null) {
                            cp.setCompanyNameT(request.getParameter("companyEmail1"));
                        }
                        if (request.getParameter("companyEmail2") != null) {
                            cp.setCompanyEmail2(request.getParameter("companyEmail2"));
                        }
                        if (request.getParameter("companyEmail3") != null) {
                            cp.setCompanyEmail3(request.getParameter("companyEmail3"));
                        }
                        if (request.getParameter("languageFlag") != null) {
                            cp.setLanguageFlag(request.getParameter("languageFlag"));
                        }
                        if (request.getParameter("showStockBalanceFlag") != null) {
                            cp.setPicCode(request.getParameter("showStockBalanceFlag"));
                        }
                        if (request.getParameter("showPriceListFlag") != null) {
                            cp.setPicCode(request.getParameter("showPriceListFlag"));
                        }
                        if (request.getParameter("showOrderFlag") != null) {
                            cp.setPicCode(request.getParameter("showOrderFlag"));
                        }
                        cp.setCreateDate(Timestamp.valueOf(db.getNow()));
                        cp.setUpdateDate(Timestamp.valueOf(db.getNow()));
                        if (mr.getParameter("action").equals("Add")) {
                            cpm.add(cp);
                        }
                        if (mr.getParameter("action").equals("Edit")) {

                            cpm.update(cp);
                            //out.println("xxx"+cp.getCompanyHeaderLoc());
                       //response.sendRedirect("Company.jsp?companyId=" + cp.getCompanyId());
                        }
                        if (mr.getParameter("action").equals("Del")) {
                            cpm.remove(cp);
                        }
                        db.close();
//                                                if (mr.getParameter("action").equals("Edit")) {
//                                                    response.sendRedirect("ProductDetail.jsp?productDetailId=" + cp.getProductDetailId());
//                                                } else if (mr.getParameter("action").equals("Add")) {
//                                                    response.sendRedirect("ProductDetail.jsp");
//                                                }
                    }
                }
            } catch (Exception ex) {
                ex.printStackTrace(out);
            } finally {
                out.close();
            }
        } catch (UploadException ex) {
            Logger.getLogger(companyMasterController.class.getName()).log(Level.SEVERE, null, ex);
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
