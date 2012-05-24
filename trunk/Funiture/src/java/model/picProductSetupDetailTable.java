/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.picProductSetupDetailEntity;
import model.entity.picProductSetupEntity;
import model.entity.productDetailMasterEntity;
import util.Column;
import util.Default;
import util.Operation;

/**
 *
 * @author baimai
 */
public class picProductSetupDetailTable {
     private Database db;

    public picProductSetupDetailTable(Database db) {
        this.db = db;
    }
public void add(picProductSetupDetailEntity psd) {
        String sql = "insert into pic_product_setup_detail "
                + " (pic_detail_id,"
                + " pic_id,"
                + " Product_Detail_Id,"
                + " pic_seq,"
                + " pic_detail_name_T,"
                + " pic_detail_name_E,"
                + " pic_detail_remark_T,"
                + " pic_detail_remark_E,"
                + " Create_Date,"
                + " User_Id)"
                + " values(?,?,?,?,?,?,?,?,?,?)";
        db.add(sql, psd.getPicDetailId(),
                psd.getPicId(),
                psd.getProductDetailId(),
                psd.getPicSeq(),
                psd.getPicDetailNameT(),
                psd.getPicDetailNameE(),
                psd.getPicDetailRemarkT(),
                psd.getPicDetailRemarkE(),
                psd.getCreateDate(),
                psd.getUserId() );
    }
 public void update(picProductSetupDetailEntity psd) {
        String sql = "update pic_product_setup_detail set "
                + " pic_id =? ,"
                + " Product_detail_Id = ?,"
                + " pic_seq = ? "
                + " pic_detail_name_T = ?"
                + " pic_detail_name_E =? "
                + " pic_detail_remark_T = ?"
                + " pic_detail_remark_E =?"
                + " Update_Date = ?,"
                + " User_Id = ?"
                + " where pic_detail_id = ?";
        db.update(sql, psd.getPicId(),
                psd.getProductDetailId(),
                psd.getUpdateDate(),
                psd.getUserId(),
                psd.getPicDetailId());
    }
 public void remove(picProductSetupDetailEntity psd) {
        String sql = "delete from pic_product_setup_detail where pic_detail_id = ?";
        db.update(sql, psd.getPicDetailId());
    }
 public void updateSeq(picProductSetupDetailEntity psd){
        String sql = "update pic_product_setup set pic_seq = ? where pic_detail_id = ?";
        db.update(sql,psd.getPicSeq(),psd.getPicDetailId());
    }

public ArrayList search(String sField, String sValue, String sOper ) {
        String sql = "select *,psd.Pic_Detail_Id as Pic_D_Id,"
                + "ps.pic_code as P_Code,"
                + "psd.Create_Date as CDate,"
                + "psd.Update_Date as UDate ,"
                + "psd.User_Id as UId"
                + "  FROM pic_product_setup_detail psd "
                 + " left JOIN pic_product_setup ps "
                + "  ON ps.Pic_Id = psd.Pic_Id "
                + "  left JOIN product_detail_master pdm "
                + "  ON pdm.product_detail_id = psd.product_detail_id  and pdm.company_id= ps.company_id";
               
              
        if (sOper != null && sValue != null & sField != null) {
            sql = sql + " and " + Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                picProductSetupDetailEntity ppds = new picProductSetupDetailEntity();
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                picProductSetupEntity pps  = new picProductSetupEntity();                
                ppds.setPicDetailId((Integer)(result.get(i).get("Pic_D_Id")));
                pps.setPicCode(Default.Str(result.get(i).get("P_Code")));
                pdm.setProductDPicLoc(Default.Str(result.get(i).get("Product_D_Pic_Loc")));
                ppds.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                ppds.setCreateDate((Timestamp) result.get(i).get("CDate"));
                ppds.setUpdateDate((Timestamp) result.get(i).get("UDate"));
                ppds.setUserId(Default.Str(result.get(i).get("UId")));
                ppds.setProductDetailMasterEntity(pdm);
               ppds.setPicProductSetupEntity(pps);
                list.add(ppds);
            }
            return list;
        } else {
            return null;
        }

    }
