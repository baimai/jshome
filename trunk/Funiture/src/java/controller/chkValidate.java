/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Database;
import model.companyMasterTable;
import model.entity.memberMasterEntity;
import model.memberMasterTable;

/**
 *
 * @author Achilles
 */
public class chkValidate extends HttpServlet {

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
            Database db = new Database();
            memberMasterTable mmt = new memberMasterTable(db);
            memberMasterEntity mm = new memberMasterEntity();
            companyMasterTable cmt = new companyMasterTable(db);
            int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
            if (request.getParameter("memberLogin") != null) {
                if (request.getParameter("memberLogin").equals("")) {
                    out.print("กรุณากรอกข้อมูลล็อกอิน");
                } else {
                    mm.setMemberLogin(request.getParameter("memberLogin"));
                    mm.setCompanyId(Company_Id);
                    Boolean chk = mmt.chkMemberLogin(mm);
                    if (request.getParameter("memberLogin").length() <= 6) {
                        out.print("จำนวนตัวอักษรต้องมากกว่า6");
                    } else {
                        if (chk == true) {
                            out.print("มีข้อมูลล็อกอินอยู่ในระบบนี้แล้ว");
                        } else {
                            out.print("ข้อมูลล็อกอินนี้สามารถใช้ได้");
                        }
                    }

                }
            }
            db.close();
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
