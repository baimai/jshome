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
import model.entity.colorCodeMasterEntity;

/**
 *
 * @author Jik
 */
public class colorMaster extends HttpServlet {

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
            HttpSession s = request.getSession();

            Database db = new Database();
            colorCodeMasterEntity cm = new colorCodeMasterEntity();
            colorMasterTable cmt = new colorMasterTable(db);
             if (request.getParameter("colorId") != null&&request.getParameter("action").equals("Edit")) {
                    cm.setColorId(Integer.parseInt(request.getParameter("colorId")));
                }
            if (request.getParameter("colorCode") != null) {
                cm.setColorCode(request.getParameter("colorCode"));
            }
            if (request.getParameter("colorNameT") != null) {
                cm.setColorNameT(request.getParameter("colorNameT"));
            }
            if (request.getParameter("colorNameE") != null) {
                cm.setColorNameE(request.getParameter("colorNameE"));
            }
            cm.setCreateDate(Timestamp.valueOf(db.getNow()));
            if (request.getParameter("action").equals("Add")) {
                
                cmt.add(cm);

            } else if (request.getParameter("action").equals("Edit")) {
                    cmt.update(cm);
                } else if (request.getParameter("action").equals("Del")) {
                    //pgmt.remove(pgm);
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
