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
import model.entity.menuGroupMasterEntity;
import util.Default;

/**
 *
 * @author Baimai
 */
public class menuDetailMasterTable {

    private Database db;

    public menuDetailMasterTable(Database db) {
        this.db = db;
    }

    public void add(menuDetailMasterEntity md) {
        String sql = "insert into menu_detail_master "
                + "(Company_Id,Menu_Group_Id,Menu_Model,Menu_Seq,"
                + " Menu_C_Name_T,Menu_C_Name_E,Show_List_Sts,Pic_Code,Menu_C_Pic_Loc,"
                + " Menu_C_Icon_Loc,Menu_C_Remark_T,Menu_C_Remark_E,Create_Date,User_Id"
                + " )"
                + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        db.add(sql,
                md.getCompanyId(),
                md.getMenuGroupId(),
                md.getMenuModel(),
                md.getMenuSeq(),
                md.getMenuCNameT(),
                md.getMenuCNameE(),
                md.getShowListSts(),
                md.getPicCode(),
                md.getMenuCPicLoc(),
                md.getMenuCIconLoc(),
                md.getMenuCRemarkT(),
                md.getMenuCRemarkE(),
                md.getCreateDate(),
                md.getUserId());
    }

    public void update(menuDetailMasterEntity md) {
        String sql = "update menu_detail_master set "
                + "Company_Id = ?,"
                + "Menu_Group_Id = ?,"
                + "Menu_Model = ?,"
                + "Menu_Seq = ?,"
                + "Menu_C_Name_T = ?,"
                + "Menu_C_Name_E = ?,"
                + "Show_List_Sts = ?,"
                + "Pic_Code = ?,"
                + "Menu_C_Pic_Loc = ?,"
                + "Menu_C_Icon_Loc = ?,"
                + "Menu_C_Remark_T = ?,"
                + "Menu_C_Remark_E = ?,"
                + "Update_date = ? "
                + "where Menu_Code_Id = ? ";
        db.add(sql,
                md.getCompanyId(),
                md.getMenuGroupId(),
                md.getMenuModel(),
                md.getMenuSeq(),
                md.getMenuCNameT(),
                md.getMenuCNameE(),
                md.getShowListSts(),
                md.getPicCode(),
                md.getMenuCPicLoc(),
                md.getMenuCIconLoc(),
                md.getMenuCRemarkT(),
                md.getMenuCRemarkE(),
                md.getUpdateDate(),
                md.getMenuCodeId());
    }

    public void remove(menuDetailMasterEntity md) {
        String sql = "delete from menu_detail_master where Menu_Code_Id = ?";
        db.update(sql, md.getMenuCodeId());
    }

    public ArrayList searchAll() {
        List<Map<String, Object>> result = null;
        String sql = " select * from menu_detail_master mdm "
                + " join menu_group_master mgm on mdm.menu_group_id = mgm.menu_group_id";
        result = db.queryList(sql);



        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                menuGroupMasterEntity mg = new menuGroupMasterEntity();
                mg.setMenuGNameE(Default.Str(result.get(i).get("Menu_G_Name_E")));
                menuDetailMasterEntity md = new menuDetailMasterEntity();
                md.setCompanyId((Integer) result.get(i).get("Company_Id"));
                md.setMenuGroupId((Integer) result.get(i).get("Menu_Group_Id"));
                md.setMenuModel(Default.Str(result.get(i).get("Menu_Model")));
                md.setMenuSeq((Integer) result.get(i).get("Menu_Seq"));
                md.setMenuCNameT(Default.Str(result.get(i).get("Menu_C_Name_T")));
                md.setMenuCNameE(Default.Str(result.get(i).get("Menu_C_Name_E")));
                md.setShowListSts(Default.Str(result.get(i).get("Show_List_Sts")));
                md.setPicCode(Default.Str(result.get(i).get("Pic_Code")));
                md.setMenuCIconLoc(Default.Str(result.get(i).get("Menu_C_Icon_Loc")));
                md.setMenuCRemarkT(Default.Str(result.get(i).get("Menu_C_Remark_T")));
                md.setMenuCRemarkE(Default.Str(result.get(i).get("Menu_C_Remark_E")));
                md.setUserId(Default.Str(result.get(i).get("User_Id")));
                md.setMenuCodeId((Integer) result.get(i).get("Menu_Code_Id"));
                md.setMenuGroupMasterEntity(mg);
                list.add(md);
            }
            return list;
        } else {
            return null;
        }

    }

    public int getMenuCodeId(String menuCodeId) {
        String sql = "select * from menu_detail_master where Menu_Code_id = ?";
        List<Map<String, Object>> result = db.queryList(sql, menuCodeId);
        return !result.isEmpty()?Integer.parseInt((String) result.get(0).get("Menu_Code_Id")):0;
    }

    public Boolean checkDuplicate(menuDetailMasterEntity mdm) {
        String sql = "SELECT * FROM menu_detail_master where company_id = ? and pic_code = ?";
        List<Map<String, Object>> result = db.queryList(sql, mdm.getCompanyId(), mdm.getPicCode());
        return !result.isEmpty() ? true : false;
    }

    public Boolean checkChild(menuDetailMasterEntity mdm) {
        String sql = " select count(*) as COUNT from menu_detail_master mdm "+
                     " join (select pic_code from pic_product_setup "+
                     " union all "+
                     " select pic_code from company_master ) pps on pps.pic_code = mdm.pic_code "+
                     " where mdm.company_id = ? and mdm.pic_code = ? ";
        List<Map<String, Object>> result = db.queryList(sql, mdm.getCompanyId(), mdm.getPicCode());
        int checkChild = Integer.valueOf(result.get(0).get("COUNT").toString());
        return checkChild == 0 ? false : true;
    }
}
