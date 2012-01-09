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
import model.entity.memberMasterEntity;
import model.memberMasterTable;
/**
 *
 * @author Jik
 */
public class memberMaster extends HttpServlet {
   
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
                memberMasterTable mbt = new memberMasterTable(db);
                companyMasterTable cmt = new companyMasterTable(db);
                memberMasterEntity mb = new memberMasterEntity();
                if (request.getParameter("companyCode") != null) {
                    int i = cmt.getCompanyId(request.getParameter("companyCode"));
                    if(i!=0){
                        mb.setCompanyId(i);
                    }
                }
                if (request.getParameter("memberLogin") != null&&request.getParameter("action").equals("Edit")) {
                    int i = mbt.getMemberId(request.getParameter("memberLogin"));
                    if(i!=0){
                        mb.setMemberId(i);
                    }
                }
                if (request.getParameter("memberLogin") != null) {
                    mb.setMemberLogin(request.getParameter("memberLogin"));
                }
                if (request.getParameter("memberPassword") != null) {
                    mb.setMemberPassword(request.getParameter("memberPassword"));
                }
                if (request.getParameter("memberName") != null) {
                    mb.setMemberName(request.getParameter("memberName"));
                }
                if (request.getParameter("memberSurName") != null) {
                    mb.setMemberSurName(request.getParameter("memberSurName"));
                }
                if (request.getParameter("memberComName") != null) {
                    mb.setMemberComName(request.getParameter("memberComName"));
                }
                if (request.getParameter("memberNameAbbr") != null) {
                    mb.setMemberNameAbbr(request.getParameter("memberNameAbbr"));
                }
                if (request.getParameter("memberAddr1") != null) {
                    mb.setMemberAddr1(request.getParameter("memberAddr1"));
                }
                if (request.getParameter("memberAddr2") != null) {
                    mb.setMemberAddr2(request.getParameter("memberAddr2"));
                }
                if (request.getParameter("memberDistinct") != null) {
                    mb.setMemberDistinct(request.getParameter("memberDistinct"));
                }
                if (request.getParameter("memberAmphur") != null) {
                    mb.setMemberAmphur(request.getParameter("memberAmphur"));
                }
                if (request.getParameter("memberProvince") != null) {
                    mb.setMemberProvince(request.getParameter("memberProvince"));
                }
                if (request.getParameter("memberPstcode") != null) {
                    mb.setMemberPstcode(request.getParameter("memberPstcode"));
                }
                 if (request.getParameter("memberTel1") != null) {
                    mb.setMemberTel1(request.getParameter("memberTel1"));
                }
                 if (request.getParameter("memberTel2") != null) {
                    mb.setMemberTel2(request.getParameter("memberTel2"));
                }
                 if (request.getParameter("memberFax1") != null) {
                    mb.setMemberFax1(request.getParameter("memberFax1"));
                }
                 if (request.getParameter("memberFax2") != null) {
                    mb.setMemberFax2(request.getParameter("memberFax2"));
                }
                if (request.getParameter("memberEmail1") != null) {
                    mb.setMemberEmail1(request.getParameter("memberEmail1"));
                }
                 if (request.getParameter("memberEmail2") != null) {
                    mb.setMemberEmail2(request.getParameter("memberEmail2"));
                }
               
                 if (request.getParameter("memberGrade") != null) {
                    mb.setMemberGrade(request.getParameter("memberGrade"));
                }
                 if (request.getParameter("memberlogoloc") != null) {
                    mb.setMemberlogoloc(request.getParameter("memberlogoloc"));
                }
                 
                 if (request.getParameter("memberStatus") != null) {
                    mb.setMemberStatus(request.getParameter("memberStatus"));
                }
                if (request.getParameter("memberMobile1") != null) {
                    mb.setMemberMobile1(request.getParameter("memberMobile1"));
                }
                if (request.getParameter("memberMobile2") != null) {
                    mb.setMemberMobile2(request.getParameter("memberMobile2"));
                }
                    mb.setCreateDate(Timestamp.valueOf(db.getNow()));
                    mb.setUpdateDate(Timestamp.valueOf(db.getNow()));
               

                if (request.getParameter("action").equals("Submit")) {
                    mbt.add(mb);

                } else if (request.getParameter("action").equals("Edit")) {
                   // mbt.update(mb);
                } else if (request.getParameter("action").equals("Del")) {
                    //mbt.remove(mb);
                }
                   
                db.close();
            }
        }catch(Exception ex){
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
