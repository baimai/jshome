/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.product.product;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
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
        request.setCharacterEncoding("utf-8");
        try {
            HttpSession s = request.getSession();
            if (request.getParameter("status").equals("plus")) {

                int productDetailId = Integer.parseInt(request.getParameter("productDetailId"));
                String productName = request.getParameter("productName");
                String productPath = request.getParameter("productPath");
                String productCode = request.getParameter("productCode");
                int productGroupId = Integer.parseInt(request.getParameter("productGroupId"));

                int amount = 0;
                double productPrice = 0.00;
                ArrayList list = null;
                if (request.getParameter("amount") != null && !request.getParameter("amount").equals("")
                        && request.getParameter("productPrice") != null && !request.getParameter("productPrice").equals("")) {
                    amount = Integer.parseInt(request.getParameter("amount"));
                    productPrice = Double.parseDouble(request.getParameter("productPrice"));
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
                                if (chkPro.getProductDetailId() == productDetailId) {
                                    if (chkPro.getAmount() - amount <= 0 && status.equals("minus")) {
                                        //ถ้าสินค้าลดลงต่ำกว่าศูนย์
                                        list.remove(i);
                                        if (list.isEmpty()) {
                                            list = null;
                                        }
                                    } else {
                                        if (status.equals("plus")) {
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
                                if (i == (list.size() - 1) && flag != 1) {
                                    product pro = new product();
                                    pro.setAmount(amount);
                                    pro.setProductDetailId(productDetailId);
                                    pro.setProductName(productName);
                                    pro.setProductPath(productPath);
                                    pro.setProductPrice(productPrice);
                                    pro.setProductCode(productCode);
                                    pro.setProductGroupId(productGroupId);
                                    list.add(pro);
                                    flag = 1;
                                }
                            }
                        }
                    } else {
                        //ถ้ายังไม่มีสินค้าในลิสก็เพิ่มเข้าไป
                        if (status.equals("plus")) {
                            list = new ArrayList();
                            product pro = new product();
                            pro.setAmount(amount);
                            pro.setProductDetailId(productDetailId);
                            pro.setProductName(productName);
                            pro.setProductPath(productPath);
                            pro.setProductPrice(productPrice);
                            pro.setProductCode(productCode);
                            pro.setProductGroupId(productGroupId);
                            list.add(pro);
                        }
                    }
                }
                if (list != null&&!list.isEmpty()) {
                    s.setAttribute("productList", list);
                }else{
                    s.removeAttribute("productList");
                }
                //RequestDispatcher obj = request.getRequestDispatcher("myCart.jsp");
                //obj.forward(request, response);

            } else if (request.getParameter("status").equals("update")) {
                String[] amounts = request.getParameterValues("amounts");
                ArrayList list = list = (ArrayList) s.getAttribute("productList");
                int j = 0;
                for (int i = 0; i < list.size(); i++, j++) {
                    product chkPro = (product) list.get(i);
                    if (Integer.parseInt(amounts[j]) == 0) {
                        //ถ้าใส่จำนวนมาเป็น0ก็ลบlist
                        list.remove(i);
                        i = i - 1;
                    } else {
                        //ถ้าจำนวนมากกว่า0
                        chkPro.setAmount(Integer.parseInt(amounts[j]));
                        list.set(i, chkPro);
                    }

                }

                if (list != null&&!list.isEmpty()) {
                    s.setAttribute("productList", list);
                }else{
                    s.removeAttribute("productList");
                }
                response.sendRedirect("cartDetail.jsp");
            } else if (request.getParameter("status").equals("remove")) {
                int productDetailId = Integer.parseInt(request.getParameter("productDetailId"));
                ArrayList list = list = (ArrayList) s.getAttribute("productList");
                for (int i = 0; i < list.size(); i++) {
                    product chkPro = (product) list.get(i);
                    if (chkPro.getProductDetailId() == productDetailId) {
                        list.remove(i);
                    }
                }
                if (list != null&&!list.isEmpty()) {
                    s.setAttribute("productList", list);
                }else{
                    s.removeAttribute("productList");
                }

                response.sendRedirect("cartDetail.jsp");
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
