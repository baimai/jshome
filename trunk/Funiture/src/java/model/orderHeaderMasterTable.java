/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import model.entity.memberMasterEntity;
import model.entity.orderHeaderMasterEntity;
import util.Column;
import util.Default;
import util.Operation;

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

    public ArrayList search(String sField, String sValue, String sOper,orderHeaderMasterEntity ohm) {
        String sql = " SELECT * FROM order_header_master ohm "
                    + " join member_master mm on ohm.member_Id = mm.member_Id"+
                     " where ohm.Company_Id = ?";
        if(ohm.getOrderStatus()!=null&&!ohm.getOrderStatus().equals("")){
            sql = sql + " and ohm.order_status = '"+ohm.getOrderStatus()+"' ";
        }
        if (sOper != null && sValue != null & sField != null) {
            sql = sql +" and "+ Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        List<Map<String, Object>> result = db.queryList(sql,ohm.getCompanyId());
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                memberMasterEntity mm = new memberMasterEntity();
                mm.setMemberName(Default.Str(result.get(i).get("Member_Name")));
                mm.setMemberSurName(Default.Str(result.get(i).get("Member_SurName")));
               orderHeaderMasterEntity ohm2 = new orderHeaderMasterEntity();
                ohm2.setOrderDate((Timestamp) result.get(i).get("Order_Date"));
                ohm2.setMemberMasterEntity(mm);
                ohm2.setOrderId((Integer)result.get(i).get("Order_Id"));
                ohm2.setOrderStatus(Default.Str(result.get(i).get("Order_Status")));
                list.add(ohm2);
            }
            return list;
        } else {
            return null;
        }

    }
    public void updateStatus(orderHeaderMasterEntity ohm){
        String sql = "update order_header_master ohm set ohm.order_status = ?,ohm.update_date = ? where ohm.order_id = ?";
        db.add(sql,ohm.getOrderStatus(),ohm.getUpdateDate(),ohm.getOrderId());

    }
}