/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.menuDetailMasterEntity;
import model.entity.picProductSetupDetailEntity;
import model.entity.picProductSetupEntity;
import model.entity.productDetailMasterEntity;
import util.Column;
import util.Default;
import util.Operation;

/**
 *
 * @author Achilles
 */
public class picProductSetupTable {

    private Database db;

    public picProductSetupTable(Database db) {
        this.db = db;
    }

    public void add(picProductSetupEntity mps) {
        String sql = "insert into pic_product_setup "
                + "(Company_Id,"
                + "pic_Id,"
                + "Pic_Code,"
                + "Pic_Name_T,"
                + "Pic_Name_E,"
                + "Product_Remark_T,"
                + "Product_Remark_E,"
                + "Create_Date,"
                + "User_Id )values(?,?,?,?,?,?,?,?,?)";
        db.add(sql, mps.getCompanyId(),
                mps.getPicId(),
                mps.getPicCode(),
                mps.getPicNameT(),
                mps.getPicNameE(),
                mps.getProductRemarkT(),
                mps.getProductRemarkE(),
                mps.getCreateDate(),
                mps.getUserId());
    }

    public void update(picProductSetupEntity mps) {
        String sql = "update pic_product_setup set "
                + "Pic_Code = ?,"
                + "Company_Id = ?,"
                + "Product_remark_T = ?,"
                + "Product_remark_E = ?,"
                + " pic_name_t = ?,"
                + "pic_name_e = ?,"
                + " Update_Date = ?,"
                + "User_Id = ?"
                + " where Pic_Id = ?";
        db.update(sql, mps.getPicCode(),
                mps.getCompanyId(),
                mps.getProductRemarkT(),
                mps.getProductRemarkE(),
                mps.getPicNameT(),
                mps.getPicNameE(),
                mps.getUpdateDate(),
                mps.getUserId(),
                mps.getPicId());
    }

    public void updateSeq(picProductSetupEntity pps) {
        String sql = "update pic_product_setup set pic_seq = ? where pic_id = ?";
        db.update(sql, pps.getPicSeq(), pps.getPicId());
    }

    public void remove(picProductSetupEntity mps) {
        String sql = "delete from pic_product_setup where pic_id = ?";
        db.update(sql, mps.getPicId());
    }

