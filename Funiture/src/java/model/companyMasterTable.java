/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import java.util.Map;
import model.entity.companyMaster;

/**
 *
 * @author Achilles
 */
public class companyMasterTable {

    private Database db;

    public companyMasterTable(Database db) {
        this.db = db;
    }

    public int getCompanyId(String companyCode) {
        String sql = "select * from company_master where company_code = ?";
        List<Map<String, Object>> result = db.queryList(sql,companyCode);
        if (result != null) {
            return (Integer) result.get(0).get("Company_Id");
        } else {
            return 0;
        }

    }
     public void add(companyMaster cpm) {
        String sql = "insert into company_master "
                + "( Company_Code,Company_Name_T,Company_Name_E,"
                + "  Company_Name_Abbr,Company_Logo_Loc,"
                + "  Company_Addr_T,Company_Addr_E,"
                + "  Company_District_T,Company_District_E,"
                + "  Company_Amphur_T,Company_Amphur_E,"
                + "  Company_Province_T,Company_Province_E,"
                + "  Company_PostCode,"
                + "  Company_Tel1,Company_Tel2,Company_Tel3,"
                + "  Company_Fax1,Company_Fax2,Company_Fax3,"
                + "  Company_Mobile1,Company_Mobile2,Company_Mobile3,"
                + "  Company_Email1,Company_Email2,Company_Email3,"
                + "  Language_Flag,Pic_Code,"
                + "  Create_Date,"
                + "  User_Id )"
                + "  values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

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
                cpm.getPicCode(),
                cpm.getCreateDate(),
                cpm.getUserId());
    }
}
