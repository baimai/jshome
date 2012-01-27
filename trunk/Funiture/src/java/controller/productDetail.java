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
import model.productDetailMasterTable;

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
                                    upFile.setFileName(System.currentTimeMillis() + ".gif");
                                } else if (filetype.endsWith("jpeg")) {
                                    upFile.setFileName(System.currentTimeMillis() + ".jpeg");
                                } else if (filetype.endsWith("jpg")) {
                                    upFile.setFileName(System.currentTimeMillis() + ".jpg");
                                } else if (filetype.endsWith("png")) {
                                    upFile.setFileName(System.currentTimeMillis() + ".png");
                                }

                                u.setFolderstore((getServletContext().getRealPath("upload\\picture")).replace("\\build\\web", ""));
                            }
                        }
                        u.store(mr, "upload");


                        if (upFile.getFileName() != null ) {
                            if (mr.getParameter("uploadtmp") != null &&upFile.getFileName().equals("")) {
                                pdm.setProductDPicLoc(mr.getParameter("uploadtmp"));
                            }else if (!upFile.getFileName().equals("")){
                                pdm.setProductDPicLoc((getServletContext().getRealPath("upload\\picture")).replace("\\build\\web", "") + "\\" + upFile.getFileName());
                            }
                        }
                        if (mr.getParameter("productGroupId") != null && !mr.getParameter("productGroupId").equals("")) {
                            pdm.setProductGroupId(Integer.parseInt(mr.getParameter("productGroupId")));
                        }
                        if (mr.getParameter("colorId") != null && !mr.getParameter("colorId").equals("")) {
                            pdm.setProductColorId(Integer.parseInt(mr.getParameter("colorId")));
                        }
                        if (mr.getParameter("productCode") != null && !mr.getParameter("productCode").equals("")) {
                            pdm.setProductCode(mr.getParameter("productCode"));
                        }
                        if (mr.getParameter("productDetailId") != null && !mr.getParameter("productDetailId").equals("")) {
                            pdm.setProductDetailId(Integer.parseInt(mr.getParameter("productDetailId")));
                        }
                        pdm.setCompanyId(Company_Id);

                        if (mr.getParameter("price1") != null && !mr.getParameter("price1").equals("")) {
                            pdm.setProductPrice1(BigDecimal.valueOf(Double.parseDouble(mr.getParameter("price1"))));
                        }
                        if (mr.getParameter("price2") != null && !mr.getParameter("price2").equals("")) {
                            pdm.setProductPrice2(BigDecimal.valueOf(Double.parseDouble(mr.getParameter("price2"))));
                        }
                        if (mr.getParameter("price3") != null && !mr.getParameter("price3").equals("")) {
                            pdm.setProductPrice3(BigDecimal.valueOf(Double.parseDouble(mr.getParameter("price3"))));
                        }
                        if (mr.getParameter("nameTh") != null && !mr.getParameter("nameTh").equals("")) {
                            pdm.setProductDNameT(mr.getParameter("nameTh"));
                        }
                        if (mr.getParameter("nameEn") != null && !mr.getParameter("nameEn").equals("")) {
                            pdm.setProductDNameE(mr.getParameter("nameEn"));
                        }
                        if (mr.getParameter("spect1Th") != null && !mr.getParameter("spect1Th").equals("")) {
                            pdm.setProductSpect1_T(mr.getParameter("spect1Th"));
                        }
                        if (mr.getParameter("spect1En") != null && !mr.getParameter("spect1En").equals("")) {
                            pdm.setProductSpect1_E(mr.getParameter("spect1En"));
                        }
                        if (mr.getParameter("spect2Th") != null && !mr.getParameter("spect2Th").equals("")) {
                            pdm.setProductSpect2_T(mr.getParameter("spect2Th"));
                        }
                        if (mr.getParameter("spect2En") != null && !mr.getParameter("spect2En").equals("")) {
                            pdm.setProductSpect2_E(mr.getParameter("spect2En"));
                        }
                        if (mr.getParameter("spect3Th") != null && !mr.getParameter("spect3Th").equals("")) {
                            pdm.setProductSpect3_T(mr.getParameter("spect3Th"));
                        }
                        if (mr.getParameter("spect3En") != null && !mr.getParameter("spect3En").equals("")) {
                            pdm.setProductSpect3_E(mr.getParameter("spect3En"));
                        }
                        if (mr.getParameter("spect4Th") != null && !mr.getParameter("spect4Th").equals("")) {
                            pdm.setProductSpect4_T(mr.getParameter("spect4Th"));
                        }
                        if (mr.getParameter("spect4En") != null && !mr.getParameter("spect4En").equals("")) {
                            pdm.setProductSpect4_E(mr.getParameter("spect4En"));
                        }
                        if (mr.getParameter("spect5Th") != null && !mr.getParameter("spect5Th").equals("")) {
                            pdm.setProductSpect5_T(mr.getParameter("spect5Th"));
                        }
                        if (mr.getParameter("spect5En") != null && !mr.getParameter("spect5En").equals("")) {
                            pdm.setProductSpect5_E(mr.getParameter("spect5En"));
                        }
                        if (mr.getParameter("spect6Th") != null && !mr.getParameter("spect6Th").equals("")) {
                            pdm.setProductSpect6_T(mr.getParameter("spect6Th"));
                        }
                        if (mr.getParameter("spect6En") != null && !mr.getParameter("spect6En").equals("")) {
                            pdm.setProductSpect6_E(mr.getParameter("spect6En"));
                        }
                        if (mr.getParameter("remarkTh") != null && !mr.getParameter("remarkTh").equals("")) {
                            pdm.setProductDRemarkT(mr.getParameter("remarkTh"));
                        }
                        if (mr.getParameter("remarkEn") != null && !mr.getParameter("remarkEn").equals("")) {
                            pdm.setProductDRemarkE(mr.getParameter("remarkEn"));
                        }
                        if (mr.getParameter("action").equals("Add")) {
                            pdm.setCreateDate(Timestamp.valueOf(db.getNow()));
                            pdmt.add(pdm);
                        }
                        if (mr.getParameter("action").equals("Edit")) {
                            pdm.setUpdateDate(Timestamp.valueOf(db.getNow()));
                            pdmt.update(pdm);
                        }
                        if (mr.getParameter("action").equals("Del")) {
                            pdmt.remove(pdm);
                        }
                        db.close();
                        response.sendRedirect("ProductDetail.jsp");
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
