/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.error.errorClass;
import controller.loginDetail.loginClass;
import controller.product.product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Database;
import model.entity.orderDetailMasterEntity;
import model.entity.orderHeaderMasterEntity;
import model.entity.stockBalanceEntity;
import model.orderDetailMasterTable;
import model.orderHeaderMasterTable;
import model.stockBalanceTable;

/**
 *
 * @author Achilles
 */
public class addOrder extends HttpServlet {

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
            HttpSession s = request.getSession(true);
            loginClass lc = (loginClass) s.getAttribute("loginDetail");
            Vector v = new Vector();
            Database db = new Database();
            errorClass err = new errorClass();
            orderDetailMasterEntity odm = new orderDetailMasterEntity();
            orderDetailMasterTable odmt = new orderDetailMasterTable(db);
            orderHeaderMasterEntity ohm = new orderHeaderMasterEntity();
            orderHeaderMasterTable ohmt = new orderHeaderMasterTable(db);
            stockBalanceEntity sb = new stockBalanceEntity();
            stockBalanceTable sbt = new stockBalanceTable(db);
            int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
            if (s.getAttribute("productList") != null) {
                ArrayList list = (ArrayList) s.getAttribute("productList");
                double total = 0;
                String[] itemCode = new String[list.size()];
                String[] itemName = new String[list.size()];
                String[] itemDetail = new String[list.size()];
                for (int i = 0; i < list.size(); i++) {
                    product p = (product) list.get(i);
                    total = total + (p.getAmount() * p.getProductPrice());
                    sb.setProductDetailId(p.getProductDetailId());
                    if (sbt.getBalanceProduct(sb) - p.getAmount() < 0) {
                        err.setErrorCode("SB00");
                        err.setHeader("จำนวนสินค้าคงเหลือในขณะนี้ น้อยกว่าจำนวนสินค้าที่ท่านทำรายการสินค้า กรุณาปรับปรุงรายการสินค้า!");
                        itemCode[i] = p.getProductCode();
                        itemName[i] = p.getProductName();
                        itemDetail[i] = "จำนวนสินค้าปัจจุบัน " + sbt.getBalanceProduct(sb) + "   จำนวนที่ท่านเลือก " + p.getAmount();
                    }
                }
                if (err.getErrorCode() != null) {
                    err.setItemCode(itemCode);
                    err.setItemName(itemName);
                    err.setItemDetail(itemDetail);
                    db.close();
                    request.setAttribute("error", err);
                    RequestDispatcher obj = request.getRequestDispatcher("error.jsp");
                    obj.forward(request, response);
                }

                //insert header Order
                ohm.setCompanyId(Company_Id);
                ohm.setMemberId(lc.getMemberId());
                ohm.setOrderDate(Timestamp.valueOf(db.getNow()));
                ohm.setOrderStatus("N");
                ohm.setShippingCost(0);
                ohm.setTotalAmount(total);
                ohm.setCreateDate(Timestamp.valueOf(db.getNow()));
                ohm.setUpdateDate(Timestamp.valueOf(db.getNow()));
                int rowNum = ohmt.add(ohm);
                if (rowNum != 0) {
                    int oid = ohmt.getOrderId(ohm, Company_Id);
                    odm.setCompanyId(Company_Id);
                    odm.setOrderId(oid);
                    for (int i = 0; i < list.size(); i++) {
                        product p = (product) list.get(i);
                        odm.setProductDetailI(p.getProductDetailId());
                        odm.setProductAmount(p.getAmount() * p.getProductPrice());
                        odm.setProductVolumn(p.getAmount());
                        odm.setProductCost(p.getProductPrice());
                        odm.setCreateDate(Timestamp.valueOf(db.getNow()));
                        odm.setUpdateDate(Timestamp.valueOf(db.getNow()));
                        odm.setShippingCost(0);
                        odmt.add(odm);
                    }
                    s.removeAttribute("productList");
                }

            }
            db.close();
            response.sendRedirect("index.jsp");
            

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
