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
import model.colorMasterTable;
import model.entity.colorCodeMasterEntity;
import model.entity.productDetailMasterEntity;
import model.entity.productGroupMasterEntity;
import model.productDetailMasterTable;
import model.productGroupMasterTable;

/**
 *
 * @author Achilles
 */
public class remove extends HttpServlet {

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
            Database db = new Database();
            int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
            if (request.getParameter("action") != null) {
                if (request.getParameter("productDetailId") != null && !request.getParameter("productDetailId").equals("")) {
                    productDetailMasterEntity pdm = new productDetailMasterEntity();
                    productDetailMasterTable pdmt = new productDetailMasterTable(db);
                    pdm.setCompanyId(Company_Id);
                    pdm.setProductDetailId(Integer.parseInt(request.getParameter("productDetailId")));

                    pdmt.remove(pdm);
                }
                else if(request.getParameter("productGroupId") != null && !request.getParameter("productGroupId").equals("")){
                    productGroupMasterEntity pgm = new productGroupMasterEntity();
                    productGroupMasterTable pgmt = new productGroupMasterTable(db);
                    pgm.setCompanyId(Company_Id);
                    pgm.setProductGroupId(Integer.parseInt(request.getParameter("productGroupId")));                   
                    Boolean checkChild = pgmt.checkChild(pgm);
                if (checkChild == false) {
                    pgmt.remove(pgm);

                }
                    else {
                                db.close();
                                response.sendRedirect("ProductGroup.jsp?error=1");
                            }
                    
                }
                else if(request.getParameter("colorId") != null && !request.getParameter("colorId").equals("")){
                    colorCodeMasterEntity ccm = new colorCodeMasterEntity();
                    colorMasterTable cmt = new colorMasterTable(db);
                    //ccm.setCompanyId(Company_Id);
                    ccm.setColorId(Integer.parseInt(request.getParameter("colorId")));
                    out.println("ccc"+ccm.getColorId());
                    Boolean checkChild = cmt.checkChild(ccm);
                if (checkChild == false) {
                    cmt.remove(ccm);

                }
                    else {
                                db.close();
                                response.sendRedirect("color.jsp?error=1");
                            }

                }


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
