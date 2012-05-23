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
import model.colorMasterTable;
import model.companyMasterTable;
import model.entity.colorCodeMasterEntity;
import model.entity.companyMasterEntity;
import model.entity.menuGroupMasterEntity;
import model.entity.userSecurityEntity;
import model.menuGroupMasterTable;

/**
 *
 * @author Jik
 */
public class menuGroupMaster extends HttpServlet {

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
            menuGroupMasterEntity mg = new menuGroupMasterEntity();
            menuGroupMasterTable mgt = new menuGroupMasterTable(db);
            companyMasterTable cmt = new companyMasterTable(db);
            HttpSession s = request.getSession(true);
            int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
            userSecurityEntity lc = (userSecurityEntity) s.getAttribute("loginDetail");
            if (request.getParameter("menuGroupId") != null && !request.getParameter("menuGroupId").equals("")) {
                mg.setMenuGroupId(Integer.parseInt(request.getParameter("menuGroupId")));
            }
            if (request.getParameter("menuGNameT") != null) {
                mg.setMenuGNameT(request.getParameter("menuGNameT"));
            }
            if (request.getParameter("menuGNameE") != null) {
                mg.setMenuGNameE(request.getParameter("menuGNameE"));
            }
            if (request.getParameter("menuPermission") != null) {
                mg.setMenuPermission(request.getParameter("menuPermission"));
            }
            if (request.getParameter("showListMenu") != null) {
                mg.setShowListMenu(request.getParameter("showListMenu"));
            }
            if (request.getParameter("chkLoginSts") != null) {
                mg.setChkLoginSts(request.getParameter("chkLoginSts"));
            }
            if (request.getParameter("menuGRemarkT") != null) {
                mg.setMenuGRemarkT(request.getParameter("menuGRemarkT"));
            }
            if (request.getParameter("menuGRemarkE") != null) {
                mg.setMenuGRemarkE(request.getParameter("menuGRemarkE"));
            }
            if (request.getParameter("menuGIconLoc") != null) {
                mg.setMenuGIconLoc(request.getParameter("menuGIconLoc"));
            }
           
            mg.setCreateDate(Timestamp.valueOf(db.getNow()));
            mg.setUpdateDate(Timestamp.valueOf(db.getNow()));
            mg.setCompanyId(Company_Id);
            mg.setUserId(lc.getUserId());
                if (request.getParameter("action").equals("Add")) {
                Boolean chechDuplicate = mgt.checkChild(mg);
                if (chechDuplicate == false) {
                    mgt.add(mg);
                    out.println("getMenuGroupId" +mg.getMenuGroupId());
                    }else {
                    db.close();
                     response.sendRedirect("addMenuGroup.jsp?error=1");
                    }
            } else if (request.getParameter("action").equals("Edit")) {
               mgt.update(mg);
               out.print("hhhh....");
//            out.println("getcompanyId...." +mg.getCompanyId());
//            out.println("getMenuGroupId...." +mg.getMenuGroupId());
//            out.println("getMenuGNameT...." +mg.getMenuGNameT());
//            out.println("getMenuGNameE...." +mg.getMenuGNameE());
//            out.println("getMenuPermission..." +mg.getMenuPermission());
//            out.println("getShowListMenu..." +mg.getShowListMenu());
//            out.println("getChkLoginSts...." +mg.getChkLoginSts());
//            out.println("getMenuGIconLoc...." +mg.getMenuGIconLoc());
//            out.println("getmenuGRemarkT...." +mg.getMenuGRemarkT());
//            out.println("getmenuGRemarkE...." +mg.getMenuGRemarkE());
//            out.println("getCreateDate..." +mg.getCreateDate());
//            out.println("getUpdateDate.." +mg.getUpdateDate());
//            out.println("getUserId.." +mg.getUserId());
            } else if (request.getParameter("action").equals("Del")) {
                Boolean checkChild = mgt.checkChild(mg);
                if (checkChild == false) {
               mgt.remove(mg);
                }
            }
            db.close();
             if (request.getParameter("action").equals("Edit")) {
                  out.print("hhhh000");
             response.sendRedirect("addMenuGroup.jsp?valid=1&menuGroupId=" +mg.getMenuGroupId()+mg.getMenuGNameT()+mg.getMenuGNameE()
                    +mg.getMenuPermission()+mg.getShowListMenu() +mg.getChkLoginSts()+mg.getMenuGRemarkT()+mg.getMenuGRemarkE()
                    +mg.getMenuGIconLoc()+mg.getCreateDate()+mg.getUpdateDate()+mg.getUserId()+mg.getCompanyId());

            } else if (request.getParameter("action").equals("Add")) {
              response.sendRedirect("addMenuGroup.jsp?valid=1");
            }
            //db.close();
           
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
