/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.userSecurityEntity;
import util.Column;
import util.Default;
import util.Operation;

/**
 *
 * @author baimai
 */
public class userSecurityTable {

private Database db;
public userSecurityTable (Database db){
    this.db = db;
}
public void add(userSecurityEntity uss) {

        String sql = "insert into user_security "
                + "( User_Id,Company_Id,User_Password,"
                + " User_Name_T,User_Name_E,User_Authority_Sts,"
                + " User_Alive_Sts,Approved_Date,Hold_Date,"
                + " Create_Date)"
                + "  values(?,?,?,?,?,?,?,?,?,?)";

        db.add(sql,
                uss.getUserId(),
                uss.getCompanyId(),
                uss.getUserPassword(),
                uss.getUserNameT(),
                uss.getUserNameE(),
                uss.getUserAuthoritySts(),
                uss.getUserAliveSts(),
                uss.getApprovedDate(),
                uss.getHoldDate(),
                uss.getCreateDate());

    }
public void update(userSecurityEntity uss) {
        String sql = "update user_security set User_Password = ?,"
                + " User_Name_T =? ,User_Name_E = ?,User_Authority_Sts = ?,"
                + " User_Alive_Sts = ?,Approved_Date = ?,Hold_Date = ?,"
                + " Update_Date = ? "
                + " where User_Id = ? ";
        db.add(sql,
                uss.getUserPassword(),
                uss.getUserNameT(),
                uss.getUserNameE(),
                uss.getUserAuthoritySts(),
                uss.getUserAliveSts(),
                uss.getApprovedDate(),
                uss.getHoldDate(),
                uss.getUpdateDate(),
                uss.getUserId());
    }
public void remove(userSecurityEntity uss){
      String sql = "delete from user_security where User_Id = ?";
      db.update(sql,uss.getUserId());
  }
public ArrayList search(String sField, String sValue, String sOper) {
        String sql = "SELECT * FROM user_security cm";

        if (sOper != null && sValue != null & sField != null) {
            sql = sql +" where "+ Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                userSecurityEntity uss = new userSecurityEntity();
                uss.setUserId(Default.Str(result.get(i).get("User_Id")));
                uss.setUserNameT(Default.Str(result.get(i).get("User_Name_T")));
                uss.setUserNameE(Default.Str(result.get(i).get("User_Name_E")));
                uss.setUserAuthoritySts(Default.Str(result.get(i).get("User_Authority_Sts")));
                uss.setUserAliveSts(Default.Str(result.get(i).get("User_Alive_Sts")));
                uss.setApprovedDate((Timestamp) result.get(i).get("Approved_Date"));
                uss.setHoldDate((Timestamp) result.get(i).get("Hold_Date"));

                list.add(uss);
            }
            return list;
        } else {
            return null;
        }
    }
}
