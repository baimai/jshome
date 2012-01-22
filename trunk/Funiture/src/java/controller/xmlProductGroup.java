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

                String status = request.getParameter("status");
                String rows = request.getParameter("rows");
                String page = request.getParameter("page");
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

                int totalPages = 0;
                int totalCount = 2;

                if (totalCount > 0) {
                    if (totalCount % Integer.parseInt(rows) == 0) {
                        totalPages = totalCount / Integer.parseInt(rows);
                    } else {
                        totalPages = (totalCount / Integer.parseInt(rows)) + 1;
                    }

                } else {
                    totalPages = 0;
                }

                Database db = new Database();
                productGroupMasterTable pgmt = new productGroupMasterTable(db);
                productDetailMasterTable pdm = new productDetailMasterTable(db);
                companyMasterTable cmt = new companyMasterTable(db);
                int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
                ArrayList listp = pdm.search(productGroupId, Company_Id);
                ArrayList list = pgmt.search(sField, sValue, sOper, Company_Id);
                db.close();
                if (request.getParameter("q").equals("1")) {
                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(totalPages);
                    xml.setPage(request.getParameter("page"));
                    xml.setRecords(list.size());
                    for (int i = 0; i < list.size(); i++) {
                        productGroupMasterEntity data = (productGroupMasterEntity) list.get(i);
                        xml.setRowDetail(data.getProductGroupId(), i, data.getProductGroupCode(), data.getProductGNameT(),
                                data.getProductGNameE(), data.getProductRemarkT(), data.getProductRemarkE(),
                                data.getProductGroupId(), data.getCompanyCode());
                    }
                    out.print(xml.getXml());
                } else if (request.getParameter("q").equals("2")) {
                    out.print("<?xml version='1.0' encoding='utf-8'?>\n");
                    out.print("<rows>");
                    out.print("<page>" + request.getParameter("page") + "</page>");

                    out.print("<total>" + totalPages + "</total>");
                    out.print("<records>" + listp.size() + "</records>");
                    int srNo = 1;

                    for (int i = 0; i < listp.size(); i++) {
                        productDetailMasterEntity data = (productDetailMasterEntity) listp.get(i);
                        out.print("<row id='" + data.getProductCode() + "'>");
                        // out.print("<cell><img width=\"15\" height=\"15\"  src=\"" + data.getProductDLogo() + "\"/></cell>");
                        out.print("<cell>" + data.getProductCode() + "</cell>");
                        out.print("<cell>" + data.getProductDNameT() + "</cell>");
                        out.print("<cell>" + data.getProductDNameE() + "</cell>");
                        out.print("<cell>" + data.getProductPrice1() + "</cell>");
                        out.print("<cell>" + data.getProductDRemarkT() + "</cell>");
                        out.print("<cell>" + data.getProductDRemarkE() + "</cell>");

                        if (Edit != null) {
                            out.print("<cell>" + data.getProductDetailId() + "</cell>");
                        }
                        if (Del != null) {
                            out.print("<cell>" + data.getProductDetailId() + "</cell>");
                        }

                        out.print("</row>");
                        srNo++;
                    }
                    out.print("</rows>");
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