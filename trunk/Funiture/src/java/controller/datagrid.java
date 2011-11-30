/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Database;
import model.entity.productDetailMaster;
import model.productDetailMasterTable;
import util.Default;

/**
 *
 * @author Achilles
 */
public class datagrid extends HttpServlet {

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
            
             if (request.getParameter("action").equals("fetchData")) {
                response.setContentType("text/xml;charset=UTF-8");                

                String status = request.getParameter("status");

                String rows = request.getParameter("rows");
                String page = request.getParameter("page");
                

                int totalPages = 0;
                int totalCount = 15;
                
                if (totalCount > 0) {
                    if (totalCount % Integer.parseInt(rows) == 0) {
                        totalPages = totalCount / Integer.parseInt(rows);
                    } else {
                        totalPages = (totalCount / Integer.parseInt(rows)) + 1;
                    }

                } else {
                    totalPages = 0;
                }
                
                Database db = new Database();
                productDetailMasterTable pdm = new productDetailMasterTable(db);
                ArrayList list = pdm.search();
                db.close();
                
                out.print("<?xml version='1.0' encoding='utf-8'?>\n");
                out.print("<rows>");
                out.print("<page>" + request.getParameter("page") + "</page>");

                out.print("<total>" + totalPages + "</total>");
                out.print("<records>" + 15 + "</records>");
                int srNo = 1;
                
                for (int i=0;i<list.size();i++) {
                   productDetailMaster data = (productDetailMaster)list.get(i);
                    out.print("<row id='" + data.getProductCode() + "'>");
                    out.print("<cell>"+data.getProductGroup()+"</cell>");
                    out.print("<cell>" + data.getProductCode() + "</cell>");
                    out.print("<cell>"+data.getProductDNameT()+"</cell>");                    
                    out.print("<cell>"+data.getProductPrice1()+"</cell>");
                    out.print("<cell>"+data.getProductSpect1_T()+"</cell>");
                    out.print("<cell>"+data.getProductSpect2_T()+"</cell>");
                    out.print("<cell>"+data.getProductSpect3_T()+"</cell>");
                    out.print("<cell>"+data.getProductSpect4_T()+"</cell>");
                    out.print("<cell>"+data.getProductSpect5_T()+"</cell>");
                    out.print("<cell>"+data.getProductSpect6_T()+"</cell>");
                    out.print("<cell>"+data.getUserId() +"</cell>");
                    out.print("</row>");
                    srNo++;                
                }
                out.print("</rows>");
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
