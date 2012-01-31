/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.error.errorClass;
import controller.loginDetail.loginClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Database;
import model.companyMasterTable;
import model.entity.memberMasterEntity;
import model.memberMasterTable;

/**
 *
 * @author Achilles
 */
public class login extends HttpServlet {

    

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
            HttpSession s = request.getSession();
            memberMasterEntity mm = new memberMasterEntity();
            memberMasterTable mmt = new memberMasterTable(db);
            companyMasterTable cmt = new companyMasterTable(db);
            int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
            loginClass lc = new loginClass();

            if (request.getParameter("memberLogin") != null) {
                mm.setMemberLogin(request.getParameter("memberLogin"));
            }
            if (request.getParameter("memberPassword") != null) {
                mm.setMemberPassword(request.getParameter("memberPassword"));
            }
            ArrayList list = mmt.chkUserPass(mm, Company_Id);
            db.close();
            if (list != null) {
                memberMasterEntity data = (memberMasterEntity) list.get(0);
                lc.setMemberLogin(request.getParameter("memberLogin"));
                lc.setLang(request.getParameter("lang"));
                lc.setMemberFName(data.getMemberName());
                lc.setMemberLName(data.getMemberSurName());
                lc.setMemberComName(data.getMemberComName());
                lc.setMemberComAbbr(data.getMemberNameAbbr());
                lc.setMemberId(data.getMemberId());
                s.setAttribute("loginDetail", lc);
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("invalid", "Invalid Username Or Password");
                request.setAttribute("memberLogin", request.getParameter("memberLogin"));
                RequestDispatcher obj = request.getRequestDispatcher("Login.jsp");
                obj.forward(request, response);                
            }
        } catch (Exception ex) {
            errorClass err = new errorClass();
            err.setErrorCode("LG00");
            err.setHeader("ล็อกอินไอดี หรือ รหัสผ่านผิดผลาด <br/> โปรดตรวจสอบว่า ภาษาถูกต้อง หรือ กดปุ่ม CAPSLOCK ค้างไว้หรือไม่");
            request.setAttribute("error", err);
            RequestDispatcher obj = request.getRequestDispatcher("error.jsp");
            obj.forward(request, response);
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