    public ArrayList search(String sField, String sValue, String sOper, picProductSetupEntity pps, int start, int limit) {
        String sql = "SELECT *,pps.create_date as CDATE,pps.update_date as UDATE,pps.Pic_Code as Pic FROM pic_product_setup pps"
                + " join product_detail_master pdm on pdm.product_detail_id = pps.product_detail_id "
                + " join company_master cm on cm.company_id = pps.company_id "
                + " where cm.Company_Id = ? and pps.pic_code = ? ";
        if (sOper != null && sValue != null & sField != null) {
            sql = sql + " and " + Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        sql = sql + " limit ?,? ";
        List<Map<String, Object>> result = db.queryList(sql, pps.getCompanyId(), pps.getPicCode(), start, limit);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                picProductSetupEntity mps = new picProductSetupEntity();
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                pdm.setProductDPicLoc(Default.Str(result.get(i).get("Product_D_Pic_Loc")));
                mps.setPicCode(Default.Str(result.get(i).get("Pic_Code")));
                mps.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                mps.setCompanyCode(Default.Str(result.get(i).get("Company_Code")));
                mps.setPicNameT(Default.Str(result.get(i).get("Pic_Name_T")));
                mps.setPicNameE(Default.Str(result.get(i).get("Pic_Name_E")));
                mps.setProductRemarkT(Default.Str(result.get(i).get("Product_Remark_T")));
                mps.setProductRemarkE(Default.Str(result.get(i).get("Product_Remark_E")));
                mps.setCreateDate((Timestamp) result.get(i).get("CDATE"));
                mps.setUpdateDate((Timestamp) result.get(i).get("UDATE"));
                mps.setUserId(Default.Str(result.get(i).get("User_Id")));
                mps.setPicId((Integer) (result.get(i).get("Pic_Id")));
                mps.setProductDetailMasterEntity(pdm);
                list.add(mps);
            }
            return list;
        } else {
            return null;
        }

    }

    public int countAll(picProductSetupEntity pps) {
        String sql = "SELECT count(*) as COUNT FROM pic_product_setup pps"
                + " where cm.Company_Id = ?";
        List<Map<String, Object>> result = db.queryList(sql, pps.getCompanyId());
        return !result.isEmpty() ? Integer.valueOf(result.get(0).get("COUNT").toString()) : 0;
    }

    public ArrayList searchHeader(String sField, String sValue, String sOper, picProductSetupEntity pps) {
        String sql = " Select *  FROM pic_product_setup ps"
                + " WHERE ps.Company_Id =?";
        if (sOper != null && sValue != null & sField != null) {
            sql = sql + " and " + Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        List<Map<String, Object>> result = db.queryList(sql, pps.getCompanyId());
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                picProductSetupEntity ps = new picProductSetupEntity();
                ps.setPicId((Integer) (result.get(i).get("Pic_Id")));
                ps.setPicCode(Default.Str(result.get(i).get("Pic_Code")));
                ps.setPicNameT(Default.Str(result.get(i).get("Pic_Name_T")));
                ps.setPicNameE(Default.Str(result.get(i).get("Pic_Name_E")));
                ps.setCreateDate(Default.Date(result.get(i).get("Create_Date")));
                ps.setUpdateDate(Default.Date(result.get(i).get("Update_Date")));
                ps.setUserId(Default.Str(result.get(i).get("User_Id")));
                list.add(ps);
            }
            return list;
        } else {
            return null;
        }

    }

    public ArrayList searchPicCode(picProductSetupEntity pps) {
        String sql = " select *,@row := @row + 1 as rownum from (select * from pic_product_setup order by pic_code,pic_seq) pps "
                + " join product_detail_master pdm on pdm.product_detail_id = pps.product_detail_Id "
                + " join menu_detail_master mdm on mdm.pic_code = pps.pic_code, (SELECT @row := 0) r "
                + " where pps.pic_code = ? and pps.company_id = ? "
                + " and (case when pps.pic_code = '99999' then pdm.product_d_display_flag In ('Y','A') else pdm.product_d_display_flag In ('Y') end ) ";

        List<Map<String, Object>> result = db.queryList(sql, pps.getPicCode(), pps.getCompanyId());
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                picProductSetupEntity mps = new picProductSetupEntity();
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                menuDetailMasterEntity mdm = new menuDetailMasterEntity();
                mdm.setMenuCNameE(Default.Str(result.get(i).get("Menu_C_Name_E")));
                mdm.setMenuCNameT(Default.Str(result.get(i).get("Menu_C_Name_T")));
                pdm.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                pdm.setProductDNameT(Default.Str(result.get(i).get("Product_D_Name_T")));
                pdm.setProductDNameE(Default.Str(result.get(i).get("Product_D_Name_E")));
                mps.setPicCode(Default.Str(result.get(i).get("Pic_Code")));
                mps.setCompanyCode(Default.Str(result.get(i).get("Company_Code")));
                mps.setPicNameT(Default.Str(result.get(i).get("Pic_Name_T")));
                mps.setPicNameE(Default.Str(result.get(i).get("Pic_Name_E")));
                mps.setProductRemarkT(Default.Str(result.get(i).get("Product_Remark_T")));
                mps.setProductRemarkE(Default.Str(result.get(i).get("Product_Remark_E")));
                mps.setCreateDate((Timestamp) result.get(i).get("CDATE"));
                mps.setUpdateDate((Timestamp) result.get(i).get("UDATE"));
                mps.setUserId(Default.Str(result.get(i).get("User_Id")));
                mps.setPicId((Integer) (result.get(i).get("Pic_Id")));
                mps.setPicSeq((Integer) ((Long) result.get(i).get("rownum")).intValue());
                mps.setProductDetailMasterEntity(pdm);
                mps.setMenuDetailMasterEntity(mdm);
                list.add(mps);
            }
            return list;
        } else {
            return null;
        }

    }

    public ArrayList searchPicCode2(picProductSetupEntity pps) {
        String sql = "select * from pic_product_setup pps "
                + " where pps.pic_code = ? and pps.company_id = ? "
                + " order by pps.pic_code,pps.pic_seq desc ";
        List<Map<String, Object>> result = db.queryList(sql, pps.getPicCode(), pps.getCompanyId());
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                picProductSetupEntity mps = new picProductSetupEntity();
                mps.setPicCode(Default.Str(result.get(i).get("Pic_Code")));
                mps.setCompanyCode(Default.Str(result.get(i).get("Company_Code")));
                mps.setPicNameT(Default.Str(result.get(i).get("Pic_Name_T")));
                mps.setPicNameE(Default.Str(result.get(i).get("Pic_Name_E")));
                mps.setProductRemarkT(Default.Str(result.get(i).get("Product_Remark_T")));
                mps.setProductRemarkE(Default.Str(result.get(i).get("Product_Remark_E")));
                mps.setUserId(Default.Str(result.get(i).get("User_Id")));
                mps.setPicId((Integer) (result.get(i).get("Pic_Id")));
                mps.setPicSeq((Integer) (result.get(i).get("Pic_Seq")));
                list.add(mps);
            }
            return list;
        } else {
            return null;
        }

    }

    public Boolean checkDuplicate(picProductSetupEntity ps) {
        String sql = " select * from pic_product_setup where Pic_Code = ? and company_id = ? ";
        List<Map<String, Object>> result = db.queryList(sql, ps.getPicCode(), ps.getCompanyId());
        return !result.isEmpty() ? true : false;
    }
    /*===seq==============================================================================================================================*/

    public ArrayList searchPicId(int picId) {

        String sql = " select *,@row := @row + 1 as rownum from (select  * from pic_product_setup_detail order by pic_Detail_id,pic_seq) pps"
                + " join product_detail_master pdm on pdm.product_detail_id = pps.product_detail_Id "
                + " join pic_product_setup mdm on mdm.pic_id = pps.pic_id, (SELECT @row := 0) r ";
        if (picId != 0) {
            sql = sql + " where mdm.pic_id = " + picId;
             System.out.println("ss"+picId);
        }
       
        sql = sql + " and (case when mdm.pic_code = '99999' then pdm.product_d_display_flag In ('Y','A') else pdm.product_d_display_flag In ('Y') end ) ";
       System.out.println("sql"+sql);
        List<Map<String, Object>> result = db.queryList(sql, picId);
        
        ArrayList list = new ArrayList();
        
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                picProductSetupEntity mps = new picProductSetupEntity();
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                picProductSetupDetailEntity psd = new picProductSetupDetailEntity();

                mps.setPicId((Integer) (result.get(i).get("Pic_Id")));
                pdm.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                pdm.setProductDNameT(Default.Str(result.get(i).get("Product_D_Name_T")));
                pdm.setProductDNameE(Default.Str(result.get(i).get("Product_D_Name_E")));
                mps.setPicCode(Default.Str(result.get(i).get("Pic_Code")));
                mps.setCompanyCode(Default.Str(result.get(i).get("Company_Code")));
                mps.setPicNameT(Default.Str(result.get(i).get("Pic_Nane_T")));
                mps.setPicNameE(Default.Str(result.get(i).get("Pic_Nane_E")));
                mps.setProductRemarkT(Default.Str(result.get(i).get("Product_Remark_T")));
                mps.setProductRemarkE(Default.Str(result.get(i).get("Product_Remark_E")));
                mps.setCreateDate((Timestamp) result.get(i).get("CDATE"));
                mps.setUpdateDate((Timestamp) result.get(i).get("UDATE"));
                mps.setUserId(Default.Str(result.get(i).get("User_Id")));
                psd.setPicDetailId((Integer) (result.get(i).get("Pic_Detail_Id")));
                psd.setPicSeq((Integer) ((Long) result.get(i).get("rownum")).intValue());

                mps.setPicProductSetupDetailEntity(psd);
                psd.setProductDetailMasterEntity(pdm);

                list.add(mps);
                System.out.println("xxx1" + mps.getPicId());
            }
            return list;
        } else {
            return null;
        }

    }

}
