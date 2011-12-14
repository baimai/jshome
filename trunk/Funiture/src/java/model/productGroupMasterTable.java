/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.menuProductSetup;
import model.entity.productGroupMaster;
import util.Default;

/**
 *
 * @author Achilles
 */
public class productGroupMasterTable {
    private Database db;

    public productGroupMasterTable(Database db) {
        this.db = db;
    }

    public void add(productGroupMaster pgm) {
        String sql = "insert into product_group_master values("
                + "?,?,?,?,?,?,?,?,?,?,"
                + "?,?"
                + ")";
        db.add(sql,
               pgm.getProductGroup(),
               pgm.getProductGNameT(),
               pgm.getProductGNameE(),
               pgm.getProductLink(),
               pgm.getProductLogo(),
               pgm.getProductIcon(),
               pgm.getProductRemarkT(),
               pgm.getProductRemarkE(),
               pgm.isProductGDisplayFlag(),
               pgm.getCreateDate(),
               pgm.getUpdateDate(),
               pgm.getUserId());
    }

    public void update(productGroupMaster pgm) {
        String sql = "update product_group_master set Product_Group = ?,"
                + "Product_G_Name_T = ?,Product_G_Name_E = ?,"
                + "Product_Link = ?,Product_Logo = ?,Product_Icon = ?,"
                + "Product_Remark_T = ?,Product_Remark_E = ?,Product_G_Display_Flag = ?,"
                + "Create_date = ?,Update_Date = ?,User_Id = ?"
                + " where Product_Group = ? ";
        db.add(sql,
               pgm.getProductGroup(),
               pgm.getProductGNameT(),
               pgm.getProductGNameE(),
               pgm.getProductLink(),
               pgm.getProductLogo(),
               pgm.getProductIcon(),
               pgm.getProductRemarkT(),
               pgm.getProductRemarkE(),
               pgm.isProductGDisplayFlag(),
               pgm.getCreateDate(),
               pgm.getUpdateDate(),
               pgm.getUserId(),
               pgm.getProductGroup());
    }
    public ArrayList search(String sField, String sValue,String sOper,String productGroup) {
        String sql = "SELECT * FROM product_group_master where product_group like '%"+Default.Str(productGroup) +"%'";
        
        if(sOper!=null&&sValue!=null&sField!=null){
            if(sField.equals("productGroup")){
                sField = "Product_Group";
            }else if(sField.equals("productGNameT")){
                sField = "Product_G_Name_T";
            }else if(sField.equals("productGNameE")){
                sField = "Product_G_Name_E";
            }else if(sField.equals("productRemarkT")){
                sField = "Product_Remark_T";
            }else if(sField.equals("productRemarkE")){
                sField = "Product_Remark_E";
            }else if(sField.equals("createDate")){
                sField = "Create_Date";
            }else if(sField.equals("updateDate")){
                sField = "Update_Date";
            }else if(sField.equals("userId")){
                sField = "User_Id";
            }
            
            
            if(sOper.equals("eq")){
                sOper = " like '"+sValue+"'";
            }else if(sOper.equals("ne")){
                sOper = " not like '"+sValue+"'";
            }else if(sOper.equals("bw")){
                sOper = " LIKE '"+sValue+"%'";
            }else if(sOper.equals("bn")){
                sOper = " NOT LIKE '"+sValue+"%'";
            }else if(sOper.equals("ew")){
                sOper = " LIKE '%"+sValue+"'";
            }else if(sOper.equals("en")){
                sOper = " NOT LIKE '%"+sValue+"'";
            }else if(sOper.equals("cn")){
                sOper = " LIKE '%"+sValue+"%'";
            }else if(sOper.equals("nc")){
                sOper = " NOT LIKE '%"+sValue+"%'";
            }else if(sOper.equals("in")){
                sOper = " IN ('"+sValue+"')";
            }else if(sOper.equals("ni")){
                sOper = " NOT IN ('"+sValue+"')";
            }else if (sOper.equals("nu")){
                sOper = " IS NULL";
            }else if (sOper.equals("nn")){
                sOper = " IS NOT NULL";
            }
            sql = "SELECT * FROM product_group_master where "+sField+sOper+" and product_Group like '%"+Default.Str(productGroup) +"%'";
        }
        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (result != null) {
            for (int i = 0; i < result.size(); i++) {
                productGroupMaster pgm = new productGroupMaster();
                pgm.setProductGroup(Default.Str(result.get(i).get("Product_Group")));
                pgm.setProductGNameT(Default.Str(result.get(i).get("Product_G_Name_T")));
                pgm.setProductGNameE(Default.Str(result.get(i).get("Product_G_Name_E")));
                pgm.setProductRemarkT(Default.Str(result.get(i).get("Product_Remark_T")));
                pgm.setProductRemarkE(Default.Str(result.get(i).get("Product_Remark_E")));
                pgm.setCreateDate((Timestamp)result.get(i).get("Create_Date"));
                pgm.setUpdateDate((Timestamp)result.get(i).get("Update_Date"));
                pgm.setUserId(Default.Str(result.get(i).get("User_Id")));
                list.add(pgm);
            }
            return list;
        } else {
            return null;
        }

    }

    
}
