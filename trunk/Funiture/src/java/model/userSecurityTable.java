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

    public userSecurityTable(Database db) {
        this.db = db;
    }

    public void add(userSecurityEntity uss) {

        String sql = "insert into user_security "
                + "( User_Id,Company_Id,User_Password,"
                + " User_Name_T,User_Name_E,User_Authority_Sts,"
                + " User_Alive_Sts,Approved_Date,Hold_Date,"
                + " Create_Date)"
                + "  values(?,?,MD5(?),?,?,?,?,?,?,?)";

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
        String sql = "update user_security set " //User_Password = MD5(?),
                + " User_Name_T =? ,User_Name_E = ?,User_Authority_Sts = ?,"
                + " User_Alive_Sts = ?,Approved_Date = ?,Hold_Date = ?,"
                + " Update_Date = ? "
                + " where User_Id = ? ";
        db.add(sql,
                //uss.getUserPassword(),
                uss.getUserNameT(),
                uss.getUserNameE(),
                uss.getUserAuthoritySts(),
                uss.getUserAliveSts(),
                uss.getApprovedDate(),
                uss.getHoldDate(),
                uss.getUpdateDate(),
                uss.getUserId());
    }

    public void updatePassword(userSecurityEntity uss){
        String sql = " update  user_security set User_Password = MD5(?) "+
                     " where User_Id = ?";
        db.add(sql,
                uss.getUserPassword(),
                uss.getUserId());
    }

    public void remove(userSecurityEntity uss) {
        String sql = "delete from user_security where User_Id = ?";
        db.update(sql, uss.getUserId());
    }

    public ArrayList search(String sField, String sValue, String sOper) {
        String sql = "SELECT * FROM user_security cm";

        if (sOper != null && sValue != null & sField != null) {
            sql = sql + " where " + Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
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

    public ArrayList chkUserPass(userSecurityEntity us) {
        String sql = "select * from user_security where user_id = ? and user_password = MD5(?) and Company_Id = ? and user_alive_sts = 'A' ";
        List<Map<String, Object>> result = db.queryList(sql, us.getUserId(), us.getUserPassword(), us.getCompanyId());
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            userSecurityEntity us2 = new userSecurityEntity();
            us2.setUserId((String) result.get(0).get("User_Id"));
            us2.setUserPassword((String) result.get(0).get("User_Password"));
            us2.setUserNameT((String) result.get(0).get("User_Name_T"));
            us2.setUserNameE((String) result.get(0).get("User_Name_E"));
            us2.setUserAliveSts((String) result.get(0).get("User_Alive_Sts"));
            us2.setUserAuthoritySts((String) result.get(0).get("User_Authority_Sts"));
            list.add(us2);
            return list;
        } else {
            return null;
        }
    }

    public Boolean checkPasswordById(userSecurityEntity us) {
        String sql = " select User_Password from user_security where user_id = ? ";
        List<Map<String, Object>> result = db.queryList(sql, us.getUserId());
            String curPass = (String) result.get(0).get("User_Password");
            return us.getUserPassword().equals(curPass)?true:false;
    }

    public Boolean checkDuplicate(userSecurityEntity uss) {
        String sql = " select * from user_security where user_id = ? ";
        List<Map<String, Object>> result = db.queryList(sql, uss.getUserId());
        return !result.isEmpty() ? true : false;
    }
}
