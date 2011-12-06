/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Database;
import model.entity.menuProductSetup;
import model.menuProductSetupTable;

/**
 *
 * @author Achilles
 */
public class productSetup extends HttpServlet {

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
            if (request.getParameter("action") != null) {
                Database db = new Database();
                menuProductSetupTable mpst = new menuProductSetupTable(db);
                menuProductSetup mps = new menuProductSetup();
                if (request.getParameter("menuCode") != null) {
                    mps.setMenuCode(request.getParameter("menuCode"));
                }
                if (request.getParameter("productCode") != null) {
                    mps.setProductCode(request.getParameter("productCode"));
                }
                if (request.getParameter("productRemarkT") != null) {
                    mps.setProductRemarkT(request.getParameter("productRemarkT"));
                }
                if (request.getParameter("productRemarkE") != null) {
                    mps.setProductRemarkE(request.getParameter("productRemarkE"));
                }
                if (request.getParameter("createDate") == null || request.getParameter("createDate").equals("")) {
                    mps.setCreateDate(Timestamp.valueOf(db.getNow()));
                } else {
                    mps.setCreateDate(Timestamp.valueOf(request.getParameter("createDate")));
                }
                if (request.getParameter("updateDate") == null || request.getParameter("updateDate").equals("")) {
                    mps.setCreateDate(Timestamp.valueOf(db.getNow()));
                } else {
                    mps.setUpdateDate(Timestamp.valueOf(request.getParameter("updateDate")));
                }
                if (request.getParameter("action").equals("Add")) {
                    mpst.add(mps);
                } else if (request.getParameter("action").equals("Edit")) {
                    mpst.update(mps);
                } else if (request.getParameter("action").equals("Del")) {
                    mpst.remove(mps);
                }
                db.close();
            }
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
