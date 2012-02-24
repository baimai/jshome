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


import model.entity.companyMasterEntity;
import model.entity.menuGroupMasterEntity;
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
            int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
            if (request.getParameter("menuGroupId") != null && !request.getParameter("menuGroupId").equals("")) {
                mg.setMenuGroupId(Integer.parseInt(request.getParameter("menuGroupId")));
            }
            if (request.getParameter("menuGNameT") != null) {
                mg.setMenuGNameT(request.getParameter("menuGNameT"));
            }
            if (request.getParameter("menuGNameE") != null) {
                mg.setMenuGNameE(request.getParameter("menuGNameE"));
            }
            if (request.getParameter("showListMenu") != null) {
                mg.setShowListMenu(request.getParameter("showListMenu"));
            }
            if (request.getParameter("chkLoginSts") != null) {
                mg.setChkLoginSts(request.getParameter("chkLoginSts"));
            }
            if (request.getParameter("menuPermission") != null) {
                mg.setMenuPermission(request.getParameter("menuPermission"));
            }
            if (request.getParameter("menuGRemarkT") != null) {
                mg.setMenuGRemarkT(request.getParameter("menuGRemarkT"));
            }
            if (request.getParameter("menuGRemarkE") != null) {
                mg.setMenuGRemarkE(request.getParameter("menuGRemarkE"));
            }
            if (request.getParameter("menuGIconLog") != null) {
                mg.setMenuGPicLoc(request.getParameter("menuGIconLog"));
            }
            mg.setCreateDate(Timestamp.valueOf(db.getNow()));
            mg.setUpdateDate(Timestamp.valueOf(db.getNow()));
            mg.setCompanyId(Company_Id);
            if (request.getParameter("action").equals("Add")) {
                mgt.add(mg);
            } else if (request.getParameter("action").equals("Edit")) {
                mgt.update(mg);
            } else if (request.getParameter("action").equals("Del")) {
                mgt.remove(mg);
            }


            db.close();

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
