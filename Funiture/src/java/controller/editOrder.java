/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.loginDetail.loginClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Database;
import model.entity.orderDetailMasterEntity;
import model.entity.orderHeaderMasterEntity;
import model.orderDetailMasterTable;
import model.orderHeaderMasterTable;

/**
 *
 * @author Achilles
 */
public class editOrder extends HttpServlet {

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
            Database db = new Database();
            orderDetailMasterTable odmt = new orderDetailMasterTable(db);
            orderDetailMasterEntity odm = new orderDetailMasterEntity();
            orderHeaderMasterTable ohmt = new orderHeaderMasterTable(db);
            orderHeaderMasterEntity ohm = new orderHeaderMasterEntity();
            ohm.setOrderId(Integer.parseInt(request.getParameter("orderId")));
            ohm.setUpdateDate(Timestamp.valueOf(db.getNow()));
            ohm.setMemberId(Integer.parseInt(request.getParameter("memberId")));
            odm.setOrderDetailId(Integer.parseInt(request.getParameter("orderDetailId")));
            if (request.getParameter("productVolumn") != null && !request.getParameter("productVolumn").equals("")) {
                odm.setProductVolumn(Integer.parseInt(request.getParameter("productVolumn")));
            }
            if (request.getParameter("action").equals("Del")) {
                odmt.remove(odm);
            } else if (request.getParameter("action").equals("Edit")) {
                odmt.update(odm);
                ohmt.updateDiscount(ohm);
            }
            db.close();
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
