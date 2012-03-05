/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import controller.memberMaster;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.memberMasterEntity;
import model.entity.orderDetailMasterEntity;
import model.entity.productDetailMasterEntity;
import util.Column;
import util.Default;
import util.Operation;

/**
 *
 * @author Achilles
 */
public class orderDetailMasterTable {

    private Database db;

    public orderDetailMasterTable(Database db) {
        this.db = db;
    }

    public void add(orderDetailMasterEntity odm) {
        String sql = "insert into order_detail_master "
                + "(Company_Id, Order_Id, Product_Detail_Id, Product_Volumn, Product_Cost, Product_Amount, "
                + " Create_Date, User_Id, Shipping_Cost,Discount_Price,Free_Volumn,Discount_Text) "
                + "values (?,?,?,?,?,?,?,?,?,?,?,?)";
        db.add(sql, odm.getCompanyId(),
                odm.getOrderId(),
                odm.getProductDetailId(),
                odm.getProductVolumn(),
                odm.getProductCost(),
                odm.getProductAmount(),
                odm.getCreateDate(),
                odm.getUserId(),
                odm.getShippingCost(),
                odm.getDiscountPrice(),
                odm.getFreeVolumn(),
                odm.getDiscountText());
    }

    public ArrayList searchId(int orderId) {
        String sql = " SELECT * FROM order_detail_master odm "
                + " join order_header_master ohm on ohm.order_id = odm.order_id "
                + " join product_detail_master pdm on pdm.product_detail_Id = odm.product_detail_id "
                + " where odm.order_id = ? ";
        List<Map<String, Object>> result = db.queryList(sql, orderId);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                memberMasterEntity mm = new memberMasterEntity();
                mm.setMemberId((Integer)result.get(i).get("Member_Id"));
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                pdm.setProductDNameE(Default.Str(result.get(i).get("Product_D_Name_E")));
                pdm.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                orderDetailMasterEntity odm2 = new orderDetailMasterEntity();
                odm2.setOrderId((Integer) result.get(i).get("Order_Id"));
                odm2.setProductDetailId((Integer) result.get(i).get("Product_Detail_Id"));
                odm2.setProductVolumn((Integer) result.get(i).get("Product_Volumn"));
                odm2.setProductCost(Default.BigDecimal(result.get(i).get("Product_Cost")));
                odm2.setProductAmount(Default.BigDecimal(result.get(i).get("Product_Amount")));
                odm2.setDiscountText(Default.Str(result.get(i).get("Discount_Text")));
                odm2.setDiscountPrice(Default.BigDecimal(result.get(i).get("Discount_Price")));
                odm2.setOrderDetailId((Integer) result.get(i).get("Order_Detail_Id"));
                odm2.setProductDetailMasterEntity(pdm);
                odm2.setMemMasterEntity(mm);
                list.add(odm2);
            }
            return list;
        } else {
            return null;
        }

    }

    public void remove(orderDetailMasterEntity odm) {
        String sql = "delete from order_detail_master where order_detail_id = ?";
        db.add(sql, odm.getOrderDetailId());
    }

    public void update(orderDetailMasterEntity odm) {
        String sql = " update order_detail_master odm "+
                     " join product_detail_master pdm on pdm.product_detail_id = odm.product_detail_id "+
                     " join order_header_master ohm on odm.order_id = ohm.order_id and odm.order_detail_id = ? "+
                     " left join sale_discount_h_master sdh on sdh.discount_id = pdm.discount_id "+
                     " left join sale_discount_d_master sdd on sdd.discount_id = pdm.discount_id "+
                     " set odm.product_volumn = ?,product_amount = (?*odm.product_cost), "+
                     " odm.discount_price = "+
                     " (case when discount_type = 'R' and (? between discount_from and discount_to) then (?*odm.product_cost*sdd.discount/100) "+
                     "      when discount_type = 'B' and (? between discount_from and discount_to) then (sdd.discount) "+
                     "      else 0  end), "+
                     " odm.free_volumn = "+
                     " (case when discount_type = 'P' and sdd.sales_volumn <= ? then (? div sdd.sales_volumn) "+
                     "       else 0 end ), "+
                     " odm.discount_text ="+
                     " (case when discount_type = 'R' and (? between discount_from and discount_to) then concat('ลด ',(sdd.discount),' %') "+
                     "       when discount_type = 'B' and (? between discount_from and discount_to) then concat('ลด ',(sdd.discount),' บาท') "+
                     "       when discount_type = 'P' and sdd.sales_volumn <= ? then concat('แถม ',(? div sdd.sales_volumn)) "+
                     "       else '' end)";
        db.add(sql, odm.getOrderDetailId(),
                odm.getProductVolumn(),odm.getProductVolumn(),odm.getProductVolumn(),
                odm.getProductVolumn(),odm.getProductVolumn(),odm.getProductVolumn(),
                odm.getProductVolumn(),odm.getProductVolumn(),odm.getProductVolumn(),
                odm.getProductVolumn(),odm.getProductVolumn());
    }
}
