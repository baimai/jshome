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
                        UploadFile upFile3 = (UploadFile) files.get("uploadlogoLog");
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
                            } else if (!upFile.getFileName().equals("")) {
                                cp.setCompanyHeaderLoc("upload/picture/head" + "/" + upFile.getFileName());
                            }

                        }
                        out.println("CompanyHeaderLoc====" + cp.getCompanyHeaderLoc());
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
                        //=============================logoLog============================================
                        //============================================cataloge=======================================================================
                        if (upFile3.getFileName() != null && !upFile3.getFileName().equals("")) {
                            String filename = upFile3.getFileName();
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

                                u.setFolderstore(getServletContext().getRealPath("upload/picture/logo"));
                            }
                        }
                        u.store(mr, "uploadlogoLog");
                        if (upFile3.getFileName() != null) {
                            if (mr.getParameter("uploadlogoLogtmp") != null && upFile3.getFileName().equals("")) {
                                cp.setCompanyLogoLoc(mr.getParameter("uploadlogoLogtmp"));
                            } else if (!upFile.getFileName().equals("")) {
                                cp.setCompanyLogoLoc("upload/picture/logo" + "/" + upFile3.getFileName());
                            }
                        }
                        //================================================================================
                        out.println("cataloge===" + cp.getCompanyCatalogLoc());

                        if (mr.getParameter("companyId") != null && !mr.getParameter("companyId").equals("")) {
                            cp.setCompanyId(Integer.parseInt(mr.getParameter("companyId")));
                        }


                        if (mr.getParameter("companyCode") != null) {
                            cp.setCompanyCode(mr.getParameter("companyCode"));

                        }
                        //
                        if (mr.getParameter("companyNameT==") != null) {
                            cp.setCompanyNameT(mr.getParameter("companyNameT"));

                        }
                        if (mr.getParameter("companyNameE") != null) {
                            cp.setCompanyNameE(mr.getParameter("companyNameE"));
                            //   out.println("companyNameE==" + cp.getCompanyNameE());
                        }
                        // out.println("companyNameT==" + cp.getCompanyNameT());
                        if (mr.getParameter("companyAbbr") != null) {
                            cp.setCompanyAbbr(mr.getParameter("companyAbbr"));

                        }
                        //  out.println("companyAbbr===" + cp.getCompanyAbbr());
                        if (mr.getParameter("companyLogoLoc") != null) {
                            cp.setCompanyLogoLoc(mr.getParameter("companyLogoLoc"));

                        }
                        // out.println("companyLogoLoc==" + cp.getCompanyLogoLoc());
                        if (mr.getParameter("companyAddrT") != null) {
                            cp.setCompanyAddrT(mr.getParameter("companyAddrT"));

                        }
                        // out.println("companyAddrT===" + cp.getCompanyAddrT());
                        if (mr.getParameter("companyAddrE") != null) {
                            cp.setCompanyAddrE(mr.getParameter("companyAddrE"));

                        }
                        // out.println("companyAddrE" + cp.getCompanyAddrE());
                        if (mr.getParameter("companyDistrictT") != null) {
                            cp.setCompanyDistrictT(mr.getParameter("companyDistrictT"));

                        }
                        //  out.println("companyDistrictT===" + cp.getCompanyDistrictT());
                        if (mr.getParameter("companyDistrictE") != null) {
                            cp.setCompanyDistrictE(mr.getParameter("companyDistrictE"));

                        }
                        //   out.println("companyDistrictE===" + cp.getCompanyDistrictE());
                        if (mr.getParameter("companyAmphurT") != null) {
                            cp.setCompanyAmphurT(mr.getParameter("companyAmphurT"));

                        }
                        //   out.println("companyAmphurT===" + cp.getCompanyAmphurT());
                        if (mr.getParameter("companyAmphurE") != null) {
                            cp.setCompanyAmphurE(mr.getParameter("companyAmphurE"));

                        }
                        // out.println("companyAmphurE===" + cp.getCompanyAmphurE());
                        if (mr.getParameter("companyProvinceT") != null) {
                            cp.setCompanyProvinceT(mr.getParameter("companyProvinceT"));

                        }
                        //  out.println("companyProvinceT===" + cp.getCompanyProvinceT());
                        if (mr.getParameter("companyProvinceE") != null) {
                            cp.setCompanyProvinceE(mr.getParameter("companyProvinceE"));

                        }
                        //  out.println("companyProvinceE===" + cp.getCompanyProvinceE());
                        if (mr.getParameter("companyPostCode") != null) {
                            cp.setCompanyPostCode(mr.getParameter("companyPostCode"));

                        }
                        // out.println("companyPostCode===" + cp.getCompanyPostCode());
                        if (mr.getParameter("companyTel1") != null) {
                            cp.setCompanyTel1(mr.getParameter("companyTel1"));

                        }
                        //  out.println("companyTel1===" + cp.getCompanyTel1());
                        if (mr.getParameter("companyTel2") != null) {
                            cp.setCompanyTel2(mr.getParameter("companyTel2"));

                        }
                        // out.println("companyTel2===" + cp.getCompanyTel2());
                        if (mr.getParameter("companyTel3") != null) {
                            cp.setCompanyTel3(mr.getParameter("companyTel3"));

                        }
                        // out.println("companyTel3===" + cp.getCompanyTel3());
                        if (mr.getParameter("companyFax1") != null) {
                            cp.setCompanyFax1(mr.getParameter("companyFax1"));

                        }
                        //
                        if (mr.getParameter("companyFax2") != null) {
                            cp.setCompanyFax2(mr.getParameter("companyFax2"));

                        }
                        // out.println("companyFax1===" + cp.getCompanyFax2());
                        if (mr.getParameter("companyFax3") != null) {
                            cp.setCompanyFax3(mr.getParameter("companyFax3"));

                        }
                        //  out.println("companyFax1===" + cp.getCompanyFax3());
                        if (mr.getParameter("companyMobile1") != null) {
                            cp.setCompanyMobile1(mr.getParameter("companyMobile1"));

                        }
                        // out.println("companyMobile1===" + cp.getCompanyMobile1());
                        if (mr.getParameter("companyMobile2") != null) {
                            cp.setCompanyMobile2(mr.getParameter("companyMobile2"));

                        }
                        // out.println("companyMobile1===" + cp.getCompanyMobile2());
                        if (mr.getParameter("companyMobile3") != null) {
                            cp.setCompanyMobile3(mr.getParameter("companyMobile3"));

                        }
                        //  out.println("companyMobile1===" + cp.getCompanyMobile3());
                        if (mr.getParameter("companyEmail1") != null) {
                            cp.setCompanyNameT(mr.getParameter("companyEmail1"));

                        }
                        // out.println("companyEmail1===" + cp.getCompanyEmail1());
                        if (mr.getParameter("companyEmail2") != null) {
                            cp.setCompanyEmail2(mr.getParameter("companyEmail2"));

                        }
                        // out.println("companyEmail1===" + cp.getCompanyEmail2());
                        if (mr.getParameter("companyEmail3") != null) {
                            cp.setCompanyEmail3(mr.getParameter("companyEmail3"));

                        }
                        // out.println("companyEmail1===" + cp.getCompanyEmail3());
                        if (mr.getParameter("languageFlag") != null) {
                            cp.setLanguageFlag(mr.getParameter("languageFlag"));

                        }
                        //out.println("languageFlag===" + cp.getLanguageFlag());
                        if (mr.getParameter("showStockBalanceFlag") != null) {
                            cp.setShowStockBalanceFlag(mr.getParameter("showStockBalanceFlag"));

                        }
                        // out.println("showStockBalanceFlag===" + cp.getShowStockBalanceFlag());
                        if (mr.getParameter("showPriceListFlag") != null) {
                            cp.setShowPriceListFlag(mr.getParameter("showPriceListFlag"));

                        }
                        // out.println("showPriceListFlag===" + cp.getShowPriceListFlag());
                        if (mr.getParameter("showOrderFlag") != null) {
                            cp.setShowOrderFlag(mr.getParameter("showOrderFlag"));

                        }
                       // cp.setCompanyId(Company_Id);
                        // out.println("showOrderFlag===" + cp.getShowOrderFlag());
                        cp.setCreateDate(Timestamp.valueOf(db.getNow()));                       
                        cp.setUpdateDate(Timestamp.valueOf(db.getNow()));
                      
                        if (mr.getParameter("action").equals("Add")) {
                            cpm.add(cp);
                        }
                        if (mr.getParameter("action").equals("Edit")) {

                            cpm.update(cp);
                            out.println("companyCode===" + cp.getCompanyCode());
                            out.println("companyNameE==" + cp.getCompanyNameE());
                            out.println("companyNameT==" + cp.getCompanyNameT());
                            out.println("companyAbbr===" + cp.getCompanyAbbr());
                            out.println("companyLogoLoc==" + cp.getCompanyLogoLoc());
                            out.println("companyAddrT===" + cp.getCompanyAddrT());
                            out.println("companyAddrE" + cp.getCompanyAddrE());
                            out.println("companyDistrictT===" + cp.getCompanyDistrictT());
                            out.println("companyDistrictE===" + cp.getCompanyDistrictE());
                            out.println("companyAmphurT===" + cp.getCompanyAmphurT());
                            out.println("companyAmphurE===" + cp.getCompanyAmphurE());
                            out.println("companyProvinceT===" + cp.getCompanyProvinceT());
                            out.println("companyProvinceE===" + cp.getCompanyProvinceE());
                            out.println("companyPostCode===" + cp.getCompanyPostCode());
                            out.println("companyTel1===" + cp.getCompanyTel1());
                            out.println("companyTel2===" + cp.getCompanyTel2());
                            out.println("companyTel3===" + cp.getCompanyTel3());
                            out.println("companyFax1===" + cp.getCompanyFax1());
                            out.println("companyFax1===" + cp.getCompanyFax2());
                            out.println("companyFax1===" + cp.getCompanyFax3());
                            out.println("companyMobile1===" + cp.getCompanyMobile1());
                            out.println("companyMobile1===" + cp.getCompanyMobile2());
                            out.println("companyMobile1===" + cp.getCompanyMobile3());
                            out.println("companyEmail1===" + cp.getCompanyEmail1());
                            out.println("companyEmail1===" + cp.getCompanyEmail2());
                            out.println("companyEmail1===" + cp.getCompanyEmail3());
                            out.println("languageFlag===" + cp.getLanguageFlag());
                            out.println("showStockBalanceFlag===" + cp.getShowStockBalanceFlag());
                            out.println("showPriceListFlag===" + cp.getShowPriceListFlag());
                            out.println("showOrderFlag===" + cp.getShowOrderFlag());
                            out.println("CreateDate===" + cp.getCreateDate());
                            out.println("UpdateDate===" + cp.getUpdateDate());


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
