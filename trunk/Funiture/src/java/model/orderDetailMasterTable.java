/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import model.entity.orderDetailMasterEntity;

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
                + "(Company_Id, Order_Id, Product_Detail_Id, Product_Volumn, Product_Cost, Product_Amount, Create_Date, User_Id, Shipping_Cost)"
                + "values (?,?,?,?,?,?,?,?,?)";
        db.add(sql, odm.getCompanyId(),
                odm.getOrderId(),
                odm.getProductDetailI(),
                odm.getProductVolumn(),
                odm.getProductCost(),
                odm.getProductAmount(),
                odm.getCreateDate(),
                odm.getUserId(),
                odm.getShippingCost());
    }
}
