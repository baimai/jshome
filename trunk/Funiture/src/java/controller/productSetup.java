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
import javax.servlet.http.HttpSession;
import model.Database;
import model.companyMasterTable;
import model.entity.picProductSetupEntity;
import model.entity.productDetailMasterEntity;
import model.entity.userSecurityEntity;
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
        request.setCharacterEncoding("utf-8");
        try {
            if (request.getParameter("action") != null) {
                Database db = new Database();
                picProductSetupTable mpst = new picProductSetupTable(db);
                picProductSetupEntity ps = new picProductSetupEntity();
                productDetailMasterTable pdmt = new productDetailMasterTable(db);
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                HttpSession s = request.getSession(true);
                userSecurityEntity lc = (userSecurityEntity) s.getAttribute("loginDetail");
                int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");

               // if (request.getParameter("picCode") != null) {
              //    ps.setPicCode(request.getParameter("picCode"));
              //  }
                if (request.getParameter("picId") != null && !request.getParameter("picId").equals("")) {
                    ps.setPicId(Integer.parseInt(request.getParameter("picId")));
                }
                ps.setCompanyId(Company_Id);
                /*  if (request.getParameter("productCode") != null) {
                pdm.setProductCode(request.getParameter("productCode"));
                pdm.setCompanyId(Company_Id);
                int i = pdmt.getProductId(pdm);
                if (i != 0) {
                ps.setProductDetailId(i);
                }
                }*/

                if (request.getParameter("picNameT") != null) {
                    ps.setPicNameT(request.getParameter("picNameT"));
                    //  out.print("picNameT"+ps.getPicNameT());
                }
                if (request.getParameter("picNameE") != null) {
                    ps.setPicNameE(request.getParameter("picNameE"));
                }
                if (request.getParameter("productRemarkT") != null) {
                    ps.setProductRemarkT(request.getParameter("productRemarkT"));
                }
                if (request.getParameter("productRemarkE") != null) {
                    ps.setProductRemarkE(request.getParameter("productRemarkE"));
                }
                ps.setCreateDate(Timestamp.valueOf(db.getNow()));
                ps.setUpdateDate(Timestamp.valueOf(db.getNow()));
                if (request.getParameter("action").equals("Add")) {
                    Boolean checkDuplicate = mpst.checkDuplicate(ps);
                    if (checkDuplicate == false) {
                        mpst.add(ps);

                    } else {
                        db.close();
                        response.sendRedirect("addProductSetup.jsp?error=1");
                    }

                } else if (request.getParameter("action").equals("Edit")) {
                    mpst.update(ps);
                } else if (request.getParameter("action").equals("Edit2")) {
                    mpst.update(ps);
                    response.sendRedirect("addProductSetup.jsp?picId=" + ps.getPicId());
                } else if (request.getParameter("action").equals("Del")) {
                    mpst.remove(ps);
                }

                db.close();
                if (request.getParameter("action").equals("Edit")) {
                    //   out.println("productGNameT" + ps.getProductGNameT());
                    response.sendRedirect("addProductSetup.jsp?valid=1&picId=" + ps.getPicId());

                } else if (request.getParameter("action").equals("Add")) {
                    response.sendRedirect("addProductSetup.jsp?picId=" + ps.getPicId());
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
