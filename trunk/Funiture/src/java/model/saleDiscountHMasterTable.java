/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import model.entity.saleDiscountHMasterEntity;

/**
 *
 * @author nporn
 */
public class saleDiscountHMasterTable {
  private Database db;

    public saleDiscountHMasterTable(Database db) {
        this.db = db;
    }

   
    public void add(saleDiscountHMasterEntity sdh){
        String sql="insert into sale_discount_h_master "
                + "(Company_Id,Discount_Id,Discount_Type,Discount_Name_T,"
                + "Discount_Name_E,"
                + "Create_date,User_Id) "
                + "values(?,?,?,?,?,?,?,?)";
        db.add(sql,
                sdh.getCompanyId(),
                sdh.getDiscountId(),
                sdh.getDiscountType(),
                sdh.getDiscountNameT(),
                sdh.getDiscountNameE(),
                sdh.getCreateDate(),
                sdh.getUserId());
    }
    public void update(saleDiscountHMasterEntity sdh){
        String sql="update sale_discount_h_master set Company_Id = ?,"
                + "Discount_Type = ?,Discount_Name_T = ?,"
                + "Discount_Name_E = ?,"
                + "Update_date = ?"
                + "where discount_Id = ? ";
        db.add(sql,
                sdh.getCompanyId(),
                sdh.getDiscountType(),
                sdh.getDiscountNameT(),
                sdh.getDiscountNameE(),
                sdh.getUpdateDate(),
                sdh.getDiscountId());
    }
}
