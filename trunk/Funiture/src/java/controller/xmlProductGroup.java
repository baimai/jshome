/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.Xml.GenerateXml;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Database;
import model.companyMasterTable;
import model.entity.productDetailMasterEntity;
import model.entity.productGroupMasterEntity;
import model.productDetailMasterTable;
import model.productGroupMasterTable;

/**
 *
 * @author Achilles
 */
public class xmlProductGroup extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        try {
            if (request.getParameter("action").equals("fetchData")) {
               response.setContentType("text/xml;charset=UTF-8");                
                String productGroupId = request.getParameter("productGroupId") != null ? request.getParameter("productGroupId") : null;
                int rows = request.getParameter("rows") != null && !request.getParameter("rows").equals("") ? Integer.parseInt(request.getParameter("rows")) : 20;
                int page = request.getParameter("page") != null && !request.getParameter("page").equals("") ? Integer.parseInt(request.getParameter("page")) : 1;
                int start = rows * page - rows;
                String sField = request.getParameter("searchField") != null ? request.getParameter("searchField") : null;
                String sValue = request.getParameter("searchString") != null ? request.getParameter("searchString") : null;
                String sOper = request.getParameter("searchOper") != null ? request.getParameter("searchOper") : null;
                Database db = new Database();
                productGroupMasterTable pgmt = new productGroupMasterTable(db);
                productDetailMasterTable pdm = new productDetailMasterTable(db);
                int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");

                if (request.getParameter("q").equals("1")) {
                    ArrayList list = pgmt.searchAll();
                    int totalPages = 0;
                    int totalCount = pdm.countAll(Company_Id);
                    db.close();
                    if (totalCount % rows == 0) {
                        totalPages = totalCount / rows;
                    } else {
                        totalPages = (totalCount / rows) + 1;
                    }
                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(totalPages);
                    xml.setPage(page);
                    xml.setRecords(totalCount);
                    for (int i = 0; i < list.size(); i++) {
                        productGroupMasterEntity data = (productGroupMasterEntity) list.get(i);
                         String displayFlag = null;
                        if (data.getProductGDisplayFlag() == null || data.getProductGDisplayFlag().equals("Y") || data.getProductGDisplayFlag().equals("")) {
                            displayFlag = "แสดงกลุ่มสินค้า";
                        } else if (data.getProductGDisplayFlag().equals("N")) {
                            displayFlag = "ไม่แสดงกลุ่มสินค้า";
                        } else if (data.getProductGDisplayFlag().equals("A")) {
                            displayFlag = "สินค้าโฆษณา";
                        }
                        xml.setRowDetail(
                                data.getProductGroupId(),                              
                                data.getProductGroupCode(),
                                data.getProductGNameT(),
                                data.getProductGNameE(),                              
                                displayFlag,
                                data.getProductIconLoc(),
                                data.getProductRemarkT(),
                                data.getProductRemarkE(),
                                data.getCreateDate(),
                                data.getUpdateDate(),
                                data.getUserId(),
                                data.getProductGroupId(),
                                data.getProductGroupId(),
                                data.getProductGroupId()

                               );

                    }
                    out.print(xml.getXml());

                } else if (request.getParameter("q").equals("2")) {
                    ArrayList listp = pdm.search(productGroupId, Company_Id, start, rows);
                    int totalCount = pdm.countAll(Company_Id);
                    int totalPages = totalCount % rows == 0 ? (totalCount / rows) : (totalCount / rows) + 1;
                    db.close();

                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(totalPages);
                    xml.setPage(page);
                    xml.setRecords(totalCount);
                    for (int i = 0; i < listp.size(); i++) {
                        productDetailMasterEntity data = (productDetailMasterEntity) listp.get(i);

                        xml.setRowDetail(data.getProductDetailId(), 
                                data.getProductModelCode(),
                                data.getProductCode(),
                                data.getProductDNameT(),
                                data.getProductDNameE(),
                                data.getProductDDisplayFlag(),
                                data.getCreateDate(),
                                data.getUpdateDate(),
                                data.getUserId(),
                                data.getProductDetailId(),
                                data.getProductDetailId());
                    }
                    out.print(xml.getXml());

                } else if (request.getParameter("q").equals("3")) {
                    ArrayList listp = pdm.search(productGroupId, Company_Id, start, rows);
                    int totalCount = pdm.countAll(Company_Id);
                    int totalPages = totalCount % rows == 0 ? (totalCount / rows) : (totalCount / rows) + 1;
                    db.close();

                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(totalPages);
                    xml.setPage(page);
                    xml.setRecords(totalCount);
                    for (int i = 0; i < listp.size(); i++) {
                        productDetailMasterEntity data = (productDetailMasterEntity) listp.get(i);
                        xml.setRowDetail(data.getProductDetailId(), i + 1,
                                data.getProductCode(),
                                data.getProductDNameT(), 
                                data.getProductDNameE(), 
                                data.getProductDPicLoc());
                    }
                    out.print(xml.getXml());

                } else if (request.getParameter("q").equals("4")) {
                    ArrayList listpd = pdm.searchAll2();
                    int totalCount = pdm.countAll(Company_Id);
                    int totalPages = totalCount % rows == 0 ? (totalCount / rows) : (totalCount / rows) + 1;
                    db.close();

                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(totalPages);
                    xml.setPage(page);
                    xml.setRecords(totalCount);
                    for (int i = 0; i < listpd.size(); i++) {
                        productDetailMasterEntity data = (productDetailMasterEntity) listpd.get(i);
                        xml.setRowDetail(data.getProductDetailId(),
                                data.getProductCode(),
                                data.getProductDNameT(),
                                data.getProductGroupMasterEntity().getProductGNameT(),
                                data.getProductSpect1_T(),
                                data.getProductSpect2_T(),
                                data.getProductSpect3_T(),
                                data.getProductSpect4_T(),
                                data.getProductSpect5_T(),
                                data.getProductSpect6_T(),
                                data.getProductDetailId());
                    }
                    out.print(xml.getXml());
                }
            }
        } catch (Exception ex) {
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
