/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import model.entity.stockMasterEntity;

/**
 *
 * @author Achilles
 */
public class stockMasterTable {

    private Database db;

    public stockMasterTable(Database db) {
        this.db = db;
    }

    public void add(stockMasterEntity sb) {
        String sql = "insert into stock_master (Company_Id,Product_Detail_id,quantity,Create_date,Update_date,User_id,Unit_Id) "
                + "value (?,?,?,?,?,?,?)";
        db.add(sql, sb.getCompanyId(), sb.getProductDetailId(), sb.getQuantity(),
                sb.getCreateDate(), sb.getUpdateDate(), sb.getUserId(), sb.getUnitId());
    }

    public void update(stockMasterEntity sb) {
        String sql = "update stock_master set quantity = ?,update_date = ? where product_detail_id = ?";
        db.add(sql, sb.getQuantity(), sb.getProductDetailId());
    }
}
