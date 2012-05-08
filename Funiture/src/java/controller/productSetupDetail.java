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
import model.entity.picProductSetupDetailEntity;
import model.entity.picProductSetupEntity;
import model.entity.productDetailMasterEntity;
import model.entity.userSecurityEntity;
import model.picProductSetupDetailTable;
import model.picProductSetupTable;
import model.productDetailMasterTable;

/**
 *
 * @author baimai
 */
public class productSetupDetail extends HttpServlet {
   
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
                //====setup picture
                picProductSetupDetailEntity psd = new picProductSetupDetailEntity();
                picProductSetupDetailTable psdt = new picProductSetupDetailTable(db);
                //====set detail picture
                picProductSetupEntity pps = new picProductSetupEntity();
                picProductSetupTable mpst = new picProductSetupTable(db);
                //=== product detail
                productDetailMasterTable pdmt = new productDetailMasterTable(db);
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                //=== เก็บ session
                HttpSession s = request.getSession(true);
                //=== user longin
                userSecurityEntity lc = (userSecurityEntity) s.getAttribute("loginDetail");

                int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");

                if (request.getParameter("picDetailId") != null && !request.getParameter("picDetailId").equals("")) {
                    psd.setPicDetailId(Integer.parseInt(request.getParameter("picDetailId")));
                }
              if (request.getParameter("picId") != null && !request.getParameter("picId").equals("")) {
                  psd.setPicId(Integer.parseInt(request.getParameter("picId")));
                }
               
                if (request.getParameter("productCode") != null) {
                    pdm.setProductCode(request.getParameter("productCode"));
                    pdm.setCompanyId(Company_Id);
                    int i = pdmt.getProductId(pdm);
                    if (i != 0) {
                        psd.setProductDetailId(i);
                    }
                }
                if (request.getParameter("picDetailNameT") != null) {
                    psd.setPicDetailNameT(request.getParameter("picDetailNameT"));
                  //  out.print("picNameT"+mps.getPicNameT());
                }
                if (request.getParameter("picDetailNameE") != null) {
                    psd.setPicDetailNameE(request.getParameter("picDetailNameE"));
                }
                if (request.getParameter("picDetailRemarkT") != null) {
                    psd.setPicDetailRemarkT(request.getParameter("picDetailRemarkT"));
                }
                if (request.getParameter("picDetailRemarkE") != null) {
                    psd.setPicDetailRemarkE(request.getParameter("picDetailRemarkE"));
                }

                psd.setCreateDate(Timestamp.valueOf(db.getNow()));
                psd.setUpdateDate(Timestamp.valueOf(db.getNow()));
                if (request.getParameter("action").equals("Add")) {
                    psdt.add(psd);
                } else if (request.getParameter("action").equals("Edit")) {
                    psdt.update(psd);
                } else if (request.getParameter("action").equals("Edit2")) {
                    psdt.update(psd);
                    response.sendRedirect("ProductSetup.jsp");
                } else if (request.getParameter("action").equals("Del")) {
                    psdt.remove(psd);
                }

                db.close();
                if (request.getParameter("action").equals("Add")) {
                    response.sendRedirect("ProductSetup.jsp");
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
