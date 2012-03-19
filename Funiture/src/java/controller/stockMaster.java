/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Date;
//import java.util.Date;
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
                out.println("getProductDetailId>>>>" + mps.getProductDetailId());
                if (request.getParameter("quantity") != null) {
                    mps.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                }
                if (request.getParameter("receiveDate") != null) {
                    String tmpDate[] = request.getParameter("receiveDate").split("/");
                    mps.setReceiveDate(Date.valueOf(tmpDate[2]+"-"+tmpDate[0]+"-"+tmpDate[1]));
                }
                out.println("quantity>>>>" + mps.getQuantity());
                if (request.getParameter("unitId") != null) {
                    mps.setUnitId(Integer.parseInt(request.getParameter("unitId")));
                }
                out.println("getReceiveDate>>>>" + mps.getReceiveDate());
                mps.setCreateDate(Timestamp.valueOf(db.getNow()));
                mps.setUpdateDate(Timestamp.valueOf(db.getNow()));
                if (request.getParameter("action").equals("add")) {
                    Boolean chk = st.getAvailable(mps);
                    if (chk == true) {
                        st.update(mps);
                    } else {
                        st.add(mps);
                    }
                }
                out.println("getReceiveDate" + mps.getReceiveDate());
                out.println("getProductDetailId" + mps.getProductDetailId());
                out.println("quantity" + mps.getQuantity());
                db.close();
                response.sendRedirect("Stock.jsp");
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
