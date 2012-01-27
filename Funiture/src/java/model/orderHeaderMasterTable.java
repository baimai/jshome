/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import java.util.Map;
import model.entity.orderHeaderMasterEntity;

/**
 *
 * @author Achilles
 */
public class orderHeaderMasterTable {

    private Database db;

    public orderHeaderMasterTable(Database db) {
        this.db = db;
    }

    public Integer add(orderHeaderMasterEntity ohm) {
        int i=0;
        String sql = "insert into order_header_master"
                + "(Company_Id,Member_Id,Order_Date,Order_Status,Create_Date,User_Id,Total_Amount,Shipping_Cost)"
                + "values (?,?,?,?,?,?,?,?)";
        i = db.add(sql, ohm.getCompanyId(),
                ohm.getMemberId(),
                ohm.getOrderDate(),
                ohm.getOrderStatus(),
                ohm.getCreateDate(),
                ohm.getUserId(),
                ohm.getTotalAmount(),
                ohm.getShippingCost());
        return i;
    }
    public Integer getOrderId(orderHeaderMasterEntity ohm,int Company_Id) {
        String sql = "select * from order_header_master where Member_Id = ? and Company_Id = ? and Order_Date = ?";
        List<Map<String, Object>> result = db.queryList(sql, ohm.getMemberId(),ohm.getCompanyId(),ohm.getOrderDate());
        if (!result.isEmpty()) {
            return (Integer) result.get(0).get("Order_Id");
        } else {
            return 0;
        }
    }
}
