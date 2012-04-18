/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.commonProvinceEntity;

/**
 *
 * @author Achilles
 */
public class commonProvinceTable {

    private Database db;

    public commonProvinceTable(Database db) {
        this.db = db;
    }

    public ArrayList search(int level, int id) {
        List<Map<String, Object>> result = null;
        String sql = null;
        if (level == 1) {
            sql = "SELECT * FROM Common_Province where level_= ?";
            result = db.queryList(sql,level);
        } else {
            sql = "SELECT * FROM Common_Province where level_= ? and upid = ?";
            result = db.queryList(sql,level,id);
        }
        
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                commonProvinceEntity cp = new commonProvinceEntity();
                cp.setId((Integer)result.get(i).get("ID_"));
                cp.setLevel((Integer)result.get(i).get("LEVEL_"));
                cp.setName((String) result.get(i).get("NAME_"));
                cp.setUpid((Integer)result.get(i).get("UPID"));
                cp.setNameE((String) result.get(i).get("NAME_E_"));
                list.add(cp);
            }
            return list;
        } else {
            return null;
        }

    }
    public Integer getFirstAmphurId(int id) {
        String sql = "select * from common_province where upid = ?";
        List<Map<String, Object>> result = db.queryList(sql,id);
        return !result.isEmpty()?(Integer) result.get(0).get("ID_"):0;
    }
}
