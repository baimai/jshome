/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.product.product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Achilles
 */
public class addProduct extends HttpServlet {

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
            String productCode = request.getParameter("productCode");
            String productName = request.getParameter("productName");
            int amount = 0;
            ArrayList list = null;
            if (request.getParameter("amount") != null && !request.getParameter("amount").equals("")) {
                amount = Integer.parseInt(request.getParameter("amount"));
            }
            int flag = 0;
            String status = request.getParameter("status");
            if (amount > 0) {
                if (s.getAttribute("productList") != null) {
                    list = (ArrayList) s.getAttribute("productList");
                    if (list.size() > 0) {
                        for (int i = 0; i < list.size() && flag != 1; i++) {
                            product chkPro = (product) list.get(i);
                            //เพิ่ม,ลด จำนวนสินค้า
                            if (chkPro.getProductCode().equals(productCode)) {
                                if (chkPro.getAmount() - amount <= 0 && status.equals("-")) {
                                    //ถ้าสินค้าลดลงต่ำกว่าศูนย์
                                    list.remove(i);
                                    if (list.isEmpty()) {
                                        list = null;
                                    }
                                } else {
                                    if (status.equals("+")) {
                                        //ถ้ามีการเพิ่มสินค้า
                                        chkPro.setAmount(chkPro.getAmount() + amount);
                                    } else {
                                        //ถ้ามีการลดสินค้า
                                        chkPro.setAmount(chkPro.getAmount() - amount);
                                    }
                                    list.set(i, chkPro);
                                }
                                flag = 1;
                            }
                            //ถ้าเป็นสิ้นค้าใหม่ก็เพิ่มเข้าไปในลิส
                            if (i == (list.size() - 1)&&flag != 1) {
                                product pro = new product();
                                pro.setAmount(amount);
                                pro.setProductCode(productCode);
                                pro.setProductName(productName);
                                list.add(pro);
                            }
                        }
                    }
                } else {
                    //ถ้ายังไม่มีสินค้าในลิสก็เพิ่มเข้าไป
                    if (status.equals("+")) {
                        list = new ArrayList();
                        product pro = new product();
                        pro.setAmount(amount);
                        pro.setProductCode(productCode);
                        pro.setProductName(productName);
                        list.add(pro);
                    }
                }
            }
            if (list != null) {
                s.setAttribute("productList", list);
            }
            response.sendRedirect("product_detail_1.jsp?productCode="+productCode);
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
