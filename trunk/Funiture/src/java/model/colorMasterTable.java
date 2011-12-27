/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import controller.colorMaster;
import model.entity.colorCodeMaster;

/**
 *
 * @author Jik
 */
public class colorMasterTable {
private Database db;
public colorMasterTable (Database db) {
        this.db = db;
    }
    public void add(colorCodeMaster cmt) {
        String sql = "insert into color_code_master "
                + "( Color_Code,Color_Name_T,Color_Name_E,"
                + "  Create_Date,User_Id )"
                + "  values(?,?,?,?,?)";

        db.add(sql,
                cmt.getColorCode(),
                cmt.getColorNameT(),
                cmt.getColorNameE(),
                cmt.getCreateDate(),
                cmt.getUserId());

    }      
}
