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
import model.Database;
import model.entity.productDetailMasterEntity;
import model.entity.stockMasterEntity;
import model.productDetailMasterTable;
import model.stockMasterTable;

/**
 *
 * @author Jik
 */
public class stockMaster extends HttpServlet {
   
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
                stockMasterTable st = new stockMasterTable(db);
                productDetailMasterTable pdmt = new productDetailMasterTable(db);
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
                stockMasterEntity mps = new stockMasterEntity();

                if (request.getParameter("stockId") != null && !request.getParameter("stockId").equals("")) {
                    mps.setStockId(Integer.parseInt(request.getParameter("stockId")));
                }
                mps.setCompanyId(Company_Id);
                if (request.getParameter("productCode") != null) {
                    pdm.setProductCode(request.getParameter("productCode"));
                    pdm.setCompanyId(Company_Id);
                    int i = pdmt.getProductId(pdm);
                    if (i != 0) {
                        mps.setProductDetailId(i);
                    }
                }

                if (request.getParameter("quantity") != null) {
                    mps.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                }
                if (request.getParameter("unitId") != null) {
                    mps.setUnitId(Integer.parseInt(request.getParameter("unitId")));
                }

                mps.setCreateDate(Timestamp.valueOf(db.getNow()));
                mps.setUpdateDate(Timestamp.valueOf(db.getNow()));
               if (request.getParameter("action").equals("save")) {
                    st.add(mps);
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
