/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Database;
import model.companyMasterTable;
import model.entity.productDetailMaster;
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //productCode=&companyCode=&price1=500.00&price2=400.00&price3=300.00&picLoc=&iconLoc=&nameTh=กกกก&nameEn=ssss&spec1Th=1&spec1En=a&spec2Th=2&spec2En=b&spec3Th=3&spec3En=c&spec4Th=4&spec4En=d&spec5Th=5&spec5En=e&spec6Th=6&spec6En=f&remarkTh=gg&remarkEn=fff
            if (request.getParameter("action") != null && !request.getParameter("action").equals("")) {
                Database db = new Database();
                productDetailMasterTable pdmt = new productDetailMasterTable(db);
                companyMasterTable cmt = new companyMasterTable(db);
                productDetailMaster pdm = new productDetailMaster();
                //
                if (request.getParameter("productGroupId") != null&&!request.getParameter("productGroupId").equals("")) {
                    pdm.setProductGroupId(Integer.parseInt(request.getParameter("productGroupId")));
                }
                if (request.getParameter("colorId") != null&&!request.getParameter("colorId").equals("")) {
                    pdm.setProductColorId(Integer.parseInt(request.getParameter("colorId")));
                }
                if (request.getParameter("productCode") != null&&!request.getParameter("productCode").equals("")) {
                    pdm.setProductCode(request.getParameter("productCode"));
                }
                if(!request.getParameter("companyCode").equals("")){
                    pdm.setCompanyId(cmt.getCompanyId(request.getParameter("companyCode")));
                }
                if(!request.getParameter("price1").equals("")){
                    pdm.setProductPrice1(BigDecimal.valueOf(Double.parseDouble(request.getParameter("price1"))));
                }
                if(!request.getParameter("price2").equals("")){
                    pdm.setProductPrice1(BigDecimal.valueOf(Double.parseDouble(request.getParameter("price2"))));
                }
                if(!request.getParameter("price3").equals("")){
                    pdm.setProductPrice1(BigDecimal.valueOf(Double.parseDouble(request.getParameter("price3"))));
                }
                //picLoc & iconLoc ยังไม่ได้ทำ
                if(!request.getParameter("nameTh").equals("")){
                   pdm.setProductDNameT(request.getParameter("nameTh"));
                }
                if(!request.getParameter("nameEn").equals("")){
                   pdm.setProductDNameT(request.getParameter("nameEn"));
                }
                if(!request.getParameter("spect1Th").equals("")){
                    pdm.setProductSpect1_T(request.getParameter("spect1Th"));
                }
                if(!request.getParameter("spect1En").equals("")){
                    pdm.setProductSpect1_E(request.getParameter("spect1En"));
                }
                if(!request.getParameter("spect2Th").equals("")){
                    pdm.setProductSpect2_T(request.getParameter("spect2Th"));
                }
                if(!request.getParameter("spect2En").equals("")){
                    pdm.setProductSpect2_E(request.getParameter("spect2En"));
                }
                if(!request.getParameter("spect3Th").equals("")){
                    pdm.setProductSpect3_T(request.getParameter("spect3Th"));
                }
                if(!request.getParameter("spect3En").equals("")){
                    pdm.setProductSpect3_E(request.getParameter("spect3En"));
                }
                if(!request.getParameter("spect4Th").equals("")){
                    pdm.setProductSpect4_T(request.getParameter("spect4Th"));
                }
                if(!request.getParameter("spect4En").equals("")){
                    pdm.setProductSpect4_E(request.getParameter("spect4En"));
                }
                if(!request.getParameter("spect5Th").equals("")){
                    pdm.setProductSpect5_T(request.getParameter("spect5Th"));
                }
                if(!request.getParameter("spect5En").equals("")){
                    pdm.setProductSpect5_E(request.getParameter("spect5En"));
                }
                if(!request.getParameter("spect6Th").equals("")){
                    pdm.setProductSpect6_T(request.getParameter("spect6Th"));
                }
                if(!request.getParameter("spect6En").equals("")){
                    pdm.setProductSpect6_E(request.getParameter("spect6En"));
                }
                if(!request.getParameter("remarkTh").equals("")){
                    pdm.setProductDRemarkT(request.getParameter("remarkTh"));
                }
                if(!request.getParameter("remarkEn").equals("")){
                    pdm.setProductDRemarkE(request.getParameter("remarkEn"));
                }
                if(request.getParameter("action").equals("Add")){
                    pdm.setCreateDate(Timestamp.valueOf(db.getNow()));
                    pdmt.add(pdm);
                }
                if(request.getParameter("action").equals("Edit")){
                    pdm.setUpdtaeDate(Timestamp.valueOf(db.getNow()));
                    pdmt.update(pdm);
                }
            }
        } catch (Exception ex){
          ex.printStackTrace(out);
        } finally {
            out.close();
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
