/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import java.util.Map;

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
            return (int) result.get(0).get("Company_Id");
        } else {
            return 0;
        }

    }
}
