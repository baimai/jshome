/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import java.util.Map;
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

        String sql = "insert into stock_master (Company_Id,Product_Detail_id,quantity,Receive_Date,Create_date,User_id,Unit_Id) "
                   + "value (?,?,?,?,?,?,?)";
        db.add(sql, sb.getCompanyId(),
                sb.getProductDetailId(),
                sb.getQuantity(),
                sb.getReceiveDate(),
                sb.getCreateDate(), 
                sb.getUserId(),
                sb.getUnitId());


    }

    public void update(stockMasterEntity sb) {
        String sql = "update stock_master set quantity = ?,update_date = ?,Receive_Date = ? where product_detail_id = ?";
        db.add(sql, sb.getQuantity(),sb.getUpdateDate(),sb.getReceiveDate(), sb.getProductDetailId());
    }

    public Boolean getAvailable(stockMasterEntity sm) {
        String sql = "select * from stock_master where product_detail_id = ? and company_id = ?";
        List<Map<String, Object>> result = db.queryList(sql,sm.getProductDetailId(),sm.getCompanyId());
        if (!result.isEmpty()) {
            return true;
        } else {
            return false;
        }

    }
    public void save(stockMasterEntity sb){
        String sql = "insert into stock_master (Company_Id,Product_Detail_id,quantity,Receive_Date,Create_date,User_id,Unit_Id) "
                   + "value (?,?,?,?,?,?,?)";
        db.add(sql, sb.getCompanyId(),
                sb.getProductDetailId(),
                sb.getQuantity(),
                sb.getReceiveDate(),
                sb.getCreateDate(),
                sb.getUserId(),
                sb.getUnitId());

    }
    
}
