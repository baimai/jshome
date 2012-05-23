/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.productDetailMasterEntity;
import model.entity.productGroupMasterEntity;
import model.entity.saleDiscountDMasterEntity;
import model.entity.saleDiscountHMasterEntity;
import model.entity.stockBalanceEntity;
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

    public void add(productDetailMasterEntity pdm) {
        String sql = "insert into product_detail_master "
                + "(Company_Id,Product_Group_Id,Product_Code,Product_D_Name_T,Product_D_Name_E,"
                + " Product_Price1,Product_Price2,Product_Price3,Product_Price4,"
                + " Product_Spec1_T,Product_Spec2_T,Product_Spec3_T,Product_Spec4_T,Product_Spec5_T,Product_Spec6_T,"
                + " Product_Spec1_E,Product_Spec2_E,Product_Spec3_E,Product_Spec4_E,Product_Spec5_E,Product_Spec6_E,"
                + " Product_D_Pic_Loc,Product_D_Icon_Loc,Product_D_Remark_T,Product_D_Remark_E,Product_D_Display_Flag,"
                + " Create_Date,User_Id,Product_Color_Id,product_Model_Code,product_Max_Sale)"
                + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        db.add(sql,
                pdm.getCompanyId(),
                pdm.getProductGroupId(),
                pdm.getProductCode(),
                pdm.getProductDNameT(),
                pdm.getProductDNameE(),
                pdm.getProductPrice1(),
                pdm.getProductPrice2(),
                pdm.getProductPrice3(),
                pdm.getProductPrice4(),
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
                pdm.getProductColorId(),
                pdm.getProductModelCode(),
                pdm.getProductMaxSale());
    }

    public void update(productDetailMasterEntity pdm) {
        String sql = "update product_detail_master set Company_Id = ?,Product_Group_Id = ?,Product_Code = ?,"
                + "Product_D_Name_T = ?,Product_D_Name_E = ?,"
                + "Product_Price1 = ?,Product_Price2 = ?,Product_Price3 = ?,Product_Price4 = ?,"
                + "Product_Spec1_T = ?,Product_Spec2_T = ?,Product_Spec3_T = ?,"
                + "Product_Spec4_T = ?,Product_Spec5_T = ?,Product_Spec6_T = ?,"
                + "Product_Spec1_E = ?,Product_Spec2_E = ?,Product_Spec3_E = ?,"
                + "Product_Spec4_E = ?,Product_Spec5_E = ?,Product_Spec6_E = ?,"
                + "Product_D_Pic_Loc = ?,Product_D_Icon_Loc = ?,"
                + "Product_D_Remark_T = ?,Product_D_Remark_E = ?,Product_D_Display_Flag = ?,"
                + "Update_date = ?,Product_Color_Id = ?,product_model_code = ?,product_max_sale = ? "
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
                pdm.getProductPrice4(),
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
                pdm.getUpdateDate(),
                pdm.getProductColorId(),
                pdm.getProductModelCode(),
                pdm.getProductMaxSale(),
                pdm.getProductDetailId());
    }

    public void remove(productDetailMasterEntity pdm) {
        String sql = "delete from product_detail_master where product_detail_id = ? and company_id = ?";
        db.add(sql, pdm.getProductDetailId(), pdm.getCompanyId());
    }

    public Integer countAll(int company_id) {
        String sql = " SELECT count(*) as COUNT FROM product_detail_master pdm where pdm.Company_Id = ? ";
        List<Map<String, Object>> result = db.queryList(sql, company_id);
        return !result.isEmpty()?Integer.valueOf(result.get(0).get("COUNT").toString()):0;
    }

    public ArrayList search(String productGroupId, int Company_Id, int start, int limit) {
        List<Map<String, Object>> result = null;
        String sql = "SELECT * FROM product_detail_master pdm where pdm.Company_Id = ? ";
        if (productGroupId == null) {
            sql = sql + " LIMIT ?,? ";
            result = db.queryList(sql, Company_Id, start, limit);
        } else {
            sql = sql + " and  pdm.Product_Group_Id = ? ";
            sql = sql + " LIMIT ?,? ";
            result = db.queryList(sql, Company_Id, productGroupId, start, limit);
        }



        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                pdm.setCompanyId((Integer) result.get(i).get("Company_Id"));
                pdm.setProductGroupId((Integer) result.get(i).get("Product_Group_Id"));
                pdm.setProductModelCode(Default.Str(result.get(i).get("product_model_code")));
                pdm.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                pdm.setProductDNameT(Default.Str(result.get(i).get("Product_D_Name_T")));
                pdm.setProductDNameE(Default.Str((result.get(i).get("Product_D_Name_E"))));
                pdm.setProductPrice1(Default.BigDecimal(result.get(i).get("Product_Price1")));
                pdm.setProductPrice2(Default.BigDecimal(result.get(i).get("Product_Price2")));
                pdm.setProductPrice3(Default.BigDecimal(result.get(i).get("Product_Price3")));
                pdm.setProductPrice4(Default.BigDecimal(result.get(i).get("Product_Price4")));
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
                pdm.setProductDetailId((Integer) result.get(i).get("Product_Detail_Id"));
                if (result.get(i).get("Product_Color_Id") != null) {
                    pdm.setProductColorId((Integer) result.get(i).get("Product_Color_Id"));
                }
                list.add(pdm);
            }
            return list;
        } else {
            return null;
        }

    }

    public Integer getProductId(productDetailMasterEntity pdm) {
        String sql = "select * from product_detail_master pdm where pdm.Product_Code = ? and pdm.Company_Id = ?";
        List<Map<String, Object>> result = db.queryList(sql, pdm.getProductCode(), pdm.getCompanyId());
        return !result.isEmpty()?(Integer) result.get(0).get("Product_Detail_Id"):0;
    }

    public ArrayList searchAll() {
        List<Map<String, Object>> result = null;
        String sql = "SELECT * FROM product_detail_master pdm"
                + " left join product_group_master pgm on pgm.product_group_id = pdm.product_group_id"
                + " left join stock_balance sb on sb.product_detail_id = pdm.product_detail_id ";
        result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                productGroupMasterEntity pgm = new productGroupMasterEntity();
                stockBalanceEntity sb = new stockBalanceEntity();
                pdm.setCompanyId((Integer) result.get(i).get("Company_Id"));
                pdm.setProductGroupId((Integer) result.get(i).get("Product_Group_Id"));
                pdm.setProductModelCode(Default.Str(result.get(i).get("product_model_code")));
                pdm.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                pdm.setProductDNameT(Default.Str(result.get(i).get("Product_D_Name_T")));
                pdm.setProductDNameE(Default.Str((result.get(i).get("Product_D_Name_E"))));
                pdm.setProductPrice1(Default.BigDecimal(result.get(i).get("Product_Price1")));
                pdm.setProductPrice2(Default.BigDecimal(result.get(i).get("Product_Price2")));
                pdm.setProductPrice3(Default.BigDecimal(result.get(i).get("Product_Price3")));
                pdm.setProductPrice4(Default.BigDecimal(result.get(i).get("Product_Price4")));
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
                pdm.setProductDetailId((Integer) result.get(i).get("Product_Detail_Id"));
                /////
                pgm.setProductGNameE(Default.Str(result.get(i).get("Product_G_Name_E")));
                pgm.setProductGNameT(Default.Str(result.get(i).get("Product_G_Name_T")));
                ////
                sb.setBalance(((BigDecimal) result.get(0).get("balance")).intValue());
                ////
                pdm.setProductGroupMasterEntity(pgm);
                pdm.setStockBalanceEntity(sb);
                if (result.get(i).get("Product_Color_Id") != null) {
                    pdm.setProductColorId((Integer) result.get(i).get("Product_Color_Id"));
                }
                list.add(pdm);
            }
            return list;
        } else {
            return null;
        }

    }

    public productDetailMasterEntity searchForDiscount(int productDetailId) {
        List<Map<String, Object>> result = null;
        String sql = " SELECT * FROM product_detail_master pdm "
                + " left join sale_discount_d_master sdd on sdd.discount_id = pdm.discount_id "
                + " left join sale_discount_h_master sdh on sdh.discount_id = pdm.discount_id "
                + " where pdm.product_detail_id = ? ";
        result = db.queryList(sql, productDetailId);

        if (result.size() > 0) {

            productDetailMasterEntity pdm = new productDetailMasterEntity();
            saleDiscountDMasterEntity sdd = new saleDiscountDMasterEntity();
            saleDiscountHMasterEntity sdh = new saleDiscountHMasterEntity();
            sdd.setDiscountFrom(Default.Integer(result.get(0).get("Discount_From")));
            sdd.setDiscountTo(Default.Integer(result.get(0).get("Discount_To")));
            sdd.setGetFreeVolumn(Default.Integer(result.get(0).get("Get_Free_Volumn")));
            sdd.setSalesVolumn(Default.Integer(result.get(0).get("Sales_Volumn")));
            sdd.setDiscount(Default.BigDecimal(result.get(0).get("Discount")));
            pdm.setSaleDiscountDMaster(sdd);
            sdh.setDiscountType(Default.Str(result.get(0).get("Discount_Type")));
            pdm.setSaleDiscountHMaster(sdh);
            //pdm.setCompanyId((Integer) result.get(0).get("Company_Id"));
            pdm.setProductGroupId((Integer) result.get(0).get("Product_Group_Id"));
            pdm.setProductModelCode(Default.Str(result.get(0).get("product_model_code")));
            pdm.setProductCode(Default.Str(result.get(0).get("Product_Code")));
            pdm.setProductDNameT(Default.Str(result.get(0).get("Product_D_Name_T")));
            pdm.setProductDNameE(Default.Str((result.get(0).get("Product_D_Name_E"))));
            pdm.setProductPrice1(Default.BigDecimal(result.get(0).get("Product_Price1")));
            pdm.setProductPrice2(Default.BigDecimal(result.get(0).get("Product_Price2")));
            pdm.setProductPrice3(Default.BigDecimal(result.get(0).get("Product_Price3")));
            pdm.setProductPrice4(Default.BigDecimal(result.get(0).get("Product_Price4")));
            pdm.setProductSpect1_T(Default.Str(result.get(0).get("Product_Spec1_T")));
            pdm.setProductSpect2_T(Default.Str(result.get(0).get("Product_Spec2_T")));
            pdm.setProductSpect3_T(Default.Str(result.get(0).get("Product_Spec3_T")));
            pdm.setProductSpect4_T(Default.Str(result.get(0).get("Product_Spec4_T")));
            pdm.setProductSpect5_T(Default.Str(result.get(0).get("Product_Spec5_T")));
            pdm.setProductSpect6_T(Default.Str(result.get(0).get("Product_Spec6_T")));
            pdm.setProductSpect1_E(Default.Str(result.get(0).get("Product_Spec1_E")));
            pdm.setProductSpect2_E(Default.Str(result.get(0).get("Product_Spec2_E")));
            pdm.setProductSpect3_E(Default.Str(result.get(0).get("Product_Spec3_E")));
            pdm.setProductSpect4_E(Default.Str(result.get(0).get("Product_Spec4_E")));
            pdm.setProductSpect5_E(Default.Str(result.get(0).get("Product_Spec5_E")));
            pdm.setProductSpect6_E(Default.Str(result.get(0).get("Product_Spec6_E")));
            pdm.setProductDPicLoc(Default.Str(result.get(0).get("Product_D_Pic_Loc")));
            pdm.setProductDIconLoc(Default.Str(result.get(0).get("Product_D_Icon_Loc")));
            pdm.setProductDRemarkT(Default.Str(result.get(0).get("Product_D_Remark_T")));
            pdm.setProductDRemarkE(Default.Str(result.get(0).get("Product_D_Remark_E")));
            pdm.setProductDDisplayFlag(Default.Str(result.get(0).get("Product_D_Display_Flag")));
            pdm.setUserId(Default.Str(result.get(0).get("User_Id")));
            pdm.setProductDetailId((Integer) result.get(0).get("Product_Detail_Id"));


            return pdm;
        } else {
            return null;
        }

    }

    public ArrayList searchAll2() {
        List<Map<String, Object>> result = null;
        String sql = "SELECT * FROM product_detail_master pdm"
                + " left join product_group_master pgm on pgm.product_group_id = pdm.product_group_id";

        result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                productGroupMasterEntity pgm = new productGroupMasterEntity();
                pdm.setProductModelCode(Default.Str(result.get(i).get("product_model_code")));
                pdm.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                pdm.setProductDNameT(Default.Str(result.get(i).get("Product_D_Name_T")));
                pdm.setProductDNameE(Default.Str((result.get(i).get("Product_D_Name_E"))));
                pdm.setProductPrice1(Default.BigDecimal(result.get(i).get("Product_Price1")));
                pdm.setProductPrice2(Default.BigDecimal(result.get(i).get("Product_Price2")));
                pdm.setProductPrice3(Default.BigDecimal(result.get(i).get("Product_Price3")));
                pdm.setProductPrice4(Default.BigDecimal(result.get(i).get("Product_Price4")));
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
                pdm.setProductDetailId((Integer) result.get(i).get("Product_Detail_Id"));
                /////
                pgm.setProductGNameE(Default.Str(result.get(i).get("Product_G_Name_E")));
                pgm.setProductGNameT(Default.Str(result.get(i).get("Product_G_Name_T")));
                pgm.setProductGroupCode(Default.Str(result.get(i).get("Product_Group_Code")));
                ////

                ////
                pdm.setProductGroupMasterEntity(pgm);

                if (result.get(i).get("Product_Color_Id") != null) {
                    pdm.setProductColorId((Integer) result.get(i).get("Product_Color_Id"));
                }
                list.add(pdm);
            }
            return list;
        } else {
            return null;
        }

    }

    public Boolean checkDuplicate(productDetailMasterEntity pdm) {
        String sql = " select * from product_detail_master where product_code = ? and company_id = ? ";
        List<Map<String, Object>> result = db.queryList(sql,pdm.getProductCode(), pdm.getCompanyId());
        return !result.isEmpty() ? true : false;
    }
}
