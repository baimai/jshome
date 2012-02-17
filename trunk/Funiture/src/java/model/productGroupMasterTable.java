/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.productGroupMasterEntity;
import util.Column;
import util.Default;
import util.Operation;

/**
 *
 * @author Achilles
 */
public class productGroupMasterTable {

    private Database db;

    public productGroupMasterTable(Database db) {
        this.db = db;
    }

    public void add(productGroupMasterEntity pgm) {
        String sql = "insert into product_group_master "
                + "( Company_Id,Product_Group_Code,Product_G_Name_T,Product_G_Name_E,Product_Pic_Loc,Product_Icon_Loc,"
                + "  Product_Remark_T,Product_Remark_E,Product_G_Display_Flag,Create_Date,User_Id )"
                + "  values(?,?,?,?,?,?,?,?,?,?,?)";

        db.add(sql,
                pgm.getCompanyId(),
                pgm.getProductGroupCode(),
                pgm.getProductGNameT(),
                pgm.getProductGNameE(),
                pgm.getProductPicLoc(),
                pgm.getProductIconLoc(),
                pgm.getProductRemarkT(),
                pgm.getProductRemarkE(),
                pgm.getProductGDisplayFlag(),
                pgm.getCreateDate(),
                pgm.getUserId());
    }

    public void update(productGroupMasterEntity pgm) {
        String sql = "update product_group_master set Product_Group_Code = ?,Company_Id = ?,"
                + " Product_G_Name_T = ?,Product_G_Name_E = ?,"
                + " Product_Pic_Loc = ?,Product_Icon_Loc = ?,"
                + " Product_Remark_T = ?,Product_Remark_E = ?,Product_G_Display_Flag = ?,"
                + " Update_Date = ? "
                + " where Product_Group_Id = ? ";
        db.add(sql,
                pgm.getProductGroupCode(),
                pgm.getCompanyId(),
                pgm.getProductGNameT(),
                pgm.getProductGNameE(),
                pgm.getProductPicLoc(),
                pgm.getProductIconLoc(),
                pgm.getProductRemarkT(),
                pgm.getProductRemarkE(),
                pgm.getProductGDisplayFlag(),
                pgm.getUpdateDate(),
                pgm.getProductGroupId());
    }
    public void remove(productGroupMasterEntity pgm){
        String sql = "delete from product_group_master where product_group_id = ?";
        db.remove(sql, pgm.getProductGroupId());
    }

    public ArrayList search(String sField, String sValue, String sOper,int Company_Id) {
        String sql = "SELECT * FROM product_group_master pgm"+
                     " join Company_Master cm on cm.Company_Id = pgm.Company_Id"+
                     " where cm.Company_Id = ? ";

        if (sOper != null && sValue != null & sField != null) {
            sql = sql +" and "+ Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        List<Map<String, Object>> result = db.queryList(sql,Company_Id);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                productGroupMasterEntity pgm = new productGroupMasterEntity();
                pgm.setProductGroupCode(Default.Str(result.get(i).get("Product_Group_Code")));
                pgm.setProductGNameT(Default.Str(result.get(i).get("Product_G_Name_T")));
                pgm.setProductGNameE(Default.Str(result.get(i).get("Product_G_Name_E")));
                pgm.setProductRemarkT(Default.Str(result.get(i).get("Product_Remark_T")));
                pgm.setProductRemarkE(Default.Str(result.get(i).get("Product_Remark_E")));
                pgm.setProductGDisplayFlag(Default.Str(result.get(i).get("Product_G_Display_Flag")));
                pgm.setProductGroupId((Integer)result.get(i).get("Product_Group_Id"));
                pgm.setCompanyCode(Default.Str(result.get(i).get("Company_Code")));
                list.add(pgm);
            }
            return list;
        } else {
            return null;
        }

    }
}
