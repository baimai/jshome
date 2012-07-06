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
import model.entity.picProductSetupEntity;
import util.Default;
import util.Column;
import util.Operation;
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
                + "(Menu_Code_Id,"
                + "Company_Id,"
                + "Menu_Group_Id,"
                + "Menu_Model,"
                + "Menu_Seq,"
                + "Menu_C_Name_T,"
                + "Menu_C_Name_E,"
                + "Show_List_Sts,"
                + "Pic_id,"
                + "Menu_C_Pic_Loc,"
                + "Menu_C_Icon_Loc,"
                + "Menu_C_Remark_T,"
                + "Menu_C_Remark_E,"
                + "Create_Date,"
                + "User_Id)"
                + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        db.add(sql,
                md.getMenuCodeId(),
                md.getCompanyId(),
                md.getMenuGroupId(),
                md.getMenuModel(),
                md.getMenuSeq(),
                md.getMenuCNameT(),
                md.getMenuCNameE(),
                md.getShowListSts(),
                md.getPicId(),
                md.getMenuCPicLoc(),
                md.getMenuCIconLoc(),
                md.getMenuCRemarkT(),
                md.getMenuCRemarkE(),
                md.getCreateDate(),
                md.getUserId());
            System.out.println(">>>MenuCodeId" +md.getMenuCodeId());
            System.out.println(">>>MenuGroupId" +md.getMenuGroupId());
            System.out.println(">>>MenuModel" +md.getMenuModel());
            System.out.println(">>>>MenuSeq" +md.getMenuSeq());
            System.out.println("MenuCNameT" +md.getMenuCNameT());
            System.out.println("MenuCNameE" +md.getMenuCNameE());
            System.out.println("ShowListSts" + md.getShowListSts());
            System.out.println("PicId" +md.getPicId());
            System.out.println("MenuCPicLoc" +md.getMenuCPicLoc());
            System.out.println("MenuCIconLoc" +md.getMenuCIconLoc());
            System.out.println("MenuCRemarkT" +md.getMenuCRemarkT());
            System.out.println("MenuCRemarkE" +md.getMenuCRemarkE());
            System.out.println("Update" +md.getUpdateDate());
            System.out.println("CreateDate" +md.getCreateDate());
            System.out.println("UserId" +md.getUserId());
    }


    public void update(menuDetailMasterEntity md) {
        String sql = "update menu_detail_master set "
                + "(Menu_Code_Id = ?,"
                + "Company_Id = ?,"
                + "Menu_Group_Id = ?,"
                + "Menu_Model = ?,"
                + "Menu_Seq = ?,"
                + "Menu_C_Name_T= ?,"
                + "Menu_C_Name_E = ?,"
                + "Show_List_Sts = ?,"
                + "Pic_id = ?,"
                + "Menu_C_Pic_Loc = ?,"
                + "Menu_C_Icon_Loc = ?,"
                + "Menu_C_Remark_T= ?,"
                + "Menu_C_Remark_E = ?,"
                + "Update_Date = ? "
                + "where Menu_Code_Id = ? ";
        db.add(sql,
                md.getMenuCodeId(),
                md.getCompanyId(),
                md.getMenuGroupId(),
                md.getMenuModel(),
                md.getMenuSeq(),
                md.getMenuCNameT(),
                md.getMenuCNameE(),
                md.getShowListSts(),
                md.getPicId(),
                md.getMenuCPicLoc(),
                md.getMenuCIconLoc(),
                md.getMenuCRemarkT(),
                md.getMenuCRemarkE(),
                md.getUpdateDate(),
                md.getMenuCodeId());
            System.out.println(">>>MenuCodeId" +md.getMenuCodeId());
            System.out.println(">>>MenuGroupId" +md.getMenuGroupId());
            System.out.println(">>>MenuModel" +md.getMenuModel());
            System.out.println(">>>>MenuSeq" +md.getMenuSeq());
            System.out.println("MenuCNameT" +md.getMenuCNameT());
            System.out.println("MenuCNameE" +md.getMenuCNameE());
            System.out.println("ShowListSts" + md.getShowListSts());
            System.out.println("PicId" +md.getPicId());
            System.out.println("MenuCPicLoc" +md.getMenuCPicLoc());
            System.out.println("MenuCIconLoc" +md.getMenuCIconLoc());
            System.out.println("MenuCRemarkT" +md.getMenuCRemarkT());
            System.out.println("MenuCRemarkE" +md.getMenuCRemarkE());
            System.out.println("Update" +md.getUpdateDate());
            System.out.println("CreateDate" +md.getCreateDate());
            System.out.println("UserId" +md.getUserId());
    }

    public void remove(menuDetailMasterEntity md) {
        String sql = "delete from menu_detail_master where Menu_Code_Id = ?";
        db.update(sql, md.getMenuCodeId());
    }

    public ArrayList searchAll() {
        String sql = " select  *,mdm.Company_Id as Com_Id ,mdm.Menu_Group_id as Group_Id from menu_detail_master mdm "
                + " join menu_group_master mgm on mdm.menu_group_id = mgm.menu_group_id"
                + " Left join pic_product_setup pps on pps.Pic_code = mdm.Pic_id";
                

       
        List<Map<String, Object>> result = db.queryList(sql);
       // result = db.queryList(sql);
        System.out.println("sql" + sql);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                menuGroupMasterEntity mg = new menuGroupMasterEntity();
                menuDetailMasterEntity md = new menuDetailMasterEntity();
                picProductSetupEntity pps = new picProductSetupEntity();
                mg.setMenuGNameE(Default.Str(result.get(i).get("Menu_G_Name_E")));       
                md.setCompanyId((Integer) result.get(i).get("Com_Id"));
               // System.out.println("setCompanyId" + md.getCompanyId());
                md.setMenuGroupId((Integer) result.get(i).get("Group_Id"));
                md.setMenuModel(Default.Str(result.get(i).get("Menu_Model")));
                md.setMenuSeq((Integer) result.get(i).get("Menu_Seq"));
                md.setMenuCNameT(Default.Str(result.get(i).get("Menu_C_Name_T")));
                md.setMenuCNameE(Default.Str(result.get(i).get("Menu_C_Name_E")));
                md.setShowListSts(Default.Str(result.get(i).get("Show_List_Sts")));
                md.setPicCode(Default.Str(result.get(i).get("Pic_Code")));
                md.setMenuCPicLoc(Default.Str(result.get(i).get("Menu_C_PicLoc")));
                md.setMenuCIconLoc(Default.Str(result.get(i).get("Menu_C_Icon_Loc")));
                md.setMenuCRemarkT(Default.Str(result.get(i).get("Menu_C_Remark_T")));
                md.setMenuCRemarkE(Default.Str(result.get(i).get("Menu_C_Remark_E")));
                mg.setCreateDate((Timestamp) result.get(i).get("Create_Date"));
                mg.setUpdateDate((Timestamp) result.get(i).get("Update_Date"));
                md.setUserId(Default.Str(result.get(i).get("User_Id")));
                md.setMenuCodeId((Integer) result.get(i).get("Menu_Code_Id"));
                md.setMenuGroupMasterEntity(mg);
                list.add(md);
            }
           }
        return !result.isEmpty() ? list : null;

    }

    public int countAll(int company_id){
         String sql =  "SELECT count(*) as COUNT FROM menu_detail_master mdm"
                         + " where mdm.Company_Id = ?";
         List<Map<String, Object>> result = db.queryList(sql,company_id);
         return !result.isEmpty()?Integer.valueOf(result.get(0).get("COUNT").toString()):0;
    }

    public int getMenuCodeId(String menuCodeId) {
        String sql = "select * from menu_detail_master where Menu_Code_id = ?";
        List<Map<String, Object>> result = db.queryList(sql, menuCodeId);
        return !result.isEmpty()?Integer.parseInt((String) result.get(0).get("Menu_Code_Id")):0;
    }

    public Boolean checkDuplicate(menuDetailMasterEntity mdm) {
        String sql = "SELECT * FROM menu_detail_master where company_id = ? and pic_id = ?";
        List<Map<String, Object>> result = db.queryList(sql, mdm.getCompanyId(), mdm.getPicId());
        return !result.isEmpty() ? true : false;
    }

    public Boolean checkChild(menuDetailMasterEntity mdm) {
        String sql = " select count(*) as COUNT from menu_detail_master mdm "+
                     " join (select pic_code from pic_product_setup "+
                     " union all "+
                     " select pic_code from company_master ) pps on pps.pic_Code = mdm.pic_id "+
                     " where mdm.company_id = ? and mdm.pic_id = ? ";
        List<Map<String, Object>> result = db.queryList(sql, mdm.getCompanyId(), mdm.getPicId());
        int checkChild = Integer.valueOf(result.get(0).get("COUNT").toString());
        return checkChild == 0 ? false : true;
    }
}
