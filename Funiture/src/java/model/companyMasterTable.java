/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.lang.String;
import model.entity.companyMasterEntity;
import util.Default;

/**
 *
 * @author Achilles
 */
public class companyMasterTable {

    private Database db;

    public companyMasterTable(Database db) {
        this.db = db;
    }

    public Integer getCompanyId(String companyCode) {
        String sql = "select * from company_master where company_code = 'JSH'";
        List<Map<String, Object>> result = db.queryList(sql);
        return !result.isEmpty()?(Integer) result.get(0).get("Company_Id"):0;
    }
    //
    public ArrayList search(){
        List<Map<String, Object>> result = null;
        String sql = "select Show_Stock_Balance_Flag from company_master where company_code = 'JSH'";
        result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            //for (int i = 0; i < result.size(); i++) {
                companyMasterEntity cm = new companyMasterEntity();
                cm.setShowStockBalanceFlag(Default.Str(result.get(0).get("Show_Stock_Balance_Flag")));
                list.add(cm);
            //}
            return list;
        } else {
            return null;
        }
    }

    //public ArrayList searchALL(companyMasterEntity cm) {
    //    List<Map<String, Object>> result = null;
    //    String sql = "select * from company_master where company_code = 'JSH'";
    //    result = db.queryList(sql);
    //    ArrayList list = new ArrayList();
    //    if (!result.isEmpty()) {
    //        for (int i = 0; i < result.size(); i++) {
    //            //companyMasterEntity cm = new companyMasterEntity();
    //            cm.setShowStockBalanceFlag(Default.Str(result.get(i).get("Show_Stock_Balance_Flag")));
    //            list.add(cm);
    //        }
    //        return list;
    //    } else {
    //        return null;
    //    }
    //}

    //

     public void add(companyMasterEntity cpm) {
        String sql = "insert into company_master "
                + "( Company_Code,Company_Name_T,Company_Name_E, Company_Name_Abbr,Company_Logo_Loc,"
                + "  Company_Addr_T,Company_Addr_E, Company_District_T,Company_District_E, Company_Amphur_T,"
                + "  Company_Amphur_E, Company_Province_T,Company_Province_E, Company_PostCode,  Company_Tel1,"
                + "  Company_Tel2,Company_Tel3, Company_Fax1,Company_Fax2,Company_Fax3,"
                + "  Company_Mobile1,Company_Mobile2,Company_Mobile3, Company_Email1,Company_Email2,"
                + "  Company_Email3, Language_Flag,Company_Header_Loc,Company_Catalog_Loc, Show_Stock_Balance_Flag,"
                + "  Show_Price_List_Flag,Show_Order_Flag, Create_Date, User_Id )"
                + "  values(?,?,?,?,?,?"
                + " ,?,?,?,?,?, "
                + " ?,?,?,?,?, "
                + " ?,?,?,?,?, "
                + " ?,?,?,?,?, "
                + " ?,?,?,?,?, "
                + " ?,?,? )";


        db.add(sql,
                cpm.getCompanyCode(),
                cpm.getCompanyNameT(),
                cpm.getCompanyNameE(),
                cpm.getCompanyAbbr(),
                cpm.getCompanyLogoLoc(),
                cpm.getCompanyAddrT(),
                cpm.getCompanyAddrE(),
                cpm.getCompanyDistrictT(),
                cpm.getCompanyDistrictE(),
                cpm.getCompanyAmphurT(),
                cpm.getCompanyAmphurE(),
                cpm.getCompanyProvinceT(),
                cpm.getCompanyProvinceE(),
                cpm.getCompanyPostCode(),
                cpm.getCompanyTel1(),
                cpm.getCompanyTel2(),
                cpm.getCompanyTel3(),
                cpm.getCompanyFax1(),
                cpm.getCompanyFax2(),
                cpm.getCompanyFax3(),
                cpm.getCompanyMobile1(),
                cpm.getCompanyMobile2(),
                cpm.getCompanyMobile3(),
                cpm.getCompanyEmail1(),
                cpm.getCompanyEmail2(),
                cpm.getCompanyEmail3(),
                cpm.getLanguageFlag(),
                cpm.getCompanyHeaderLoc(),
                cpm.getCompanyCatalogLoc(),
                cpm.getShowStockBalanceFlag(),
                cpm.getShowPriceListFlag(),
                cpm.getShowOrderFlag(),
                cpm.getCompanyHeaderLoc(),
                cpm.getCompanyCatalogLoc(),
                cpm.getCreateDate(),
                cpm.getUserId());
    }
     public void update(companyMasterEntity cpm) {
          String sql = " update company_master set  "
                + "  Company_Code = ?,Company_Name_T = ? ,Company_Name_E = ?, Company_Name_Abbr = ?,Company_Logo_Loc = ?,"
                + "  Company_Addr_T = ?,Company_Addr_E = ?, Company_District_T = ?,Company_District_E = ?, Company_Amphur_T = ?,"
                + "  Company_Amphur_E = ?, Company_Province_T = ?,Company_Province_E = ?, Company_PostCode = ?,  Company_Tel1 = ?,"
                + "  Company_Tel2 = ?,Company_Tel3 = ?, Company_Fax1 = ?,Company_Fax2 = ?,Company_Fax3 = ?,"
                + "  Company_Mobile1 = ?,Company_Mobile2 = ?,Company_Mobile3 = ?, Company_Email1 = ?,Company_Email2 = ?,"
                + "  Company_Email3 = ?, Language_Flag = ? ,Company_Header_Loc = ?,Company_Catalog_Loc = ?, Show_Stock_Balance_Flag = ?,"
                + "  Show_Price_List_Flag = ?,Show_Order_Flag = ?, Update_Date = ?, User_Id = ?"
                + "  where company_Id = ? ";
          db.add(sql,
                cpm.getCompanyCode(),cpm.getCompanyNameT(),cpm.getCompanyNameE(), cpm.getCompanyAbbr(), cpm.getCompanyLogoLoc(),
                cpm.getCompanyAddrT(), cpm.getCompanyAddrE(), cpm.getCompanyDistrictT(), cpm.getCompanyDistrictE(),cpm.getCompanyAmphurT(),
                cpm.getCompanyAmphurE(), cpm.getCompanyProvinceT(),cpm.getCompanyProvinceE(), cpm.getCompanyPostCode(),cpm.getCompanyTel1(),
                cpm.getCompanyTel2(), cpm.getCompanyTel3(), cpm.getCompanyFax1(),cpm.getCompanyFax2(), cpm.getCompanyFax3(),
                cpm.getCompanyMobile1(), cpm.getCompanyMobile2(), cpm.getCompanyMobile3(), cpm.getCompanyEmail1(), cpm.getCompanyEmail2(),
                cpm.getCompanyEmail3(), cpm.getLanguageFlag(),cpm.getCompanyHeaderLoc(),cpm.getCompanyCatalogLoc(),cpm.getShowStockBalanceFlag(),
                cpm.getShowPriceListFlag(),cpm.getShowOrderFlag(), cpm.getUpdateDate(), cpm.getUserId(),
                cpm.getCompanyId());
     }
     public void remove(companyMasterEntity cpm) {
        String sql = "delete from company_master where Company_Id = ? ";
        db.add(sql, cpm.getCompanyId());
    }
     public void getShowStockBalanceFlag (companyMasterEntity cpm) {
         String sql = "select Show_Stock_Balance_Flag from where  Company_Id=?";
         db.add(sql, cpm.getCompanyId());
     }
}
