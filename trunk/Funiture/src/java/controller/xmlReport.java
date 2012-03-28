/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.Xml.GenerateXml;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Database;
import model.entity.orderHeaderMasterEntity;
import model.orderHeaderMasterTable;

/**
 *
 * @author Achilles
 */
public class xmlReport extends HttpServlet {

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
        Database db = new Database();
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
                String orderDate1 = null, orderDate2 = null;
                int memberGradeId = 0, productGroupId = 0;
                String sField = null, sValue = null, sOper = null;

                if (request.getParameter("orderDate1") != null) {
                    orderDate1 = request.getParameter("orderDate1");
                }
                if (request.getParameter("orderDate2") != null) {
                    orderDate2 = request.getParameter("orderDate2");
                }
                if (request.getParameter("memberGradeId") != null && !request.getParameter("memberGradeId").equals("")) {
                    memberGradeId = Integer.parseInt(request.getParameter("memberGradeId"));
                }
                if (request.getParameter("productGroupId") != null && !request.getParameter("productGroupId").equals("")) {
                    productGroupId = Integer.parseInt(request.getParameter("productGroupId"));
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
                
                orderHeaderMasterEntity ohme = new orderHeaderMasterEntity();
                orderHeaderMasterTable ohmt = new orderHeaderMasterTable(db);
                ArrayList list = ohmt.searchOrder(sField, sValue, sOper, orderDate1, orderDate2, memberGradeId, productGroupId, start, rows);

                GenerateXml xml = new GenerateXml();
                xml.setTotal(1);
                xml.setPage(1);
                xml.setRecords(list.size());
                int totalId = 0;
                BigDecimal totalamount = BigDecimal.ZERO;
                if (list != null) {
                    for (int i = 0; i < list.size(); i++) {
                        orderHeaderMasterEntity data = (orderHeaderMasterEntity) list.get(i);
                        xml.setRowDetail(i,  data.getOrderDate(),data.getOrderId(), data.getTotalAmount());
                        totalId = totalId + 1;
                        totalamount = totalamount.add(data.getTotalAmount());
                    }
                }
                xml.setUserdata("orderId", "("+totalId+") Orders");
                xml.setUserdata("total", totalamount);
                out.print(xml.getXml());
                db.close();
            }
        } catch (Exception ex) {
            db.close();
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
