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
        String sql = "insert into pic_product_setup (Company_Id,Pic_Code,Product_Detail_Id,Pic_Name_T,Pic_Name_E,Product_Remark_T,Product_Remark_E,Create_Date,User_Id,pic_seq)values(?,?,?,?,?,?,?,?,?,?)";
        db.add(sql, mps.getCompanyId(), mps.getPicCode(), mps.getProductDetailId(), mps.getPicNameT(), mps.getPicNameE(), mps.getProductRemarkT(), mps.getProductRemarkE(),
                mps.getCreateDate(), mps.getUserId(),mps.getPicSeq());
    }

    public void update(picProductSetupEntity mps) {
        String sql = "update pic_product_setup set Pic_Code = ?,Product_detail_Id = ?,Company_Id = ?,Product_remark_T = ?,Product_remark_E = ?,"
                + " pic_name_t = ?,pic_name_e = ?,"
                + " Update_Date = ?,User_Id = ?"
                + " where Pic_Id = ?";
        db.update(sql, mps.getPicCode(), mps.getProductDetailId(), mps.getCompanyId(), mps.getProductRemarkT(), mps.getProductRemarkE(),
                mps.getPicNameT(),mps.getPicNameE(),
                mps.getUpdateDate(), mps.getUserId(), mps.getPicId());
    }
    public void updateSeq(picProductSetupEntity pps){
        String sql = "update pic_product_setup set pic_seq = ? where pic_id = ?";
        db.update(sql,pps.getPicSeq(),pps.getPicId());
    }

    public void remove(picProductSetupEntity mps) {
        String sql = "delete from pic_product_setup where pic_id = ?";
        db.update(sql, mps.getPicId());
    }

    public ArrayList search(String sField, String sValue, String sOper,picProductSetupEntity pps,int start,int limit) {
        String sql = "SELECT *,pps.create_date as CDATE,pps.update_date as UDATE,pps.Pic_Code as Pic FROM pic_product_setup pps"
                + " join product_detail_master pdm on pdm.product_detail_id = pps.product_detail_id "
                + " join company_master cm on cm.company_id = pps.company_id "
                + " where cm.Company_Id = ? and pps.pic_code = ? ";
        if (sOper != null && sValue != null & sField != null) {
            sql = sql + " and " + Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        sql=sql+" limit ?,? ";
        List<Map<String, Object>> result = db.queryList(sql,pps.getCompanyId(),pps.getPicCode(),start,limit);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                picProductSetupEntity mps = new picProductSetupEntity();
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                pdm.setProductDPicLoc(Default.Str(result.get(i).get("Product_D_Pic_Loc")));
                mps.setPicCode(Default.Str(result.get(i).get("Pic")));
                mps.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                mps.setCompanyCode(Default.Str(result.get(i).get("Company_Code")));
                mps.setPicNameT(Default.Str(result.get(i).get("Pic_Name_T")));
                mps.setPicNameE(Default.Str(result.get(i).get("Pic_Name_E")));
                mps.setProductRemarkT(Default.Str(result.get(i).get("Product_Remark_T")));
                mps.setProductRemarkE(Default.Str(result.get(i).get("Product_Remark_E")));
                mps.setCreateDate((Timestamp) result.get(i).get("CDATE"));
                mps.setUpdateDate((Timestamp) result.get(i).get("UDATE"));
                mps.setUserId(Default.Str(result.get(i).get("User_Id")));
                mps.setPicId((Integer)(result.get(i).get("Pic_Id")));
                mps.setProductDetailMasterEntity(pdm);
                list.add(mps);
            }
            return list;
        } else {
            return null;
        }

    }

    public int countAll(picProductSetupEntity pps){
         String sql = "SELECT count(*) as COUNT FROM pic_product_setup pps"
                + " join product_detail_master pdm on pdm.product_detail_id = pps.product_detail_id "
                + " join company_master cm on cm.company_id = pps.company_id "
                + " where cm.Company_Id = ? and pps.pic_code = ? ";
         List<Map<String, Object>> result = db.queryList(sql,pps.getCompanyId(),pps.getPicCode());
         if (!result.isEmpty()) {
              return Integer.valueOf(result.get(0).get("COUNT").toString());
         }else{
             return 0;
         }

    }

    public ArrayList searchHeader(String sField, String sValue, String sOper,picProductSetupEntity pps) {
        String sql = " SELECT mdm.pic_code as Pic,mdm.menu_c_name_t as nameT,mdm.menu_c_name_e as nameE  " +
                     " From menu_detail_master mdm " +
                     " where mdm.Company_Id = ? ";
        if (sOper != null && sValue != null & sField != null) {
            sql = sql + " and " + Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        List<Map<String, Object>> result = db.queryList(sql,pps.getCompanyId());
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                picProductSetupEntity mps = new picProductSetupEntity();
                menuDetailMasterEntity mdm = new menuDetailMasterEntity();
                mdm.setMenuCNameT(Default.Str(result.get(i).get("nameT")));
                mdm.setMenuCNameE(Default.Str(result.get(i).get("nameE")));
                mps.setPicCode(Default.Str(result.get(i).get("Pic")));
                mps.setMenuDetailMasterEntity(mdm);
                list.add(mps);
            }
            return list;
        } else {
            return null;
        }

    }

    public ArrayList searchPicCode(picProductSetupEntity pps) {
        String sql = "select * from pic_product_setup pps"
                + " join product_detail_master pdm on pdm.product_detail_id = pps.product_detail_Id "
                + " join menu_detail_master mdm on mdm.pic_code = pps.pic_code "
                + " where pps.pic_code = ? and pps.company_id = ? "
                + " and (case when pps.pic_code = '99999' then pdm.product_d_display_flag In ('Y','A') else pdm.product_d_display_flag In ('Y') end )"
                + " order by pps.pic_code,pps.pic_seq  ";
        List<Map<String, Object>> result = db.queryList(sql,pps.getPicCode(),pps.getCompanyId());
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
                mps.setPicId((Integer)(result.get(i).get("Pic_Id")));
                mps.setPicSeq((Integer)(result.get(i).get("Pic_Seq")));
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
        List<Map<String, Object>> result = db.queryList(sql,pps.getPicCode(),pps.getCompanyId());
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
                mps.setPicId((Integer)(result.get(i).get("Pic_Id")));
                mps.setPicSeq((Integer)(result.get(i).get("Pic_Seq")));
                list.add(mps);
            }
            return list;
        } else {
            return null;
        }

    }
}
