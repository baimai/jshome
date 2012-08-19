/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.productDetailMasterEntity;
import model.entity.productGroupMasterEntity;
import model.entity.stockMasterEntity;
import model.entity.unitMasterEntity;
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

    public void remove(stockMasterEntity sb) {
        String sql = "delete from stock_master where stock_id = ?";
        db.remove(sql, sb.getStockId());
    }

    public void update(stockMasterEntity sb) {
        String sql = "update stock_master set quantity = quantity+?,update_date = ?,Receive_Date = ?,User_Id = ? where product_detail_id = ?";
        db.add(sql, sb.getQuantity(), sb.getUpdateDate(), sb.getReceiveDate(), sb.getUserId(), sb.getProductDetailId());
    }

    public Boolean getAvailable(stockMasterEntity sm) {
        String sql = "select * from stock_master where product_detail_id = ? and company_id = ?";
        List<Map<String, Object>> result = db.queryList(sql, sm.getProductDetailId(), sm.getCompanyId());
        return !result.isEmpty() ? true : false;
    }

    public void save(stockMasterEntity sb) {
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

    public ArrayList searchAll() {
        String sql = "SELECT stock_master.Stock_Id, "
                + " stock_master.Receive_Date,"
                + "  product_detail_master.Product_Code,"
                + "  product_detail_master.Product_D_Name_T, "
                + "  product_group_master.Product_G_Name_T,"
                + " stock_master.Quantity, "
                + " unit_master.unit_name_t"
                + "  FROM stock_master "
                + "  LEFT JOIN product_detail_master"
                + "  ON stock_master.Product_Detail_Id = product_detail_master.Product_Detail_Id"
                + " LEFT JOIN product_group_master "
                + " ON product_detail_master.Product_Group_Id =  product_group_master.Product_Group_Id"
                + " LEFT JOIN unit_master "
                + " ON stock_master.Unit_Id = unit_master.unit_id";


        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                stockMasterEntity sm = new stockMasterEntity();
                productDetailMasterEntity pd = new productDetailMasterEntity();
                productGroupMasterEntity pg = new productGroupMasterEntity();
                unitMasterEntity un = new unitMasterEntity();
                sm.setStockId((Integer) result.get(i).get("Stock_Id"));
                sm.setReceiveDate((Date) result.get(i).get("Receive_Date"));
                pd.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                pd.setProductDNameT(Default.Str(result.get(i).get("Product_D_Name_T")));
                pg.setProductGNameT(Default.Str(result.get(i).get("Product_G_Name_T")));
                sm.setQuantity((Integer) result.get(i).get("Quantity"));
                un.setUnitNameT(Default.Str(result.get(i).get("unit_name_t")));
                sm.setUnitMasterEntity(un);
                sm.setProductDetailMasterEntity(pd);
                sm.setProductGroupMasterEntity(pg);
                list.add(sm);

            }

            return list;
        } else {
            return null;
        }

    }

    public ArrayList search(String productGroupId, int Company_Id, int start, int limit) {
        List<Map<String, Object>> result = null;
        String sql = "SELECT stock_master.Stock_Id, "
                + " stock_master.Receive_Date,"
                + "  product_detail_master.Product_Code,"
                + "  product_detail_master.Product_D_Name_T, "
                + "  product_group_master.Product_G_Name_T,"
                + " stock_master.Quantity, "
                + " unit_master.unit_name_t"
                + "  FROM stock_master "
                + "  LEFT JOIN product_detail_master"
                + "  ON stock_master.Product_Detail_Id = product_detail_master.Product_Detail_Id"
                + " LEFT JOIN product_group_master "
                + " ON product_detail_master.Product_Group_Id =  product_group_master.Product_Group_Id"
                + " LEFT JOIN unit_master "
                + " ON stock_master.Unit_Id = unit_master.unit_id"
                + " where stock_master.Company_Id=?";

        if (productGroupId == null) {
            sql = sql + " LIMIT ?,? ";
            result = db.queryList(sql, Company_Id, start, limit);
        } else {
            sql = sql + " and  stock_master.Product_Group_Id = ? ";
            sql = sql + " LIMIT ?,? ";
            result = db.queryList(sql, Company_Id, productGroupId, start, limit);
        }
System.out.println("sql>>>>"+sql);System.out.println("productGroupId>>>>"+productGroupId);

        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                stockMasterEntity sm = new stockMasterEntity();
                productDetailMasterEntity pd = new productDetailMasterEntity();
                productGroupMasterEntity pg = new productGroupMasterEntity();
                unitMasterEntity un = new unitMasterEntity();
                sm.setStockId((Integer) result.get(i).get("Stock_Id"));
                sm.setReceiveDate((Date) result.get(i).get("Receive_Date"));
                pd.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                pd.setProductDNameT(Default.Str(result.get(i).get("Product_D_Name_T")));
                pg.setProductGNameT(Default.Str(result.get(i).get("Product_G_Name_T")));
                sm.setQuantity((Integer) result.get(i).get("Quantity"));
                un.setUnitNameT(Default.Str(result.get(i).get("unit_name_t")));
                sm.setUnitMasterEntity(un);
                sm.setProductDetailMasterEntity(pd);
                sm.setProductGroupMasterEntity(pg);

                list.add(sm);

            }

            return list;

        } else {
            return null;
        }

    }
     public Integer countAll(int company_id) {
        String sql = " SELECT count(*) as COUNT FROM stock_master sm where sm.Company_Id = ? ";
       System.out.println(sql);
       System.out.println(company_id);
        List<Map<String, Object>> result = db.queryList(sql, company_id);
        return !result.isEmpty()?Integer.valueOf(result.get(0).get("COUNT").toString()):0;
    }
}
