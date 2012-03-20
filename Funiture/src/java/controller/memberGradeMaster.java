/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Database;
import model.companyMasterTable;
import model.entity.memberGradeMasterEntity;
import model.memberGradeMasterTable;

/**
 *
 * @author Jik
 */
public class memberGradeMaster extends HttpServlet {

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
                memberGradeMasterTable mgt = new memberGradeMasterTable(db);
                companyMasterTable cmt = new companyMasterTable(db);
                memberGradeMasterEntity mgm = new memberGradeMasterEntity();
                int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
                mgm.setCompanyId(Company_Id);
                if (request.getParameter("memberGradeId") != null && !request.getParameter("memberGradeId").equals("")) {
                    mgm.setMemberGradeId(Integer.parseInt(request.getParameter("memberGradeId")));
                }
                if (request.getParameter("memberGrade") != null) {
                    mgm.setMemberGrade(request.getParameter("memberGrade"));
                }
                if (request.getParameter("gradeNameT") != null) {
                    mgm.setGradeNameT(request.getParameter("gradeNameT"));
                     
                }
                if (request.getParameter("gradeNameE") != null) {
                    mgm.setGradeNameT(request.getParameter("gradeNameE"));
                    
                }
                if (request.getParameter("discountRate") != null) {
                    mgm.setDiscountRate(BigDecimal.valueOf(Double.parseDouble(request.getParameter("discountRate"))));
                    
                }
                if (request.getParameter("paymentTerm") != null) {
                    mgm.setPaymentTerm(Integer.parseInt(request.getParameter("paymentTerm")));
                     
                }
                if (request.getParameter("memberPriceFlag") != null) {
                    mgm.setGradeNameT(request.getParameter("memberPriceFlag"));
                }
                mgm.setCreateDate(Timestamp.valueOf(db.getNow()));
                mgm.setUpdateDate(Timestamp.valueOf(db.getNow()));
                if (request.getParameter("action").equals("Add")) {
                    mgt.add(mgm);                  
                } else if (request.getParameter("action").equals("Edit")) {
                    mgt.update(mgm);
                } else if (request.getParameter("action").equals("Del")) {
                    mgt.remove(mgm);
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
