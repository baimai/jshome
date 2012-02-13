/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;
import java.sql.Timestamp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Database;
import model.companyMasterTable;
import model.entity.companyMasterEntity;


/**
 *
 * @author Jik
 */
public class companyMasterController extends HttpServlet {
   
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
            companyMasterTable cpm = new companyMasterTable(db);
            companyMasterEntity cp = new companyMasterEntity();

            if (request.getParameter("companyCode") != null) {
                cp.setCompanyCode(request.getParameter("companyCode"));
            }
            if (request.getParameter("companyNameT")!=null){
                cp.setCompanyNameT(request.getParameter("companyNameT"));
            }
            if (request.getParameter("companyNameE")!=null){
                cp.setCompanyNameE(request.getParameter("companyNameE"));
            }
            if (request.getParameter("companyAbbr")!=null){
                cp.setCompanyAbbr(request.getParameter("companyAbbr"));
            }
            if (request.getParameter("companyLogoLoc")!=null){
                cp.setCompanyLogoLoc(request.getParameter("companyLogoLoc"));
            }
           if (request.getParameter("companyAddrT")!=null){
                cp.setCompanyAddrT(request.getParameter("companyAddrT"));
            }
            if (request.getParameter("companyAddrE")!=null){
                cp.setCompanyAddrE(request.getParameter("companyAddrE"));
            }
             if (request.getParameter("companyDistrictT")!=null){
                cp.setCompanyDistrictT(request.getParameter("companyDistrictT"));
            }
            if (request.getParameter("companyDistrictE")!=null){
                cp.setCompanyDistrictE(request.getParameter("companyDistrictE"));
            }
            if (request.getParameter("companyAmphurT")!=null){
                cp.setCompanyAmphurT(request.getParameter("companyAmphurT"));
            }
            if (request.getParameter("companyAmphurE")!=null){
                cp.setCompanyAmphurE(request.getParameter("companyAmphurE"));
            }
             if (request.getParameter("companyProvinceT")!=null){
                cp.setCompanyProvinceT(request.getParameter("companyProvinceT"));
            }
            if (request.getParameter("companyProvinceE")!=null){
                cp.setCompanyProvinceE(request.getParameter("companyProvinceE"));
            }
             if (request.getParameter("companyPostCode")!=null){
                cp.setCompanyPostCode(request.getParameter("companyPostCode"));
            }
             if (request.getParameter("companyTel1")!=null){
                cp.setCompanyTel1(request.getParameter("companyTel1"));
            }
             if (request.getParameter("companyTel2")!=null){
                cp.setCompanyTel2(request.getParameter("companyTel2"));
            }
             if (request.getParameter("companyTel3")!=null){
                cp.setCompanyTel3(request.getParameter("companyTel3"));
            }
           if (request.getParameter("companyFax1")!=null){
                cp.setCompanyFax1(request.getParameter("companyFax1"));
            }
           if (request.getParameter("companyFax2")!=null){
                cp.setCompanyFax2(request.getParameter("companyFax2"));
            }
           if (request.getParameter("companyFax3")!=null){
                cp.setCompanyFax3(request.getParameter("companyFax3"));
            }
           if (request.getParameter("companyMobile1")!=null){
                cp.setCompanyMobile1(request.getParameter("companyMobile1"));
            }
            if (request.getParameter("companyMobile2")!=null){
                cp.setCompanyMobile2(request.getParameter("companyMobile2"));
            }
             if (request.getParameter("companyMobile3")!=null){
                cp.setCompanyMobile3(request.getParameter("companyMobile3"));
            }
             if (request.getParameter("companyEmail1")!=null){
                cp.setCompanyNameT(request.getParameter("companyEmail1"));
            }
             if (request.getParameter("companyEmail2")!=null){
                cp.setCompanyEmail2(request.getParameter("companyEmail2"));
            }
             if (request.getParameter("companyEmail3")!=null){
                cp.setCompanyEmail3(request.getParameter("companyEmail3"));
            }
             if (request.getParameter("languageFlag")!=null){
                cp.setLanguageFlag(request.getParameter("languageFlag"));
            }
             if (request.getParameter("picCode")!=null){
                cp.setPicCode(request.getParameter("picCode"));
            }
           cp.setCreateDate(Timestamp.valueOf(db.getNow()));
           cp.setUpdateDate(Timestamp.valueOf(db.getNow()));

            if (request.getParameter("action").equals("Add")) {

                cpm.add(cp);


                }

         out.print("xxx"+request.getParameter("companyCode"));     
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