public int countAll(picProductSetupDetailEntity psd){
         String sql = "SELECT count(*) as COUNT FROM pic_product_setup_detail pps";
                 
          List<Map<String, Object>> result = db.queryList(sql);
        return !result.isEmpty() ? Integer.valueOf(result.get(0).get("COUNT").toString()) : 0;
    }
public ArrayList searchAll() {
        String sql = " SELECT * "
                + "  FROM pic_product_setup_detail psd "
                + "  JOIN product_detail_master pdm "
                + "  ON pdm.product_detail_id = psd.product_detail_id "
                + "  JOIN pic_product_setup ps "
                + "  ON ps.Pic_Id = psd.Pic_Id" ;



        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                picProductSetupDetailEntity psd = new picProductSetupDetailEntity();
                picProductSetupEntity ps = new picProductSetupEntity();
                productDetailMasterEntity pdm= new productDetailMasterEntity();
               // psd.setPicDetailId((Integer) result.get(i).get("pic_Detail_id"));
                      
                //===หา pic_code
                ps.setPicCode(Default.Str(result.get(i).get("Pic_code")));
                psd.setPicId((Integer) result.get(i).get("pic_id"));
                psd.setPicProductSetupEntity(ps);
                //===หา product_code
                psd.setProductCode(Default.Str(result.get(i).get("product_code")));
                //pdm.setProductCode(Default.Str(result.get(i).get("product_code")));
                pdm.setProductDPicLoc(Default.Str(result.get(i).get("Product_D_Pic_Loc")));
                psd.setProductDetailMasterEntity(pdm);
                
                psd.setCreateDate((Timestamp) result.get(i).get("Create_Date"));
                psd.setUpdateDate((Timestamp) result.get(i).get("Update_Date"));
                psd.setUserId(Default.Str(result.get(i).get("User_Id")));
                list.add(psd);
            }
        }
        return !result.isEmpty()?list:null;
    }

/*===seq==============================================================================================================================*/
 public ArrayList searchPicId(picProductSetupDetailEntity pps) {
        String sql = " select *,@row := @row + 1 as rownum from (select * from pic_product_setup_detail order by pic_Detail_id,pic_seq) pps"
                + " join product_detail_master pdm on pdm.product_detail_id = pps.product_detail_Id "
                + " join pic_product_setup mdm on mdm.pic_id = pps.pic_id, (SELECT @row := 0) r "
                + " where mdm.pic_Id = '?' and mdm.company_id = ?"
                + " and (case when mdm.pic_code = '99999' then pdm.product_d_display_flag In ('Y','A') else pdm.product_d_display_flag In ('Y') end ) ";

        List<Map<String, Object>> result = db.queryList(sql, pps.getPicId());
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                picProductSetupEntity mps = new picProductSetupEntity();
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                picProductSetupDetailEntity psd = new picProductSetupDetailEntity();

                mps.setPicId((Integer)(result.get(i).get("Pic_Id")));
                pdm.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                pdm.setProductDNameT(Default.Str(result.get(i).get("Product_D_Name_T")));
                pdm.setProductDNameE(Default.Str(result.get(i).get("Product_D_Name_E")));
                mps.setPicCode(Default.Str(result.get(i).get("Pic_Code")));
                mps.setCompanyCode(Default.Str(result.get(i).get("Company_Code")));
                psd.setPicDetailNameT(Default.Str(result.get(i).get("Pic_Detail_Nane_T")));
                psd.setPicDetailNameE(Default.Str(result.get(i).get("Pic_Detail_Nane_E")));
                psd.setPicDetailRemarkT(Default.Str(result.get(i).get("Pic_Detail_Remark_T")));
                psd.setPicDetailRemarkE(Default.Str(result.get(i).get("Pic_Detail_Remark_E")));
                psd.setCreateDate((Timestamp) result.get(i).get("CDATE"));
                psd.setUpdateDate((Timestamp) result.get(i).get("UDATE"));
                psd.setUserId(Default.Str(result.get(i).get("User_Id")));
                psd.setPicDetailId((Integer) (result.get(i).get("Pic_Detail_Id")));
                psd.setPicSeq((Integer) ((Long) result.get(i).get("rownum")).intValue());
                psd.setProductDetailMasterEntity(pdm);
                psd.setPicProductSetupEntity(mps);

                list.add(mps);
            }
            return list;
        } else {
            return null;
        }

    }
}
