/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
                + " join product_detail_master pdm on pdm.product_detail_Id = odm.product_detail_id "
                + " where odm.order_id = ? ";
        List<Map<String, Object>> result = db.queryList(sql, orderId);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                pdm.setProductDNameE(Default.Str(result.get(i).get("Product_D_Name_E")));
                pdm.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                orderDetailMasterEntity odm2 = new orderDetailMasterEntity();
                odm2.setOrderId((Integer) result.get(i).get("Order_Id"));
                odm2.setProductDetailId((Integer) result.get(i).get("Product_Detail_Id"));
                odm2.setProductVolumn((Integer) result.get(i).get("Product_Volumn"));
                odm2.setProductCost(Default.BigDecimal(result.get(i).get("Product_Cost")));
                odm2.setProductAmount(Default.BigDecimal(result.get(i).get("Product_Amount")));
                odm2.setProductDetailMasterEntity(pdm);
                list.add(odm2);
            }
            return list;
        } else {
            return null;
        }

    }
}
