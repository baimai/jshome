/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import controller.Xml.GenerateXml;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Database;
import model.colorMasterTable;
import model.entity.colorCodeMasterEntity;
/**
 *
 * @author Jik
 */
public class xmlColorMaster extends HttpServlet {
   
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
           if (request.getParameter("action").equals("fetchData")) {
                response.setContentType("text/xml;charset=UTF-8");

                int rows = request.getParameter("rows") != null && !request.getParameter("rows").equals("") ? Integer.parseInt(request.getParameter("rows")) : 20;
                int page = request.getParameter("page") != null && !request.getParameter("page").equals("") ? Integer.parseInt(request.getParameter("page")) : 1;
                int start = rows * page - rows;
                String sField = request.getParameter("searchField") != null ? request.getParameter("searchField") : null;
                String sValue = request.getParameter("searchString") != null ? request.getParameter("searchString") : null;
                String sOper = request.getParameter("searchOper") != null ? request.getParameter("searchOper") : null;
               
                Database db = new Database();
                colorMasterTable cmt = new colorMasterTable(db);
                ArrayList list = cmt.search(sField, sValue, sOper,start,rows);
                if (request.getParameter("q").equals("1")) {
                    int totalPages = 0;
                    int totalCount = cmt.countAll();
                    db.close();
                    if(totalCount%rows==0) totalPages = totalCount/rows;
                    else totalPages = (totalCount/rows)+1;
                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(totalPages);
                    xml.setPage(page);
                    xml.setRecords(totalCount);
                    for (int i = 0; i < list.size(); i++) {
                        colorCodeMasterEntity data = (colorCodeMasterEntity) list.get(i);
                        xml.setRowDetail(data.getColorId(),data.getColorCode(), data.getColorNameT(),data.getColorNameE(),data.getColorId());
                    }
                    out.print(xml.getXml());
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
