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
import model.companyMasterTable;
import model.entity.picProductSetup;
import model.picProductSetupTable;
import model.productDetailMasterTable;

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
                picProductSetupTable mpst = new picProductSetupTable(db);
                productDetailMasterTable pdmt = new productDetailMasterTable(db);
                companyMasterTable cmt = new companyMasterTable(db);
                picProductSetup mps = new picProductSetup();
                if (request.getParameter("picCode") != null) {
                    mps.setPicCode(request.getParameter("picCode"));
                }
                if (request.getParameter("companyCode") != null) {
                    int i = cmt.getCompanyId(request.getParameter("companyCode"));
                    if (i != 0) {
                        mps.setCompanyId(i);
                    }
                }
                if (request.getParameter("productCode") != null) {
                    int i = pdmt.getProductId(request.getParameter("productCode"));
                    if (i != 0) {
                        mps.setProductId(i);
                    }
                }
                if (request.getParameter("picNameT") != null) {
                    mps.setPicNameT(request.getParameter("picNameT"));
                }
                if (request.getParameter("picNameE") != null) {
                    mps.setPicNameE(request.getParameter("picNameE"));
                }
                if (request.getParameter("productRemarkT") != null) {
                    mps.setProductRemarkT(request.getParameter("productRemarkT"));
                }
                if (request.getParameter("productRemarkE") != null) {
                    mps.setProductRemarkE(request.getParameter("productRemarkE"));
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
