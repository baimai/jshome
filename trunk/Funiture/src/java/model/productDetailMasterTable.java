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
        String sql = "insert into product_detail_master "
                + "(Company_Id,Product_Group_Id,Product_Code,Product_D_Name_T,Product_D_Name_E,"
                + " Product_Price1,Product_Price2,Product_Price3,"
                + " Product_Spec1_T,Product_Spec2_T,Product_Spec3_T,Product_Spec4_T,Product_Spec5_T,Product_Spec6_T,"
                + " Product_Spec1_E,Product_Spec2_E,Product_Spec3_E,Product_Spec4_E,Product_Spec5_E,Product_Spec6_E,"
                + " Product_D_Pic_Loc,Product_D_Icon_Loc,Product_D_Remark_T,Product_D_Remark_E,Product_D_Display_Flag,"
                + " Create_Date,User_Id,Product_Color_Id)"
                + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        db.add(sql,
                pdm.getCompanyId(),
                pdm.getProductGroupId(),
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
                pdm.getProductDPicLoc(),
                pdm.getProductDIconLoc(),
                pdm.getProductDRemarkT(),
                pdm.getProductDRemarkE(),
                pdm.getProductDDisplayFlag(),
                pdm.getCreateDate(),
                pdm.getUserId(),
                pdm.getProductColorId());
    }

    public void update(productDetailMaster pdm) {
        String sql = "update product_detail_master set Company_Id = ?,Product_Group_Id = ?,Product_Code = ?,"
                + "Product_D_Name_T = ?,Product_D_Name_E = ?,"
                + "Product_Price1 = ?,Product_Price2 = ?,Product_Price3 = ?,"
                + "Product_Spec1_T = ?,Product_Spec2_T = ?,Product_Spec3_T = ?,"
                + "Product_Spec4_T = ?,Product_Spec5_T = ?,Product_Spec6_T = ?,"
                + "Product_Spec1_E = ?,Product_Spec2_E = ?,Product_Spec3_E = ?,"
                + "Product_Spec4_E = ?,Product_Spec5_E = ?,Product_Spec6_E = ?,"
                + "Product_D_Pic_Loc = ?,Product_D_Icon_Loc = ?,"
                + "Product_D_Remark_T = ?,Product_D_Remark_E = ?,Product_D_Display_Flag = ?,"
                + "Updtae_date = ?,Product_Color_Id = ? "
                + "where Product_Detail_Id = ? ";
        db.add(sql,
                pdm.getCompanyId(),
                pdm.getProductGroupId(),
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
                pdm.getProductDPicLoc(),
                pdm.getProductDIconLoc(),
                pdm.getProductDRemarkT(),
                pdm.getProductDRemarkE(),
                pdm.getProductDDisplayFlag(),
                pdm.getUpdtaeDate(),
                pdm.getProductColorId(),
                pdm.getProductDetailId());
    }

    public ArrayList search(String productCode, String productGroupCode) {
        String sql = "SELECT * FROM product_detail_master pdm"
                + " join product_group_master pgm on pgm.Product_Group_Id = pdm.Product_Group_Id "
                + " where pdm.Product_Code like '%" + Default.Str(productCode) + "%' and pgm.Product_Group_Code like '%" + Default.Str(productGroupCode) + "%'";
        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (result != null) {
            for (int i = 0; i < result.size(); i++) {
                productDetailMaster pdm = new productDetailMaster();
                pdm.setCompanyId((int)(result.get(i).get("Company_Id")));
                pdm.setProductGroupId((int)result.get(i).get("Product_Group_Id"));
                pdm.setProductCode(Default.Str(result.get(i).get("Product_Code")));                            
                pdm.setProductDNameT(Default.Str(result.get(i).get("Product_D_Name_T")));
                pdm.setProductDNameE(Default.Str((result.get(i).get("Product_D_Name_E"))));
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
                pdm.setProductDPicLoc(Default.Str(result.get(i).get("Product_D_Pic_Loc")));
                pdm.setProductDIconLoc(Default.Str(result.get(i).get("Product_D_Icon_Loc")));
                pdm.setProductDRemarkT(Default.Str(result.get(i).get("Product_D_Remark_T")));
                pdm.setProductDRemarkE(Default.Str(result.get(i).get("Product_D_Remark_E")));
                pdm.setProductDDisplayFlag(Default.Str(result.get(i).get("Product_D_Display_Flag")));
                pdm.setUserId(Default.Str(result.get(i).get("User_Id")));
                pdm.setProductDetailId((int)result.get(i).get("Product_Detail_Id"));
                pdm.setProductColorId((int)result.get(i).get("Product_Color_Id"));

                list.add(pdm);
            }
            return list;
        } else {
            return null;
        }

    }

    public int getProductId(String productCode) {
        String sql = "select * from product_detail_master where Product_Code = ?";
        List<Map<String, Object>> result = db.queryList(sql, productCode);
        if (result != null) {
            return (int) result.get(0).get("Product_Detail_Id");
        } else {
            return 0;
        }

    }
}