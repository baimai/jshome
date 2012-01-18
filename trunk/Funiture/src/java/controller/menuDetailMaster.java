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
import model.entity.menuDetailMasterEntity;
import model.menuDetailMasterTable;
import model.menuGroupMasterTable;

/**
 *
 * @author Jik
 */
public class menuDetailMaster extends HttpServlet {
   
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
        try {
             if (request.getParameter("action") != null) {
                Database db = new Database();
                
                menuDetailMasterTable mdt = new menuDetailMasterTable(db);
                companyMasterTable cmt = new companyMasterTable(db);
                menuDetailMasterEntity md = new menuDetailMasterEntity();

                if (request.getParameter("companyCode") != null) {
                    int i = cmt.getCompanyId(request.getParameter("companyCode"));
                    if (i != 0) {
                        md.setCompanyId(i);
                    }
                }
                if (request.getParameter("menuGroupId") != null) {
                    md.setMenuGroupId(Integer.parseInt(request.getParameter("menuGroupId")));
                }

                if (request.getParameter("menuCNameT") != null) {
                    md.setMenuCNameT(request.getParameter("menuCNameT"));
                }
                if (request.getParameter("menuCNameE") != null) {
                    md.setMenuCNameE(request.getParameter("menuCNameE"));
                }
                if (request.getParameter("menuModel") != null) {
                    md.setMenuModel(request.getParameter("menuModel"));
                }
                if (request.getParameter("menuSeq") != null) {
                    md.setMenuSeq(Integer.parseInt(request.getParameter("menuSeq")) );
                }
                if (request.getParameter("showListSts") != null) {
                    md.setShowListSts(request.getParameter("showListSts") );
                }

                if (request.getParameter("picCode") != null) {
                    md.setPicCode(request.getParameter("picCode") );
                }
                if (request.getParameter("menuCIconLoc") != null) {
                    md.setMenuCIconLoc(request.getParameter("menuCIconLoc") );
                }
                if (request.getParameter("menuCRemarkT") != null) {
                    md.setMenuCRemarkT(request.getParameter("menuCRemarkT") );
                }
                 if (request.getParameter("menuCRemarkE") != null) {
                    md.setMenuCRemarkE(request.getParameter("menuCRemarkE") );
                }
                if (request.getParameter("action").equals("Add")) {
                    mdt.add(md);
                } else if (request.getParameter("action").equals("Edit")) {
                    mdt.update(md);
                } else if (request.getParameter("action").equals("Del")) {
                    mdt.remove(md);
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
