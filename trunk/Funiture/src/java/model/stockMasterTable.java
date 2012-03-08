/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.stockMasterEntity;
import util.Column;
import util.Default;
import util.Operation;

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
        String sql = "update stock_master set quantity = quantity+?,update_date = ?,Receive_Date = ? where product_detail_id = ?";
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
    public ArrayList search(String sField, String sValue, String sOper) {
        String sql = "SELECT * FROM color_code_master cm";

        if (sOper != null && sValue != null & sField != null) {
            sql = sql +" where "+ Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                stockMasterEntity sm = new stockMasterEntity();
               
                sm.setProductDetailId((Integer) result.get(i).get("Product_Detail_id"));
                sm.setUnitId((Integer) result.get(i).get("Unit_Id"));
                sm.setCompanyId((Integer) result.get(i).get("Company_Id"));
                sm.setQuantity((Integer) result.get(i).get("quantity"));
                sm.setReceiveDate(Timestamp.valueOf("Receive_Date"));
                sm.setStockId((Integer) result.get(i).get("Stock_Id"));
                list.add(sm);
            }
            return list;
        } else {
            return null;
        }

    }
    
}
