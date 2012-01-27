/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.picProductSetupEntity;
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
        String sql = "insert into pic_product_setup (Company_Id,Pic_Code,Product_Detail_Id,Pic_Name_T,Pic_Name_E,Product_Remark_T,Product_Remark_E,Create_Date,User_Id)values(?,?,?,?,?,?,?,?,?)";
        db.add(sql, mps.getCompanyId(), mps.getPicCode(), mps.getProductDetailId(), mps.getPicNameT(), mps.getPicNameE(), mps.getProductRemarkT(), mps.getProductRemarkE(),
                Timestamp.valueOf(db.getNow()), mps.getUserId());
    }

    public void update(picProductSetupEntity mps) {
        String sql = "update pic_product_setup set Pic_Id = ?,Product_Id = ?,Company_Id = ?,Product_remark_T = ?,Product_remark_E = ?,"
                + " Update_Date = ?,User_Id = ? "
                + " where Product_Id = ? and Pic_Id = ?";
        db.update(sql, mps.getPicId(), mps.getProductDetailId(), mps.getCompanyId(), mps.getProductRemarkT(), mps.getProductRemarkE(),
                Timestamp.valueOf(db.getNow()), mps.getUserId(), mps.getProductDetailId(), mps.getPicId());
    }

    public void remove(picProductSetupEntity mps) {
        String sql = "delete from pic_product_setup where pic_code = ? and product_code = ?";
        db.update(sql, mps.getPicCode(), mps.getProductCode());
    }

    public ArrayList search(String sField, String sValue, String sOper, int Company_Id) {
        String sql = "SELECT *,pps.create_date as CDATE,pps.update_date as UDATE,pps.Pic_Code as Pic FROM pic_product_setup pps"
                + " join product_detail_master pdm on pdm.product_detail_id = pps.product_detail_id "
                + " join company_master cm on cm.company_id = pps.company_id "
                + " where cm.Company_Id = ? ";
        if (sOper != null && sValue != null & sField != null) {
            sql = sql + " and " + Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        List<Map<String, Object>> result = db.queryList(sql, Company_Id);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                picProductSetupEntity mps = new picProductSetupEntity();
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
                list.add(mps);
            }
            return list;
        } else {
            return null;
        }

    }
}
