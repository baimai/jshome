/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.menuGroupMasterEntity;
import util.Column;
import util.Default;
import util.Operation;

/**
 *
 * @author Baimai
 */
public class menuGroupMasterTable {
     private Database db;

    public menuGroupMasterTable(Database db) {
        this.db = db;
    }

    public void add(menuGroupMasterEntity mg) {
        String sql = "insert into menu_group_master "
                + "( Company_Id,Menu_G_Name_T,Menu_G_Name_E,Show_List_Menu,"
                + "  Chk_Login_Sts,Menu_Permission,Menu_G_Remark_T,Menu_G_Remark_E,"
                + "  Create_Date,User_Id )"
                + "  values(?,?,?,?,?,?,?,?,?,?)";

        db.add(sql,
                mg.getCompanyId(),
                mg.getMenuGNameT(),
                mg.getMenuGNameE(),
                mg.getShowListMenu(),
                mg.getChkLoginSts(),
                mg.getMenuPermission(),
                mg.getMenuGRemarkT(),
                mg.getMenuGRemarkE(),
                mg.getCreateDate(),
                mg.getUserId());
    }

    public void update(menuGroupMasterEntity mg) {
        String sql = "update menu_group_master set Company_Id = ?,"
                + " Menu_G_Name_T = ?,Menu_G_Name_E = ?,"
                + " Show_List_Menu = ?,Chk_Login_Sts = ?,Menu_Permission = ?"
                + " Menu_G_Remark_T = ?,Menu_G_Remark_E = ?,Menu_G_Pic_Loc = ?,Menu_G_Icon_Loc,"
                + " Update_Date = ? "
                + " where Menu_Group_Id = ? ";
        db.add(sql,

                mg.getCompanyId(),
                mg.getMenuGNameT(),
                mg.getMenuGNameE(),
                mg.getShowListMenu(),
                mg.getChkLoginSts(),
                mg.getMenuPermission(),
                mg.getMenuGRemarkT(),
                mg.getMenuGRemarkE(),
                mg.getMenuGPicLoc(),
                mg.getMenuGIconLog(),
                mg.getUpdateDate(),
                mg.getMenuGroupId());
    }

    public ArrayList search(String sField, String sValue, String sOper) {
        String sql = "SELECT * FROM product_group_master pgm"+
                     " join Company_Master cm on cm.Company_Id = pgm.Company_Id";

        if (sOper != null && sValue != null & sField != null) {
            sql = sql +" where "+ Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (result != null) {
            for (int i = 0; i < result.size(); i++) {
                menuGroupMasterEntity mg = new menuGroupMasterEntity();
                mg.setMenuGNameT(Default.Str(result.get(i).get("Menu_G_Name_T")));
                mg.setMenuGNameE(Default.Str(result.get(i).get("Menu_G_Name_E")));
                mg.setMenuPermission(Default.Str(result.get(i).get("Menu_Permission")));
                mg.setMenuGroupId((Integer)result.get(i).get("Menu_Group_Id"));
                mg.setCompanyId((Integer)result.get(i).get("Company_Id"));
                list.add(mg);
            }
            return list;
        } else {
            return null;
        }

    }

}
