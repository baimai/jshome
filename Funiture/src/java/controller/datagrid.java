/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.Xml.GenerateXml;
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
import model.companyMasterTable;
import model.entity.menuDetailMasterEntity;
import model.entity.picProductSetupEntity;
import model.entity.productDetailMasterEntity;
import model.picProductSetupTable;
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
        request.setCharacterEncoding("utf-8");
        try {

            if (request.getParameter("action").equals("fetchData")) {
                response.setContentType("text/xml;charset=UTF-8");

                int rows = 20, page = 1;
                if (request.getParameter("rows") != null && !request.getParameter("rows").equals("")) {
                    String r = request.getParameter("rows");
                    rows = Integer.parseInt(r);
                }
                if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
                    String r = request.getParameter("page");
                    page = Integer.parseInt(r);
                }
                int start = rows * page - rows;
                String picCode = null;
                String sField = null, sValue = null, sOper = null;
                /*
                if (request.getParameter("menuCode") != null ) {
                menuCode = request.getParameter("menuCode");
                }
                 */
                if (request.getParameter("picCode") != null) {
                    picCode = request.getParameter("picCode");
                }
                if (request.getParameter("searchField") != null) {
                    sField = request.getParameter("searchField");
                }
                if (request.getParameter("searchString") != null) {
                    sValue = request.getParameter("searchString");
                }
                if (request.getParameter("searchOper") != null) {
                    sOper = request.getParameter("searchOper");
                }


                int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
                Database db = new Database();
                picProductSetupTable ppst = new picProductSetupTable(db);
                picProductSetupEntity pps = new picProductSetupEntity();
                menuDetailMasterEntity mdm = new menuDetailMasterEntity();
                pps.setCompanyId(Company_Id);
                pps.setPicCode(picCode);
                ArrayList list2 = ppst.searchHeader(sField, sValue, sOper,pps);
                ArrayList list = ppst.search(sField, sValue, sOper,pps,start,rows);
                if (request.getParameter("q").equals("1")) {
                    int totalPages = 0;
                    int totalCount = ppst.countAll(pps);
                    db.close();
                    if(totalCount%rows==0) totalPages = totalCount/rows;
                    else totalPages = (totalCount/rows)+1;
                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(totalPages);
                    xml.setPage(page);
                    xml.setRecords(totalCount);
                    for (int i = 0; i < list.size(); i++) {
                        picProductSetupEntity data = (picProductSetupEntity) list.get(i);
                        xml.setRowDetail(data.getPicId(),
                               data.getPicCode(),data.getProductDetailMasterEntity().getProductDPicLoc(),
                               data.getProductCode(),data.getPicNameT(),data.getPicNameE(),
                               data.getProductRemarkT(),data.getProductRemarkE(),data.getPicId(),data.getPicId());
                    }
                    out.print(xml.getXml());
                } else if (request.getParameter("q").equals("2")) {
                    int totalPages = 0;
                    int totalCount = ppst.countAll(pps);
                    db.close();
                    if(totalCount%rows==0) totalPages = totalCount/rows;
                    else totalPages = (totalCount/rows)+1;
                    GenerateXml xml = new GenerateXml();
                    xml.setTotal(1);
                    xml.setPage(request.getParameter("page"));
                    xml.setRecords(list2.size());
                    for (int i = 0; i < list2.size(); i++) {
                        picProductSetupEntity data = (picProductSetupEntity) list2.get(i);
                        xml.setRowDetail(data.getPicCode(), i+1,
                               data.getPicCode(),data.getMenuDetailMasterEntity().getMenuCNameT(),
                               data.getMenuDetailMasterEntity().getMenuCNameE(),data.getPicCode(),data.getPicCode(),data.getPicCode());
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
