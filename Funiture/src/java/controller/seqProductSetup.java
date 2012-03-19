/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Database;
import model.entity.picProductSetupEntity;
import model.picProductSetupTable;

/**
 *
 * @author Achilles
 */
public class seqProductSetup extends HttpServlet {

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

            HttpSession s = request.getSession();

            int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
            if (request.getParameter("action") != null) {
                if (request.getParameter("action").equals("fetchData")) {
                    Database db = new Database();
                    picProductSetupTable ppst = new picProductSetupTable(db);
                    picProductSetupEntity pps = new picProductSetupEntity();
                    pps.setCompanyId(Company_Id);
                    pps.setPicCode(request.getParameter("picCode"));
                    ArrayList list = ppst.searchPicCode(pps);
                    db.close();
                    s.setAttribute("picProductList", list);
                    response.sendRedirect("seqProductSetup.jsp?picCode=" + request.getParameter("picCode"));
                    // RequestDispatcher obj = request.getRequestDispatcher("seqProductSetup.jsp");
                    //obj.forward(request, response);
                } else if (request.getParameter("action").equals("editSeq")) {
                    ArrayList list = (ArrayList) s.getAttribute("picProductList");
                    int seq[] = new int[list.size()];
                    for (int i = 0; i < list.size(); i++) {
                        picProductSetupEntity pps = (picProductSetupEntity) list.get(i);
                        if (pps.getPicId() == Integer.parseInt(request.getParameter("picId"))) {
                            if (request.getParameter("status").equals("plus")) {
                                pps.setPicSeq(pps.getPicSeq() + 1);
                            } else if (request.getParameter("status").equals("minus")) {
                                if (pps.getPicSeq() > 0) {
                                    pps.setPicSeq(pps.getPicSeq() - 1);
                                }

                            }
                        }
                        seq[i] = pps.getPicSeq();
                    }
                    ArrayList list2 = new ArrayList();
                    for (int i = 0; i < seq.length; i++) {
                        if (seq[i] != 9999) {
                            int k = seq[i];
                            int pointer = i;
                            for (int j = 0; j < seq.length; j++) {
                                if (k >= seq[j]) {
                                    k = seq[j];
                                    pointer = j;
                                    i = -1;
                                }
                            }
                            list2.add(list.get(pointer));
                            seq[pointer] = 9999;
                        }
                    }
                    s.setAttribute("picProductList", list2);
                    response.sendRedirect("seqProductSetup.jsp?picCode=" + request.getParameter("picCode"));
                } else if (request.getParameter("action").equals("saveSeq")) {
                    ArrayList list = (ArrayList) s.getAttribute("picProductList");
                    Database db = new Database();
                    for (int i = 0; i < list.size(); i++) {
                        picProductSetupEntity pps = (picProductSetupEntity) list.get(i);
                        picProductSetupTable ppst = new picProductSetupTable(db);
                        ppst.updateSeq(pps);
                    }
                    db.close();
                    response.sendRedirect("seqProductSetup.jsp?picCode=" + request.getParameter("picCode"));
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
