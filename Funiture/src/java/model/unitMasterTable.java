/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import model.entity.unitMasterEntity;

/**
 *
 * @author Achilles
 */
public class unitMasterTable {
    private Database db;

    public unitMasterTable(Database db){
        this.db = db;
    }
    public void add(unitMasterEntity um){
        String sql="insert into unit_master (unit_name_t,unit_name_e) values(?,?)";
        db.add(sql,um.getUnitNameT(),um.getUnitNameE());
    }
    public void update(unitMasterEntity um){
        String sql="update unit_master set unit_name_t = ?,unit_name_e = ? where unit_id =?";
        db.add(sql,um.getUnitNameT(),um.getUnitNameE(),um.getUnitId());
    }

}
