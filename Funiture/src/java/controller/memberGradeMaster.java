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
import javax.servlet.http.HttpSession;
import model.Database;
import model.companyMasterTable;
import model.entity.memberGradeMasterEntity;
import model.entity.userSecurityEntity;
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
                HttpSession s = request.getSession(true);
                userSecurityEntity lc = (userSecurityEntity) s.getAttribute("loginDetail");

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
                    mgm.setGradeNameE(request.getParameter("gradeNameE"));
                    
                }
                if (request.getParameter("discountRate") != null) {
                    mgm.setDiscountRate(BigDecimal.valueOf(Double.parseDouble(request.getParameter("discountRate"))));
                    
                }
                if (request.getParameter("paymentTerm") != null) {
                    mgm.setPaymentTerm(Integer.parseInt(request.getParameter("paymentTerm")));
                     
                }
                if (request.getParameter("memberPriceFlag") != null) {
                    mgm.setMemberPriceFlag(request.getParameter("memberPriceFlag"));
                }
                mgm.setCreateDate(Timestamp.valueOf(db.getNow()));
                mgm.setUpdateDate(Timestamp.valueOf(db.getNow()));
                mgm.setUserId(lc.getUserId());
//                if (request.getParameter("action").equals("Add")) {
//                    Boolean checkDuplicate = mgt.checkDuplicate(mgm);
//                    if(checkDuplicate==false){
//                        mgt.add(mgm);
//                    }
//                } else if (request.getParameter("action").equals("Edit")) {
//                    mgt.update(mgm);
//                } else if (request.getParameter("action").equals("Del")) {
//                    Boolean checkChild = mgt.checkChild(mgm);
//                    if(checkChild == false){
//                         mgt.remove(mgm);
//                    }
//                }

                 if (request.getParameter("action").equals("Add")) {
                            Boolean checkDuplicate = mgt.checkDuplicate(mgm);
                            if (checkDuplicate == false) {
                                mgt.add(mgm);

                            } else {
                                db.close();
                                response.sendRedirect("addMemberGrade.jsp?error=1");
                            }

                        }
          
                        if (request.getParameter("action").equals("Edit")) {
                            mgt.update(mgm);


                        }
                        if (request.getParameter("action").equals("Del")) {
                            mgm.setMemberGradeId(Integer.parseInt(request.getParameter("memberGradeId")));
                            out.print(mgm.getMemberGrade());
                            mgt.remove(mgm);
                        }
              out.println("getGradeNameT" + mgm.getGradeNameT());
              out.println("getMemberGrade" + mgm.getMemberGrade());
              out.println("getCompanyId" +mgm.getCompanyId());
              out.println("getMemberGrade" + mgm.getMemberGrade());
              out.println("getGradeNameT" + mgm.getGradeNameT());
              out.println("getGradeNameE" + mgm.getGradeNameE());
              out.println("getDiscountRate" + mgm.getDiscountRate());
              out.println("getMemberPriceFlag" +  mgm.getPaymentTerm());
              out.println("getMemberPriceFlag" +  mgm.getMemberPriceFlag());
              out.println("getUpdateDate" +  mgm.getUpdateDate());
              out.println("getUserId" +  mgm.getUserId());
               out.println("getMemberGradeId" + mgm.getMemberGradeId());
                 // out.println("quantity" + pgm.getQuantity());
                        db.close();
                        if (request.getParameter("action").equals("Edit")) {
                          
                           response.sendRedirect("addMemberGrade.jsp?valid=1&memberGradeId=" + mgm.getMemberGradeId());

                        } else if (request.getParameter("action").equals("Add")) {
                            response.sendRedirect("addMemberGrade.jsp?valid=1");
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
