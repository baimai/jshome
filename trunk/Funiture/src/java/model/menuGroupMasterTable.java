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
                + "  Menu_G_Pic_Loc,"
                + "  Create_Date,User_Id )"
                + "  values(?,?,?,?,?,?,?,?,?,?,?)";

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
                mg.getCreateDate(),
                mg.getUserId());
    }

    public void update(menuGroupMasterEntity mg) {
        String sql = "update menu_group_master set Company_Id = ?,"
                + " Menu_G_Name_T = ?,Menu_G_Name_E = ?,"
                + " Show_List_Menu = ?,Chk_Login_Sts = ?,Menu_Permission = ?,"
                + " Menu_G_Remark_T = ?,Menu_G_Remark_E = ?,Menu_G_Pic_Loc = ?,"
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
                mg.getUpdateDate(),
                mg.getMenuGroupId());
    }

    public void remove(menuGroupMasterEntity mg) {
        String sql = "delete from menu_group_master where menu_group_id = ?";
        db.update(sql, mg.getMenuGroupId());
    }

    public ArrayList search(String sField, String sValue, String sOper, int Company_Id) {
        String sql = "SELECT * FROM menu_group_master pgm"
                + " where pgm.Company_Id = ?";

        if (sOper != null && sValue != null & sField != null) {
            sql = sql + " and " + Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        List<Map<String, Object>> result = db.queryList(sql, Company_Id);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                menuGroupMasterEntity mg = new menuGroupMasterEntity();
                mg.setMenuGNameT(Default.Str(result.get(i).get("Menu_G_Name_T")));
                mg.setMenuGNameE(Default.Str(result.get(i).get("Menu_G_Name_E")));
                mg.setMenuPermission(Default.Str(result.get(i).get("Menu_Permission")));
                mg.setShowListMenu(Default.Str(result.get(i).get("Show_List_Menu")));
                mg.setMenuGroupId((Integer) result.get(i).get("Menu_Group_Id"));
                mg.setCompanyId((Integer) result.get(i).get("Company_Id"));
                mg.setChkLoginSts(Default.Str(result.get(i).get("Chk_Login_Sts")));
                mg.setMenuGRemarkT(Default.Str(result.get(i).get("Menu_G_Remark_T")));
                mg.setMenuGRemarkE(Default.Str(result.get(i).get("Menu_G_Remark_E")));
                mg.setMenuGPicLoc(Default.Str(result.get(i).get("Menu_G_Pic_Loc")));
                list.add(mg);
            }
            return list;
        } else {
            return null;
        }

    }

    public ArrayList searchAll() {
        String sql = "select * from menu_group_master mgm ";
        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                menuGroupMasterEntity mgm2 = new menuGroupMasterEntity();
                mgm2.setMenuGNameE(Default.Str(result.get(i).get("Menu_G_Name_E")));
                mgm2.setMenuGroupId((Integer) result.get(i).get("Menu_Group_Id"));
                list.add(mgm2);
            }
            return list;
        } else {
            return null;
        }
    }

    public Boolean checkChild(menuGroupMasterEntity mgm) {
        String sql = " SELECT COUNT(*) as COUNT FROM menu_group_master  mgm "
                + " Join menu_detail_master mdm on mdm.menu_group_id = mgm.menu_group_id "
                + " where mgm.Company_Id = ? and mgm.menu_group_id = ? ";
        List<Map<String, Object>> result = db.queryList(sql, mgm.getCompanyId(), mgm.getMenuGroupId());
        int checkChild = Integer.valueOf(result.get(0).get("COUNT").toString());
        return checkChild == 0 ? false : true;
    }
}
