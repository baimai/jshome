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
import util.Default;

/**
 *
 * @author Achilles
 */
public class menuProductSetupTable {

    private Database db;

    public menuProductSetupTable(Database db) {
        this.db = db;
    }

    public void add(menuProductSetup mps) {
        String sql = "insert into menu_product_setup values(?,?,?,?,?,?,?)";
        db.add(sql, mps.getMenuCode(), mps.getProductCode(), mps.getProductRemarkT(), mps.getProductRemarkE(),
                Timestamp.valueOf(db.getNow()), mps.getUpdateDate(), mps.getUserId());
    }

    public void update(menuProductSetup mps) {
        String sql = "update menu_product_setup set Menu_Code = ?,Product_Code = ?,Product_remark_T = ?,Product_remark_E = ?,"
                + " Update_Date = ?,User_Id = ? "
                + " where Product_Code = ? and Menu_Code = ?";
        db.update(sql, mps.getMenuCode(), mps.getProductCode(), mps.getProductRemarkT(), mps.getProductRemarkE(),
                 Timestamp.valueOf(db.getNow()), mps.getUserId(), mps.getProductCode(), mps.getMenuCode());
    }
    
    public void remove(menuProductSetup mps) {
        String sql = "delete from menu_product_setup where menu_code = ? and product_code = ?";
        db.update(sql, mps.getMenuCode(), mps.getProductCode());
    }

    public ArrayList search(String sField, String sValue,String sOper,String productCode) {
        String sql = "SELECT * FROM menu_product_setup where product_code like '%"+Default.Str(productCode) +"%'";
        
        if(sOper!=null&&sValue!=null&sField!=null){
            if(sField.equals("menuCode")){
                sField = "Menu_Code";
            }else if(sField.equals("productCode")){
                sField = "Product_Code";
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
            sql = "SELECT * FROM menu_product_setup where "+sField+sOper+" and product_code like '%"+Default.Str(productCode) +"%'";
        }
        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (result != null) {
            for (int i = 0; i < result.size(); i++) {
                menuProductSetup mps = new menuProductSetup();
                mps.setMenuCode(Default.Str(result.get(i).get("Menu_Code")));
                mps.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                mps.setProductRemarkT(Default.Str(result.get(i).get("Product_Remark_T")));
                mps.setProductRemarkE(Default.Str(result.get(i).get("Product_Remark_E")));
                mps.setCreateDate((Timestamp)result.get(i).get("Create_Date"));
                mps.setUpdateDate((Timestamp)result.get(i).get("Update_Date"));
                mps.setUserId(Default.Str(result.get(i).get("User_Id")));
                list.add(mps);
            }
            return list;
        } else {
            return null;
        }

    }
}
