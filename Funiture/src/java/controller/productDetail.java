/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
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
import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadException;
import javazoom.upload.UploadFile;
import model.Database;
import model.companyMasterTable;
import model.entity.productDetailMasterEntity;
import model.entity.saleDiscountHMasterEntity;
import model.entity.stockMasterEntity;
import model.entity.unitMasterEntity;
import model.productDetailMasterTable;
import model.saleDiscountHMasterTable;
import model.stockMasterTable;
import model.unitMasterTable;

/**
 *
 * @author Achilles
 */
public class productDetail extends HttpServlet {

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
                        productDetailMasterTable pdmt = new productDetailMasterTable(db);
                        companyMasterTable cmt = new companyMasterTable(db);
                        productDetailMasterEntity pdm = new productDetailMasterEntity();
                        stockMasterTable smt = new stockMasterTable(db);
                        stockMasterEntity sm = new stockMasterEntity();
                        unitMasterTable umt = new unitMasterTable(db);
                        unitMasterEntity um = new unitMasterEntity();
                        saleDiscountHMasterTable sdht = new saleDiscountHMasterTable(db);
                        saleDiscountHMasterEntity sd = new saleDiscountHMasterEntity();
                        int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
                        Hashtable files = mr.getFiles();
                        Hashtable files3 = mr.getFiles();
                        UploadFile upFile = (UploadFile) files.get("upload");
                        UploadFile upFile3 = (UploadFile) files3.get("uploadIcon");
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

