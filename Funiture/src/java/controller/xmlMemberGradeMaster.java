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
import model.entity.memberGradeMasterEntity;
import model.memberGradeMasterTable;

/**
 *
 * @author Achilles
 */
public class xmlMemberGradeMaster extends HttpServlet {
   
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
               // String sField = request.getParameter("searchField") != null ? request.getParameter("searchField") : null;
              //  String sValue = request.getParameter("searchString") != null ? request.getParameter("searchString") : null;
              //  String sOper = request.getParameter("searchOper") != null ? request.getParameter("searchOper") : null;
                int rows = 20, page = 1;
                if (request.getParameter("rows") != null && !request.getParameter("rows").equals("")) {
                    String r = request.getParameter("rows");
                    rows = Integer.parseInt(r);
                }
                if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
                    String r = request.getParameter("page");
                    page = Integer.parseInt(r);
                }
                int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
   int start = rows * page - rows;
                String colorId = null, Edit = null, Del = null;
                String sField = null, sValue = null, sOper = null;

                if (request.getParameter("Edit") != null) {
                    Edit = request.getParameter("Edit");
                }
                if (request.getParameter("Del") != null) {
                    Del = request.getParameter("Del");
                }
                  if (request.getParameter("q").equals("2")) {
                    if (request.getParameter("searchField") != null) {
                        sField = request.getParameter("searchField");
                    }
                    if (request.getParameter("searchString") != null) {
                        sValue = request.getParameter("searchString");
                    }
                    if (request.getParameter("searchOper") != null) {
                        sOper = request.getParameter("searchOper");
                    }
                }
                Database db = new Database();
                memberGradeMasterTable mgt = new memberGradeMasterTable(db);
                memberGradeMasterEntity mg = new memberGradeMasterEntity();
                //mg.setCompanyId(Company_Id);
        
             // int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
               
                if (request.getParameter("q").equals("2")) {
                     ArrayList list = mgt.search(sField, sValue, sOper, Company_Id);
                    db.close();
                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(1);
                    xml.setPage(1);
                    xml.setRecords(list.size());
                    for (int i = 0; i < list.size(); i++) {
                        memberGradeMasterEntity data = (memberGradeMasterEntity) list.get(i);
                        xml.setRowDetail(data.getMemberGradeId(), i + 1,
                                data.getMemberGrade(),
                                data.getGradeNameT(),
                                data.getGradeNameE(), 
                                data.getDiscountRate(),
                                data.getPaymentTerm(),
                                data.getMemberPriceFlag(),
                                data.getMemberGradeId(),
                                data.getMemberGradeId(),
                                data.getMemberGradeId());

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
