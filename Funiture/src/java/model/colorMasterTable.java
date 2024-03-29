/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.colorCodeMasterEntity;
import util.Column;
import util.Default;
import util.Operation;

/**
 *
 * @author Jik
 */
public class colorMasterTable {

    private Database db;

    public colorMasterTable(Database db) {
        this.db = db;
    }

    public void add(colorCodeMasterEntity cm) {

        String sql = "insert into color_code_master "
                + "( Color_Code,"
                + "Color_Name_T,"
                + "Color_Name_E,"
                + "Create_Date,"
                + "User_Id,"
                + "Color_Id)"
                + "  values(?,?,?,?,?,?)";

        db.add(sql,
                cm.getColorCode(),
                cm.getColorNameT(),
                cm.getColorNameE(),
                cm.getCreateDate(),
                cm.getUserId(),
                cm.getColorId());
    }

    public void update(colorCodeMasterEntity cm) {
        String sql = "update color_code_master set Color_Code = ?,"
                + " Color_Name_T = ?,"
                + "Color_Name_E = ?,"
                + " Update_Date = ? ,"
                + "User_Id=?"
                + " where Color_Id = ? ";
        db.add(sql,
                cm.getColorCode(),
                cm.getColorNameT(),
                cm.getColorNameE(),
                cm.getUpdateDate(),
                cm.getUserId(),
                cm.getColorId());
    }

    public void remove(colorCodeMasterEntity cm) {
        String sql = "delete from color_code_master where color_id = ?";
        db.update(sql, cm.getColorId());
    }

    public ArrayList searchAll(String sField, String sValue, String sOper) {
        String sql = "SELECT "
                + " cm.Color_Code,"
                + " cm.Color_Name_T,"
           //     + "cm.Color_Nane_E,"
                + " cm.Create_date,"
                + " cm.Update_Date,"
                + " cm.User_Id ,"
                + " cm.Color_Id"
                + " FROM color_code_master cm ";
        //  + " where cm.Color_Id = ? ";

        if (sOper != null && sValue != null & sField != null) {
            sql = sql + " where " + Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
       //   sql = sql + " limit ?,?";
         System.out.print("sql>>>>"+sql);
        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                colorCodeMasterEntity cm = new colorCodeMasterEntity();
                cm.setColorCode(Default.Str(result.get(i).get("Color_Code")));
                cm.setColorNameT(Default.Str(result.get(i).get("Color_Name_T")));
            //    cm.setColorNameE(Default.Str(result.get(i).get("Color_Name_E")));
                cm.setCreateDate((Timestamp) result.get(i).get("Create_Date"));
                cm.setUpdateDate((Timestamp) result.get(i).get("Update_Date"));
                cm.setUserId(Default.Str(result.get(i).get("User_Id")));
                cm.setColorId((Integer) result.get(i).get("Color_Id"));


                list.add(cm);
            }
            return list;
        } else {
            return null;
        }
        //  return !result.isEmpty()?list:null;
    }

    public int countAll() {
        String sql = "SELECT count(*) as COUNT FROM color_code_master cm";
        List<Map<String, Object>> result = db.queryList(sql);
        return !result.isEmpty() ? Integer.valueOf(result.get(0).get("COUNT").toString()) : 0;
    }

    public Boolean checkDuplicate(colorCodeMasterEntity ccm) {
        String sql = " select * from color_code_master where color_code = ?  ";
        List<Map<String, Object>> result = db.queryList(sql, ccm.getColorCode());
        return !result.isEmpty() ? true : false;
    }
}
