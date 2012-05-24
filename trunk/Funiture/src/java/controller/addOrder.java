/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.error.errorClass;
import controller.loginDetail.loginClass;
import controller.product.product;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Database;
import model.entity.memberGradeMasterEntity;
import model.entity.memberMasterEntity;
import model.entity.orderDetailMasterEntity;
import model.entity.orderHeaderMasterEntity;
import model.entity.productDetailMasterEntity;
import model.entity.stockBalanceEntity;
import model.memberGradeMasterTable;
import model.memberMasterTable;
import model.orderDetailMasterTable;
import model.orderHeaderMasterTable;
import model.productDetailMasterTable;
import model.stockBalanceTable;
//
import model.entity.companyMasterEntity;
import model.companyMasterTable;
//

/**
 *
 * @author Achilles
 */
public class addOrder extends HttpServlet {

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
            HttpSession s = request.getSession(true);
            loginClass lc = (loginClass) s.getAttribute("loginDetail");
            Vector v = new Vector();            
            Database db = new Database();
            errorClass err = new errorClass();
            orderDetailMasterEntity odm = new orderDetailMasterEntity();
            orderDetailMasterTable odmt = new orderDetailMasterTable(db);
            orderHeaderMasterEntity ohm = new orderHeaderMasterEntity();
            orderHeaderMasterTable ohmt = new orderHeaderMasterTable(db);
            productDetailMasterTable pdmt = new productDetailMasterTable(db);
            productDetailMasterEntity pdm = new productDetailMasterEntity();
            //
            companyMasterEntity cm = new companyMasterEntity();
            companyMasterTable cmt = new companyMasterTable(db);
            //
            memberMasterTable mgmt = new memberMasterTable(db);
            memberMasterEntity mgm = new memberMasterEntity();
            stockBalanceEntity sb = new stockBalanceEntity();
            stockBalanceTable sbt = new stockBalanceTable(db);
            loginClass lg = (loginClass) s.getAttribute("loginDetail");
            mgm.setMemberId(lg.getMemberId());
            int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
            //
            String ShowStockBalanceFlag = cm.getShowStockBalanceFlag();
            out.print("xxx"+cm.getShowStockBalanceFlag());
            //
            if (s.getAttribute("productList") != null) {
                ArrayList list = (ArrayList) s.getAttribute("productList");
                double total = 0;
                String[] itemCode = new String[list.size()];
                String[] itemName = new String[list.size()];
                String[] itemDetail = new String[list.size()];
             
                //String ShowStockBalanceFlag = "N";
                for (int i = 0; i < list.size(); i++) {

                    product p = (product) list.get(i);
                    total = total + (p.getAmount() * p.getProductPrice());
                    sb.setProductDetailId(p.getProductDetailId());
                    //
                    //if (request.getParameter("ShowStockBalanceFlag") == 'N') {
                    //if (cm.getShowStockBalanceFlag().equals("N")) {
                    //if (cm.getShowStockBalanceFlag().equals("N")) {
                    //if (sbt.getBalanceProduct(sb) - p.getAmount() < 0) {
                    //out.print("kkk"+ShowStockBalanceFlag));
                    if(ShowStockBalanceFlag.equals("Y")){
                        if (sbt.getBalanceProduct(sb) - p.getAmount() < 0) {
                        err.setErrorCode("SB00");
                        err.setHeader("จำนวนสินค้าคงเหลือในขณSะนี้ น้อยกว่าจำนวนสินค้าที่ท่านทำรายการสินค้า กรุณาปรับปรุงรายการสินค้า!");
                        itemCode[i] = p.getProductCode();
                        itemName[i] = p.getProductName();
                        itemDetail[i] = "จำนวนสินค้าปัจจุบัน " + sbt.getBalanceProduct(sb) + "   จำนวนที่ท่านเลือก " + p.getAmount();
                    }
                    //
                    }

                    //
                }
                if (err.getErrorCode() != null) {
                    err.setItemCode(itemCode);
                    err.setItemName(itemName);
                    err.setItemDetail(itemDetail);
                    db.close();
                    request.setAttribute("error", err);
                    RequestDispatcher obj = request.getRequestDispatcher("error.jsp");
                    obj.forward(request, response);
                }

                //insert header Order
                ohm.setCompanyId(Company_Id);
                ohm.setMemberId(lc.getMemberId());
                ohm.setOrderDate(Timestamp.valueOf(db.getNow()));
                ohm.setOrderStatus("N");
                ohm.setShippingCost(BigDecimal.ZERO);
                ohm.setTotalAmount(BigDecimal.valueOf(total));
                ohm.setCreateDate(Timestamp.valueOf(db.getNow()));
                ohm.setUpdateDate(Timestamp.valueOf(db.getNow()));
                mgm = mgmt.searchByUserId(mgm);
                int rowNum = ohmt.add(ohm);
                if (rowNum != -1) {
                    int oid = ohmt.getOrderId(ohm, Company_Id);
                    ohm.setOrderId(oid);
                    odm.setCompanyId(Company_Id);
                    odm.setOrderId(oid);
                    for (int i = 0; i < list.size(); i++) {
                        
                        product p = (product) list.get(i);
                        productDetailMasterEntity pdm2 = pdmt.searchForDiscount(p.getProductDetailId());
                        //
                        odm.setProductVolumn(p.getAmount());
                        //เซตว่าใช้ราคาไหน
                        if (mgm.getMemberGradeMasterEntity().getMemberPriceFlag().equals("W")) {
                            if (pdm2.getProductPrice1() != BigDecimal.ZERO && pdm2.getProductPrice2()==BigDecimal.ZERO) {
                                odm.setProductCost(pdm2.getProductPrice1());
                            } else {
                                odm.setProductCost(pdm2.getProductPrice2());
                            }
                        } else if (mgm.getMemberGradeMasterEntity().getMemberPriceFlag().equals("R")) {
                            if (pdm2.getProductPrice3() != BigDecimal.ZERO && pdm2.getProductPrice4()==BigDecimal.ZERO) {
                                odm.setProductCost(pdm2.getProductPrice3());
                            } else {
                                odm.setProductCost(pdm2.getProductPrice4());
                            }
                        }else{
                            odm.setProductCost(BigDecimal.ZERO);
                        }
                        //end
                        odm.setDiscountPrice(BigDecimal.ZERO);
                        odm.setFreeVolumn(0);
                        odm.setProductAmount(odm.getProductCost().multiply(BigDecimal.valueOf(odm.getProductVolumn())));
                        //เช็คว่า status ส่วนลดเป็นอะไร
                        if (pdm2.getSaleDiscountHMaster().getDiscountType().equals("R") || pdm2.getSaleDiscountHMaster().getDiscountType().equals("B")) {
                            //เช็คว่าจำนวนสินค้าที่ซื้อมาอยู่ในช่วงส่วนลดหรือไม่
                            if (pdm2.getSaleDiscountDMaster().getDiscountFrom() <= p.getAmount() && pdm2.getSaleDiscountDMaster().getDiscountTo() >= p.getAmount()) {
                                // ถ้า status ลดเป็น %
                                if (pdm2.getSaleDiscountHMaster().getDiscountType().equals("R")) {
                                    odm.setDiscountPrice(odm.getProductAmount().multiply(pdm2.getSaleDiscountDMaster().getDiscount()).divide(BigDecimal.TEN.multiply(BigDecimal.TEN)));
                                    odm.setDiscountText("ลด "+pdm2.getSaleDiscountDMaster().getDiscount()+"%");
                                    // ถ้า status ลดเป็น ค่าคงที่
                                } else if (pdm2.getSaleDiscountHMaster().getDiscountType().equals("B")) {
                                    odm.setDiscountPrice(pdm2.getSaleDiscountDMaster().getDiscount());
                                    odm.setDiscountText("ลด "+odm.getDiscountPrice() +" บาท");
                                }

                            }
                            //end
                            //ถ้า status เป็นของแถม
                        } else if (pdm2.getSaleDiscountHMaster().getDiscountType().equals("P")) {
                            //ถ้าจำนวนมากว่าที่กำหนด
                            if (pdm2.getSaleDiscountDMaster().getSalesVolumn() <= p.getAmount()) {
                                int k=1;
                                for (int j = pdm2.getSaleDiscountDMaster().getSalesVolumn(); j <= p.getAmount(); j = j + pdm2.getSaleDiscountDMaster().getSalesVolumn()) {
                                    odm.setFreeVolumn(odm.getFreeVolumn() + pdm2.getSaleDiscountDMaster().getGetFreeVolumn());
                                    k++;
                                }
                                odm.setDiscountText("แถม "+k);
                            }
                        }
                        odm.setProductDetailId(p.getProductDetailId());
                        odm.setCreateDate(Timestamp.valueOf(db.getNow()));
                        odm.setUpdateDate(Timestamp.valueOf(db.getNow()));
                        odm.setShippingCost(BigDecimal.ZERO);                     
                        odmt.add(odm);
                    }
                    s.removeAttribute("productList");
                }
               ohm.setMemberId(lg.getMemberId());
               ohm.setUpdateDate(Timestamp.valueOf(db.getNow()));
               ohmt.updateDiscount(ohm);
            }
            db.close();
            response.sendRedirect("index.jsp");


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
