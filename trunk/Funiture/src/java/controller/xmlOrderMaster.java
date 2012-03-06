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
import model.entity.orderDetailMasterEntity;
import model.entity.orderHeaderMasterEntity;
import model.orderDetailMasterTable;
import model.orderHeaderMasterTable;

/**
 *
 * @author Achilles
 */
public class xmlOrderMaster extends HttpServlet {

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
                String orderStatus = null;
                String sField = null, sValue = null, sOper = null;
                int orderId = 0;

                if (request.getParameter("orderStatus") != null) {
                    orderStatus = request.getParameter("orderStatus");
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
                if (request.getParameter("orderId") != null) {
                    orderId = Integer.parseInt(request.getParameter("orderId"));
                }

                int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
                Database db = new Database();
                orderHeaderMasterTable ohmt = new orderHeaderMasterTable(db);
                orderDetailMasterTable odmt = new orderDetailMasterTable(db);
                orderHeaderMasterEntity ohm = new orderHeaderMasterEntity();
                ohm.setCompanyId(Company_Id);
                ohm.setOrderStatus(orderStatus);
                ArrayList listp = odmt.searchId(orderId);
                ArrayList list = ohmt.search(sField, sValue, sOper, ohm,start,rows);
                if (request.getParameter("q").equals("1")) {
                    int totalPages = 0;
                    int totalCount = ohmt.countAll(ohm);
                    db.close();
                    if(totalCount%rows==0) totalPages = totalCount/rows;
                    else totalPages = (totalCount/rows)+1;
                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(totalPages);
                    xml.setPage(page);
                    xml.setRecords(totalCount);
                    for (int i = 0; i < list.size(); i++) {
                        String status = null;
                        orderHeaderMasterEntity data = (orderHeaderMasterEntity) list.get(i);
                        if (data.getOrderStatus().equals("N")) {
                            status = "InActive";
                        } else if (data.getOrderStatus().equals("Y")) {
                            status = "Active";
                        } else if (data.getOrderStatus().equals("C")) {
                            status = "Cancle";
                        } else {
                            status = "InActive";
                        }
                        xml.setRowDetail(data.getOrderId(), data.getOrderDate(),
                                data.getOrderId(),
                                data.getMemberMasterEntity().getMemberName() + " " + data.getMemberMasterEntity().getMemberSurName(),
                                status,
                                data.getOrderId());
                    }
                    out.print(xml.getXml());
                } else if (request.getParameter("q").equals("2")) {
                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(1);
                    xml.setPage(1);
                    xml.setRecords(listp.size());
                    for (int i = 0; i < listp.size(); i++) {
                        orderDetailMasterEntity data = (orderDetailMasterEntity) listp.get(i);
                        xml.setRowDetail(data.getProductDetailId(), data.getProductDetailMasterEntity().getProductCode(),
                                data.getProductDetailMasterEntity().getProductDNameE(),
                                data.getProductVolumn(), data.getProductCost(), data.getDiscountText(),
                                (data.getProductAmount().subtract(data.getDiscountPrice())), data.getOrderDetailId(), data.getOrderId(),
                                data.getMemMasterEntity().getMemberId());
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
