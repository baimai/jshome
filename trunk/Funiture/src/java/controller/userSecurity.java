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
import model.entity.userSecurityEntity;
import model.userSecurityTable;

/**
 *
 * @author baimai
 */
public class userSecurity extends HttpServlet {

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

                userSecurityTable ust = new userSecurityTable(db);
                userSecurityEntity uss = new userSecurityEntity();
                HttpSession s = request.getSession(true);
                userSecurityEntity lc = (userSecurityEntity) s.getAttribute("loginDetail");
                int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
                  uss.setCompanyId(Company_Id);
                if (request.getParameter("userId") != null && !request.getParameter("userId").equals("")) {
                    uss.setUserId(request.getParameter("userId"));
                }
                if (request.getParameter("userPassword") != null) {
                    uss.setUserPassword(request.getParameter("userPassword"));
                }
                if (request.getParameter("userNameT") != null) {
                    uss.setUserNameT(request.getParameter("userNameT"));
                }
                if (request.getParameter("userNameE") != null) {
                    uss.setUserNameE(request.getParameter("userNameE"));
                }
                if (request.getParameter("userAuthoritySts") != null) {
                    uss.setUserAuthoritySts(request.getParameter("userAuthoritySts"));
                }
              if (request.getParameter("userAliveSts") != null) {
                    uss.setUserAliveSts(request.getParameter("userAliveSts"));
                }
             uss.setApprovedDate(Timestamp.valueOf(db.getNow()));



             if (request.getParameter("userAliveSts").equals("A")) {
                uss.setApprovedDate(Timestamp.valueOf(db.getNow()));
              } else if (request.getParameter("userAliveSts").equals("I")) {
                 uss.setHoldDate(Timestamp.valueOf(db.getNow()));
               }
              if (request.getParameter("holdDate").equals("A")){
         uss.setHoldDate(Timestamp.valueOf(db.getNow()));
              }else if (request.getParameter("holdDate").equals("I")){
                 uss.setHoldDate(Timestamp.valueOf(db.getNow()));
                 }

                uss.setCompanyId(Company_Id);
              out.println("CompanyId" + uss.getCompanyId());
                uss.setUpdateDate(Timestamp.valueOf(db.getNow()));
                uss.setCreateDate(Timestamp.valueOf(db.getNow()));
                //if (request.getParameter("action").equals("Add")) {
               //     Boolean checkDuplicate = ust.checkDuplicate(uss);
                 //   if (checkDuplicate == false) {
                 //       ust.add(uss);
                 //   }
             //   }

                    if (request.getParameter("action").equals("Add")) {
                            Boolean checkDuplicate = ust.checkDuplicate(uss);
                            if (checkDuplicate == false) {
                                ust.add(uss);

                            } else {
                                db.close();
                                response.sendRedirect("addUserSecurity.jsp?error=1");
                            }

                        }

                        if (request.getParameter("action").equals("Edit")) {
                            ust.update(uss);


                        }
                        if (request.getParameter("action").equals("Del")) {
                            uss.setUserId(request.getParameter("UserId"));
                            out.print(uss.getUserId());
                            ust.remove(uss);
                        }
                out.println(">>>>>>getUserId<<<<<<<" + uss.getUserId());
                out.println("getUserPassword" + uss.getUserPassword());
                out.println("getUserNameT" + uss.getUserNameT());
                out.println("getUserNameE" + uss.getUserNameE());
                out.println("getUserAuthoritySts" + uss.getUserAuthoritySts());
                out.println("getUserAliveSts" + uss.getUserAliveSts());
                out.println("getApprovedDate" + uss.getApprovedDate());
                out.println("getHoldDate" + uss.getHoldDate());
                out.println("getUpdateDate" + uss.getUpdateDate());   
                
                 db.close();
                        if (request.getParameter("action").equals("Edit")) {
                          
                          response.sendRedirect("addUserSecurity.jsp?valid=1&UserId=" + uss.getUserId());

                        } else if (request.getParameter("action").equals("Add")) {
                            response.sendRedirect("addUserSecurity.jsp?valid=1");
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
