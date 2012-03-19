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


                int rows = 20, page = 1;
                if (request.getParameter("rows") != null && !request.getParameter("rows").equals("")) {
                    String r = request.getParameter("rows");
                    rows = Integer.parseInt(r);
                }
                if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
                    String r = request.getParameter("page");
                    page = Integer.parseInt(r);
                }
                int start = rows * page - rows;

                String productGroupId = null, Edit = null, Del = null;
                String sField = null, sValue = null, sOper = null;


                if (request.getParameter("productGroupId") != null) {
                    productGroupId = request.getParameter("productGroupId");
                }
                if (request.getParameter("Edit") != null) {
                    Edit = request.getParameter("Edit");
                }
                if (request.getParameter("Del") != null) {
                    Del = request.getParameter("Del");
                }
                if (request.getParameter("searchField") != null) {
                    sField = request.getParameter("searchField");
                }
                if (request.getParameter("searchString") != null) {
                    sValue = request.getParameter("searchString");
                }
                if (request.getParameter("searchOper") != null) {
                    sOper = request.getParameter("searchOper");
                }



                Database db = new Database();
                productGroupMasterTable pgmt = new productGroupMasterTable(db);
                productDetailMasterTable pdm = new productDetailMasterTable(db);
                companyMasterTable cmt = new companyMasterTable(db);
                int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
                ArrayList listp = pdm.search(productGroupId, Company_Id,start,rows);
                ArrayList list = pgmt.search(sField, sValue, sOper, Company_Id, start, rows);
                ArrayList listpd = pdm.searchAll2();
                

                
                if (request.getParameter("q").equals("1")) {
                    int totalPages = 0;
                    int totalCount = pgmt.countAll(Company_Id);
                    db.close();
                    if(totalCount%rows==0) totalPages = totalCount/rows;
                    else totalPages = (totalCount/rows)+1;
                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(totalPages);
                    xml.setPage(page);
                    xml.setRecords(totalCount);
                    for (int i = 0; i < list.size(); i++) {
                        productGroupMasterEntity data = (productGroupMasterEntity) list.get(i);
                        xml.setRowDetail(data.getProductGroupId(), data.getProductGroupCode(), data.getProductGNameT(),
                                data.getProductGNameE(), data.getProductRemarkT(), data.getProductRemarkE(),
                                data.getProductGroupId(), data.getProductGDisplayFlag());
                    }
                    out.print(xml.getXml());
                } else if (request.getParameter("q").equals("2")) {
                    int totalPages = 0;
                    int totalCount = pdm.countAll(Company_Id);
                    db.close();
                    if(totalCount%rows==0) totalPages = totalCount/rows;
                    else totalPages = (totalCount/rows)+1;
                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(totalPages);
                    xml.setPage(page);
                    xml.setRecords(totalCount);
                    for (int i = 0; i < listp.size(); i++) {
                        productDetailMasterEntity data = (productDetailMasterEntity) listp.get(i);
                        xml.setRowDetail(data.getProductDetailId(), data.getProductDetailId(), data.getProductDNameT(),
                                data.getProductDNameE(), data.getProductPrice1(), data.getProductDetailId(),
                                data.getProductDetailId());
                    }
                    out.print(xml.getXml());
                } else if (request.getParameter("q").equals("3")) {
                    int totalPages = 0;
                    int totalCount = pdm.countAll(Company_Id);
                    db.close();
                    if(totalCount%rows==0) totalPages = totalCount/rows;
                    else totalPages = (totalCount/rows)+1;
                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(totalPages);
                    xml.setPage(page);
                    xml.setRecords(totalCount);
                    for (int i = 0; i < listp.size(); i++) {
                        productDetailMasterEntity data = (productDetailMasterEntity) listp.get(i);
                        xml.setRowDetail(data.getProductDetailId(), i + 1, data.getProductCode(),
                                data.getProductDNameT(), data.getProductDNameE(), data.getProductDPicLoc());
                    }
                    out.print(xml.getXml());
                }
                 else if (request.getParameter("q").equals("4")) {
                    int totalPages = 0;
                    int totalCount = pdm.countAll(Company_Id);
                    db.close();
                    if(totalCount%rows==0) totalPages = totalCount/rows;
                    else totalPages = (totalCount/rows)+1;
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
