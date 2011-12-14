/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.productDetailMaster;
import util.Default;

/**
 *
 * @author Achilles
 */
public class productDetailMasterTable {

    private Database db;

    public productDetailMasterTable(Database db) {
        this.db = db;
    }

    public void add(productDetailMaster pdm) {
        String sql = "insert into product_detail_master values("
                + "?,?,?,?,?,?,?,?,?,?,"
                + "?,?,?,?,?,?,?,?,?,?,"
                + "?,?,?,?,?,?,?,?"
                + ")";
        db.add(sql,
                pdm.getProductGroup(),
                pdm.getProductCode(),
                pdm.getProductDNameT(),
                pdm.getProductDNameE(),
                pdm.getProductPrice1(),
                pdm.getProductPrice2(),
                pdm.getProductPrice3(),
                pdm.getProductSpect1_T(),
                pdm.getProductSpect2_T(),
                pdm.getProductSpect3_T(),
                pdm.getProductSpect4_T(),
                pdm.getProductSpect5_T(),
                pdm.getProductSpect6_T(),
                pdm.getProductSpect1_E(),
                pdm.getProductSpect2_E(),
                pdm.getProductSpect3_E(),
                pdm.getProductSpect4_E(),
                pdm.getProductSpect5_E(),
                pdm.getProductSpect6_E(),
                pdm.getProductDLink(),
                pdm.getProductDLogo(),
                pdm.getProductDIcon(),
                pdm.getProductDRemarkT(),
                pdm.getProductDRemarkE(),
                pdm.isProductDDisplayFlag(),
                pdm.getCreateDate(),
                pdm.getUpdtaeDate(),
                pdm.getUserId());
    }

    public void update(productDetailMaster pdm) {
        String sql = "update product_detail_master set Product_Group = ?,Product_Code = ?,"
                + "Product_D_Name_T = ?,Product_D_Name_E = ?,"
                + "Product_Price1 = ?,Product_Price2 = ?,Product_Price3 = ?,"
                + "Product_Spec1_T = ?,Product_Spec2_T = ?,Product_Spec3_T = ?,"
                + "Product_Spec4_T = ?,Product_Spec5_T = ?,Product_Spec6_T = ?,"
                + "Product_Spec1_E = ?,Product_Spec2_E = ?,Product_Spec3_E = ?,"
                + "Product_Spec4_E = ?,Product_Spec5_E = ?,Product_Spec6_E = ?,"
                + "Product_D_Link = ?,Product_D_Logo = ?,Product_D_Icon = ?,"
                + "Product_D_Remark_T = ?,Product_D_Remark_E = ?,Product_D_Display_flag = ?,"
                + "Create_date = ?,Updtae_date = ?,User_Id = ?"
                + " where User_Id = ? ";
        db.add(sql,
                pdm.getProductGroup(),
                pdm.getProductCode(),
                pdm.getProductDNameT(),
                pdm.getProductDNameE(),
                pdm.getProductPrice1(),
                pdm.getProductPrice2(),
                pdm.getProductPrice3(),
                pdm.getProductSpect1_T(),
                pdm.getProductSpect2_T(),
                pdm.getProductSpect3_T(),
                pdm.getProductSpect4_T(),
                pdm.getProductSpect5_T(),
                pdm.getProductSpect6_T(),
                pdm.getProductSpect1_E(),
                pdm.getProductSpect2_E(),
                pdm.getProductSpect3_E(),
                pdm.getProductSpect4_E(),
                pdm.getProductSpect5_E(),
                pdm.getProductSpect6_E(),
                pdm.getProductDLink(),
                pdm.getProductDLogo(),
                pdm.getProductDIcon(),
                pdm.getProductDRemarkT(),
                pdm.getProductDRemarkE(),
                pdm.isProductDDisplayFlag(),
                pdm.getCreateDate(),
                pdm.getUpdtaeDate(),
                pdm.getUserId());
    }

    public ArrayList search(String productCode,String productGroup) {
        String sql = "SELECT * FROM product_detail_master where Product_Code like '%"+Default.Str(productCode)+"%' and Product_Group like '%"+Default.Str(productGroup)+"%'";
        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (result != null) {
            for (int i = 0; i < result.size(); i++) {
                productDetailMaster pdm = new productDetailMaster();
                pdm.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                pdm.setProductDLogo(Default.Str(result.get(i).get("Product_D_Logo")));
                pdm.setProductGroup(Default.Str(result.get(i).get("Product_Group")));
                pdm.setProductDNameT(Default.Str(result.get(i).get("Product_D_Name_T")));
                pdm.setProductDNameE(Default.Str((result.get(i).get("Product_D_Name_E"))) );
                pdm.setProductPrice1(Default.BigDecimal(result.get(i).get("Product_Price1")));
                pdm.setProductPrice2(Default.BigDecimal(result.get(i).get("Product_Price2")));
                pdm.setProductPrice3(Default.BigDecimal(result.get(i).get("Product_Price3")));
                pdm.setProductSpect1_T(Default.Str(result.get(i).get("Product_Spec1_T")));
                pdm.setProductSpect2_T(Default.Str(result.get(i).get("Product_Spec2_T")));
                pdm.setProductSpect3_T(Default.Str(result.get(i).get("Product_Spec3_T")));
                pdm.setProductSpect4_T(Default.Str(result.get(i).get("Product_Spec4_T")));
                pdm.setProductSpect5_T(Default.Str(result.get(i).get("Product_Spec5_T")));
                pdm.setProductSpect6_T(Default.Str(result.get(i).get("Product_Spec6_T")));
                pdm.setProductSpect1_E(Default.Str(result.get(i).get("Product_Spec1_E")));
                pdm.setProductSpect2_E(Default.Str(result.get(i).get("Product_Spec2_E")));
                pdm.setProductSpect3_E(Default.Str(result.get(i).get("Product_Spec3_E")));
                pdm.setProductSpect4_E(Default.Str(result.get(i).get("Product_Spec4_E")));
                pdm.setProductSpect5_E(Default.Str(result.get(i).get("Product_Spec5_E")));
                pdm.setProductSpect6_E(Default.Str(result.get(i).get("Product_Spec6_E")));
                pdm.setProductDRemarkT(Default.Str(result.get(i).get("Product_D_Remark_T")));
                pdm.setProductDRemarkE(Default.Str(result.get(i).get("Product_D_Remark_E")));
                pdm.setUserId(Default.Str(result.get(i).get("User_Id")));
                
                list.add(pdm);
            }
            return list;
        } else {
            return null;
        }

    }
}