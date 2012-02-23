/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.error.errorClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
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
                int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
                memberMasterEntity mb = new memberMasterEntity();
                mb.setCompanyId(Company_Id);
//                if (request.getParameter("memberLogin") != null && request.getParameter("action").equals("Edit")) {
//                    int i = mbt.getMemberId(request.getParameter("memberLogin"), Company_Id);
//                    if (i != 0) {
//                        mb.setMemberId(i);
//                    }
//                }
                if (request.getParameter("memberId") != null) {
                    mb.setMemberId(Integer.parseInt(request.getParameter("memberId")));
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

                if (request.getParameter("status") != null) {
                    mb.setMemberStatus(request.getParameter("status"));
                }
                if (request.getParameter("memberMobile1") != null) {
                    mb.setMemberMobile1(request.getParameter("memberMobile1"));
                }
                if (request.getParameter("memberMobile2") != null) {
                    mb.setMemberMobile2(request.getParameter("memberMobile2"));
                }
                mb.setCreateDate(Timestamp.valueOf(db.getNow()));
                mb.setUpdateDate(Timestamp.valueOf(db.getNow()));
                mb.setMemberRegDate(Timestamp.valueOf(db.getNow()));
                mb.setMemberAppdate(Timestamp.valueOf(db.getNow()));
                if (request.getParameter("action").equals("Submit")) {
                    mbt.add(mb);

                } else if (request.getParameter("action").equals("Edit")) {
                    mbt.adminUpdate(mb);
                } else if (request.getParameter("action").equals("Del")) {
                    //mbt.remove(mb);
                } 

                db.close();
                if (request.getParameter("action").equals("Submit")) {
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title></title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<script type=\"text/javascript\">");
                    out.println("var wait_time=8;");
                    out.println("window.onload=function(){");
                    out.println("var vela=setInterval(\"decrease_num()\",1000);");
                    out.println("setTimeout(\"clearInterval(\"+vela+\")\",(wait_time+1)*1000);");
                    out.println("}");
                    out.println("function decrease_num(){");
                    out.println("if(wait_time>0){");
                    out.println("var show_place=document.getElementById('show_text');");
                    out.println("show_place.innerHTML=\"wait... \"+wait_time+\"  sec\";");
                    out.println("wait_time--;");
                    out.println("if(wait_time==0){location.href='../Login.jsp'}");
                    out.println(" }else{");
                    out.println("if(wait_time==0){");
                    out.println("alert(\"Go!!\");");
                    out.println("}");
                    out.println("}");
                    out.println("}");
                    out.println(" </script>");
                    out.println("<center><br/><br/><br/><h1> <div style=\"color:blue\">Thank You For Register</div> </h1><br/><br/><br/>");
                    out.println("<h3><span id=\"show_text\"></span></h3></center>");


                    out.println("");
                    out.println("");
                    out.println("</body>");
                    out.println("</html>");
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
