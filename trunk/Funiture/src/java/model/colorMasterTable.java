/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

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
                + "( Color_Code,Color_Name_T,Color_Name_E,"
                + "  Create_Date,User_Id )"
                + "  values(?,?,?,?,?)";

        db.add(sql,
                cm.getColorCode(),
                cm.getColorNameT(),
                cm.getColorNameE(),
                cm.getCreateDate(),
                cm.getUserId());
    }
  public void update(colorCodeMasterEntity cm) {
        String sql = "update color_code_master set Color_Code = ?,"
                + " Color_Name_T = ?,Color_Name_E = ?,"
                + " Update_Date = ? "
                + " where Color_Id = ? ";
        db.add(sql,
                cm.getColorCode(),
                cm.getColorNameT(),
                cm.getColorNameE(),
                cm.getUpdateDate(),
                cm.getColorId());


    }

  public ArrayList search(String sField, String sValue, String sOper) {
        String sql = "SELECT * FROM color_code_master cm";

        if (sOper != null && sValue != null & sField != null) {
            sql = sql +" where "+ Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (result != null) {
            for (int i = 0; i < result.size(); i++) {
                colorCodeMasterEntity cm = new colorCodeMasterEntity();
                cm.setColorCode(Default.Str(result.get(i).get("Color_Code")));
                cm.setColorNameT(Default.Str(result.get(i).get("Color_Name_T")));
                cm.setColorNameE(Default.Str(result.get(i).get("Color_Name_E")));
                //cm.setColorId((Integer)result.get(i).get("Color_Id"));
               
                list.add(cm);
            }
            return list;
        } else {
            return null;
        }

    }


    

}
