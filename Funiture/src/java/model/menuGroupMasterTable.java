/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
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
    private Timestamp Timestamp;

    public menuGroupMasterTable(Database db) {
        this.db = db;
    }

    public void add(menuGroupMasterEntity mg) {
        String sql = "insert into menu_group_master "
                + "( Company_Id,"
                + "Menu_G_Name_T,"
                + "Menu_G_Name_E,"
                + "Menu_Permission,"
                + "Show_List_Menu,"
                + "Chk_Login_Sts,"
                + "Menu_G_Remark_T,"
                + "Menu_G_Remark_E,"
                + "Menu_G_Icon_Loc,"
                + "Create_Date,"
               
                + " User_Id )"
                + "  values(?,?,?,?,?,?,?,?,?,?,?)";

        db.add(sql,
                mg.getCompanyId(),
                mg.getMenuGNameT(),
                mg.getMenuGNameE(),
                mg.getMenuPermission(),
                mg.getShowListMenu(),
                mg.getChkLoginSts(),
                mg.getMenuGRemarkT(),
                mg.getMenuGRemarkE(),
                mg.getMenuGIconLoc(),
                mg.getCreateDate(),
              
                mg.getUserId());
            System.out.println(">>>MenuGroupId" +mg.getMenuGroupId());
            System.out.println(">>>MenuGNameT" +mg.getMenuGNameT());
            System.out.println(">>>MenuGNameE" +mg.getMenuGNameE());
            System.out.println(">>>>MenuPermission" +mg.getMenuPermission());
            System.out.println("ShowListMenu" +mg.getShowListMenu());
            System.out.println("ChkLoginSts" +mg.getChkLoginSts());
            System.out.println("MenuGIconLoc" +mg.getMenuGIconLoc());
            System.out.println("CreateDate" +mg.getCreateDate());
            System.out.println("UpdateDate" +mg.getUpdateDate());
            System.out.println("UserId" +mg.getUserId());
         
    }

    public void update(menuGroupMasterEntity mg) {
        String sql = "update menu_group_master set Company_Id = ?,"
                + "Menu_G_Name_T = ?,"
                + "Menu_G_Name_E = ?,"
                + "Menu_Permission = ?,"
                + "Show_List_Menu = ?,"
                + "Chk_Login_Sts = ?,"
                + "Menu_G_Remark_T = ?,"
                + "Menu_G_Remark_E = ?,"
                + "Menu_G_Icon_Loc=?,"
                + "Update_Date = ?, "
                + "User_Id = ? "
                + "where Menu_Group_Id = ? ";
        db.add(sql,
                mg.getCompanyId(),
                mg.getMenuGNameT(),
                mg.getMenuGNameE(),
                mg.getMenuPermission(),
                mg.getShowListMenu(),
                mg.getChkLoginSts(),
                mg.getMenuGRemarkT(),
                mg.getMenuGRemarkE(),              
                mg.getMenuGIconLoc(),
                mg.getUpdateDate(),
                mg.getUserId(),
                mg.getMenuGroupId());
            System.out.println(">>>MenuGroupId" +mg.getMenuGroupId());
            System.out.println(">>>MenuGNameT" +mg.getMenuGNameT());
            System.out.println(">>>MenuGNameE" +mg.getMenuGNameE());
            System.out.println(">>>>MenuPermission" +mg.getMenuPermission());
            System.out.println("ShowListMenu" +mg.getShowListMenu());
            System.out.println("ChkLoginSts" +mg.getChkLoginSts());
            System.out.println("MenuGIconLoc" +mg.getMenuGIconLoc());
            System.out.println("CreateDate" +mg.getCreateDate());
            System.out.println("UpdateDate" +mg.getUpdateDate());
            System.out.println("UserId" +mg.getUserId());
            System.out.println("Company" +mg.getCompanyId());
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
                mg.setMenuGIconLoc(Default.Str(result.get(i).get("Menu_G_Icon_Loc")));
                mg.setCreateDate((Timestamp) result.get(i).get("Create_Date"));
                mg.setUpdateDate((Timestamp) result.get(i).get("Update_Date"));


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

    public Boolean checkChild(menuGroupMasterEntity gm) {
        String sql = "SELECT COUNT(*) as COUNT FROM menu_group_master  gm "
                + " Join menu_detail_master mdm on mdm.menu_group_id = gm.menu_group_id "
                + " where gm.Company_Id = ? and gm.menu_group_id = ? ";
        System.out.println("sql"+sql);
        List<Map<String, Object>> result = db.queryList(sql, gm.getCompanyId(), gm.getMenuGroupId());
        int checkChild = Integer.valueOf(result.get(0).get("COUNT").toString());
        return checkChild == 0 ? false : true;
    }

}