                                u.setFolderstore(getServletContext().getRealPath("upload/picture"));
                            }
                        }
                        u.store(mr, "upload");
                        if (mr.getParameter("uploadtmp") != null) {
                            pdm.setProductDPicLoc(mr.getParameter("uploadtmp"));
                        }
                        if (upFile.getFileName() != null && !upFile.getFileName().equals("")) {
                            pdm.setProductDPicLoc("upload/picture" + "/" + upFile.getFileName());
                        }
                        //============================================cataloge=======================================================================
                        if (upFile3.getFileName() != null && !upFile3.getFileName().equals("")) {
                            String filename = upFile3.getFileName();
                            String filetype = filename.substring(filename.lastIndexOf("."), filename.length());
                            if ((filetype.indexOf("gif") == -1) && (filetype.indexOf("jpeg") == -1) && (filetype.indexOf("jpg") == -1) && (filetype.indexOf("png") == -1)) {
                            } else {
                                if (filetype.endsWith("gif")) {
                                    upFile3.setFileName(System.currentTimeMillis() + ".gif");
                                } else if (filetype.endsWith("jpeg")) {
                                    upFile3.setFileName(System.currentTimeMillis() + ".jpeg");
                                } else if (filetype.endsWith("jpg")) {
                                    upFile3.setFileName(System.currentTimeMillis() + ".jpg");
                                } else if (filetype.endsWith("png")) {
                                    upFile3.setFileName(System.currentTimeMillis() + ".png");
                                }

                                u.setFolderstore(getServletContext().getRealPath("upload/picture/icon"));
                            }
                        }
                        u.store(mr, "uploadIcon");
                        if (mr.getParameter("uploadIcontmp") != null) {
                            pdm.setProductDIconLoc(mr.getParameter("uploadIcontmp"));
                        }
                        if (upFile3.getFileName() != null && !upFile3.getFileName().equals("")) {
                            pdm.setProductDIconLoc("upload/picture/icon" + "/" + upFile3.getFileName());
                        }
                        //================================================================================
                        if (mr.getParameter("productGroupId") != null && !mr.getParameter("productGroupId").equals("")) {
                            pdm.setProductGroupId(Integer.parseInt(mr.getParameter("productGroupId")));
                        }
                        if (mr.getParameter("colorId") != null && !mr.getParameter("colorId").equals("")) {
                            pdm.setProductColorId(Integer.parseInt(mr.getParameter("colorId")));
                        }
                        if (mr.getParameter("unitId") != null && !mr.getParameter("unitId").equals("")) {
                            pdm.setUnitId(Integer.parseInt(mr.getParameter("unitId")));
                        }
                        if (mr.getParameter("discountId") != null && !mr.getParameter("discountId").equals("")) {
                            pdm.setDiscountId(Integer.parseInt(mr.getParameter("discountId")));
                        }
                        if (mr.getParameter("productCode") != null && !mr.getParameter("productCode").equals("")) {
                            pdm.setProductCode(mr.getParameter("productCode"));
                        }
                        if (mr.getParameter("productModelCode") != null && !mr.getParameter("productModelCode").equals("")) {
                            pdm.setProductModelCode(mr.getParameter("productModelCode"));
                        }
                        if (mr.getParameter("productMaxSale") != null && !mr.getParameter("productMaxSale").equals("")) {
                            pdm.setProductMaxSale(Integer.parseInt(mr.getParameter("productMaxSale")));
                        }
                        if (mr.getParameter("productDetailId") != null && !mr.getParameter("productDetailId").equals("")) {
                            pdm.setProductDetailId(Integer.parseInt(mr.getParameter("productDetailId")));
                            sm.setProductDetailId(Integer.parseInt(mr.getParameter("productDetailId")));
                        }
                        if (mr.getParameter("price1") != null && !mr.getParameter("price1").equals("")) {
                            pdm.setProductPrice1(BigDecimal.valueOf(Double.parseDouble(mr.getParameter("price1"))));
                        }
                        if (mr.getParameter("price2") != null && !mr.getParameter("price2").equals("")) {
                            pdm.setProductPrice2(BigDecimal.valueOf(Double.parseDouble(mr.getParameter("price2"))));
                        }
                        if (mr.getParameter("price3") != null && !mr.getParameter("price3").equals("")) {
                            pdm.setProductPrice3(BigDecimal.valueOf(Double.parseDouble(mr.getParameter("price3"))));
                        }
                        if (mr.getParameter("price4") != null && !mr.getParameter("price4").equals("")) {
                            pdm.setProductPrice4(BigDecimal.valueOf(Double.parseDouble(mr.getParameter("price4"))));
                        }
                        if (mr.getParameter("nameTh") != null && !mr.getParameter("nameTh").equals("")) {
                            pdm.setProductDNameT(mr.getParameter("nameTh"));
                        }
                        if (mr.getParameter("nameEn") != null && !mr.getParameter("nameEn").equals("")) {
                            pdm.setProductDNameE(mr.getParameter("nameEn"));
                        }
                        if (mr.getParameter("productSpect1_T") != null && !mr.getParameter("productSpect1_T").equals("")) {
                            pdm.setProductSpect1_T(mr.getParameter("productSpect1_T"));
                        }
                        if (mr.getParameter("productSpect1_E") != null && !mr.getParameter("productSpect1_E").equals("")) {
                            pdm.setProductSpect1_E(mr.getParameter("productSpect1_E"));
                        }
                        if (mr.getParameter("productSpect2_T") != null && !mr.getParameter("productSpect2_T").equals("")) {
                            pdm.setProductSpect2_T(mr.getParameter("productSpect2_T"));
                        }
                        if (mr.getParameter("productSpect2_E") != null && !mr.getParameter("productSpect2_E").equals("")) {
                            pdm.setProductSpect2_E(mr.getParameter("productSpect2_E"));
                        }
                        if (mr.getParameter("productSpect3_T") != null && !mr.getParameter("productSpect3_T").equals("")) {
                            pdm.setProductSpect3_T(mr.getParameter("productSpect3_T"));
                        }
                        if (mr.getParameter("productSpect3_E") != null && !mr.getParameter("productSpect3_E").equals("")) {
                            pdm.setProductSpect3_E(mr.getParameter("productSpect3_E"));
                        }
                        if (mr.getParameter("productSpect4_T") != null && !mr.getParameter("productSpect4_T").equals("")) {
                            pdm.setProductSpect4_T(mr.getParameter("productSpect4_T"));
                        }
                        if (mr.getParameter("productSpect4_E") != null && !mr.getParameter("productSpect4_E").equals("")) {
                            pdm.setProductSpect4_E(mr.getParameter("productSpect4_E"));
                        }
                        if (mr.getParameter("productSpect5_T") != null && !mr.getParameter("productSpect5_T").equals("")) {
                            pdm.setProductSpect5_T(mr.getParameter("productSpect5_T"));
                        }
                        if (mr.getParameter("productSpect5_E") != null && !mr.getParameter("productSpect5_E").equals("")) {
                            pdm.setProductSpect5_E(mr.getParameter("productSpect5_E"));
                        }
                        if (mr.getParameter("productSpect6_T") != null && !mr.getParameter("productSpect6_T").equals("")) {
                            pdm.setProductSpect6_T(mr.getParameter("productSpect6_T"));
                        }
                        if (mr.getParameter("productSpect6_E") != null && !mr.getParameter("productSpect6_E").equals("")) {
                            pdm.setProductSpect6_E(mr.getParameter("productSpect6_E"));
                        }
                        if (mr.getParameter("productDRemarkT") != null && !mr.getParameter("productDRemarkT").equals("")) {
                            pdm.setProductDRemarkT(mr.getParameter("productDRemarkT"));
                        }
                        if (mr.getParameter("productDRemarkE") != null && !mr.getParameter("productDRemarkE").equals("")) {
                            pdm.setProductDRemarkE(mr.getParameter("productDRemarkE"));
                        }
                        if (mr.getParameter("productDDisplayFlag") != null && !mr.getParameter("productDDisplayFlag").equals("")) {
                            pdm.setProductDDisplayFlag(mr.getParameter("productDDisplayFlag"));
                        }
                        //sm.setQuantity(Integer.parseInt(mr.getParameter("qtyplus")) - Integer.parseInt(mr.getParameter("qtyminus")));
                        pdm.setCompanyId(Company_Id);
                        pdm.setCreateDate(Timestamp.valueOf(db.getNow()));
                        pdm.setUpdateDate(Timestamp.valueOf(db.getNow()));
                        sm.setCreateDate(Timestamp.valueOf(db.getNow()));
                        sm.setUpdateDate(Timestamp.valueOf(db.getNow()));
                        //sm.setReceiveDate(Date.valueOf(request.getParameter("receiveDate")));
                        sm.setCompanyId(Company_Id);
                        sm.setUnitId(Integer.parseInt(mr.getParameter("unitId")));
                        if (mr.getParameter("action").equals("Add")) {
                            Boolean checkDuplicate = pdmt.checkDuplicate(pdm);
                            if (checkDuplicate == false) {
                                pdmt.add(pdm);
                                sm.setProductDetailId(pdmt.getProductId(pdm));
                                smt.add(sm);
                            } else {
                                db.close();
                                response.sendRedirect("ProductDetail.jsp?error=1");
                            }

                        }
                        if (mr.getParameter("action").equals("Edit")) {
                            pdmt.update(pdm);
                            if (smt.getAvailable(sm) == false) {
                                smt.add(sm);
                            } else {
                                smt.update(sm);
                            }
                        }
                        if (mr.getParameter("action").equals("Del")) {
                            pdmt.remove(pdm);
                        }
                        db.close();
                        if (mr.getParameter("action").equals("Edit")) {
                            response.sendRedirect("ProductDetail.jsp?valid=1&productDetailId=" + pdm.getProductDetailId());
                        } else if (mr.getParameter("action").equals("Add")) {
                            response.sendRedirect("ProductDetail.jsp?valid=1");
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
