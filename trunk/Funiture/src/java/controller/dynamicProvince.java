/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Database;
import model.commonProvinceTable;
import model.entity.commonProvinceEntity;

/**
 *
 * @author Achilles
 */
public class dynamicProvince extends HttpServlet {

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
            commonProvinceEntity cp = new commonProvinceEntity();
            commonProvinceTable cpt = new commonProvinceTable(db);
            int level = 0, id = 0;
            if (request.getParameter("level") != null && !request.getParameter("level").equals("")) {
                level = Integer.parseInt(request.getParameter("level"));
            }
            if (request.getParameter("id") != null && !request.getParameter("id").equals("")) {
                if (request.getParameter("complex") != null && request.getParameter("complex").equals("true")) {
                    //เช็คว่ามีผลไปยัง level ถัดไป หรือไม่ เช่น จังหวัด ส่งผลไปถึง การเลือก ตำบล
                    id = cpt.getFirstAmphurId(Integer.parseInt(request.getParameter("id")));
                } else {
                    id = Integer.parseInt(request.getParameter("id"));
                }
            }

            ArrayList list = cpt.search(level, id);
            if (list != null) {
                if (level == 1) {
                    out.println("<select name=\"memberProvince\" id=\"memberProvince\" onchange=\"changeCommonProvince(2,this.value)\" style=\"width:200px\">");
                } else if (level == 2) {
                    out.println("<select name=\"memberAmphur\" id=\"memberAmphur\" onchange=\"changeCommonProvince(3,this.value)\" style=\"width:200px\">");
                } else if (level == 3) {
                    out.println("<select name=\"memberDistinct\" id=\"memberDistinct\" style=\"width:200px\">");
                }
                for (int i = 0; i < list.size(); i++) {
                    commonProvinceEntity data = (commonProvinceEntity) list.get(i);
                    out.println("<option value=\"" + data.getId() + "\">" + data.getName() + "</option>");
                }
                out.println("</select>");

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
