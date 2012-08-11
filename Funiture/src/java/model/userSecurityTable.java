/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.companyMasterEntity;
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
                + "( User_Id,"
                + "Company_Id,"
                + "User_Password,"
                + " User_Name_T,"
                + "User_Name_E,"
                + "User_Authority_Sts,"
                + " User_Alive_Sts,"
                + "Approved_Date,"
                + "Hold_Date,"
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
                + " User_Name_T =? ,"
                + "User_Name_E = ?,"
                + "User_Authority_Sts = ?,"
                + " User_Alive_Sts = ?,"
                + "Approved_Date = ?,"
                + "Hold_Date = ?,"
                + " Update_Date = ? ,"
                + "Company_Id = ?"

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
                uss.getCompanyId(),
                uss.getUserId()
                );
    }

    public void updatePassword(userSecurityEntity uss){
        String sql = " update  user_security set User_Password = MD5(?) "+
                     " where User_Id = ? and company_id = ?";
        db.add(sql,
                uss.getUserPassword(),
                uss.getUserId(),
                uss.getCompanyId());
    }

    public void remove(userSecurityEntity uss) {
        String sql = "delete from user_security where User_Id = ? and company_id = ?";
        db.update(sql, uss.getUserId(),uss.getCompanyId());
    }

    public ArrayList search(String sField, String sValue, String sOper, userSecurityEntity us) {
        String sql = " SELECT * FROM user_Security us "+
                     " where us.company_Id = ? ";

        if (sOper != null && sValue != null & sField != null) {
            sql = sql + " and " + Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        System.out.print("sql>>>>"+sql);
        List<Map<String, Object>> result = db.queryList(sql,us.getCompanyId());
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
              // uss.setCompanyId(Default.Str(result.get(i).get("Company_Id")));
               uss.setUserPassword(Default.Str(result.get(i).get("User_Password")));
               //uss.setUpdateDate((Timestamp)result.get(i).get("Update_Date"));


                list.add(uss);
            }
            return list;
        } else {
            return null;
        }
    }

    public ArrayList chkUserPass(userSecurityEntity us) {
        String sql = "select * from user_security us join company_master cm on us.Company_Id = cm.Company_Id  where us.user_id = ? and us.user_password = MD5(?) and us.Company_Id = ? and us.user_alive_sts = 'A' ";
        List<Map<String, Object>> result = db.queryList(sql, us.getUserId(), us.getUserPassword(), us.getCompanyId());
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            userSecurityEntity us2 = new userSecurityEntity();
            companyMasterEntity cm2 = new companyMasterEntity();
            us2.setUserId((String) result.get(0).get("User_Id"));
            us2.setUserPassword((String) result.get(0).get("User_Password"));
            us2.setUserNameT((String) result.get(0).get("User_Name_T"));
            us2.setUserNameE((String) result.get(0).get("User_Name_E"));
            us2.setUserAliveSts((String) result.get(0).get("User_Alive_Sts"));
            us2.setUserAuthoritySts((String) result.get(0).get("User_Authority_Sts"));
            cm2.setCompanyNameT((String) result.get(0).get("Company_Name_T"));
            us2.setCompanyMasterEntity(cm2);

            list.add(us2);
            
            return list;
        } else {
            return null;
        }
    }

    public Boolean checkPasswordById(userSecurityEntity us) {
        String sql = " select User_Password from user_security where user_id = ? and company_id = ? ";
        List<Map<String, Object>> result = db.queryList(sql, us.getUserId(),us.getCompanyId());
            String curPass = (String) result.get(0).get("User_Password");
            return us.getUserPassword().equals(curPass)?true:false;
    }

    public Boolean checkDuplicate(userSecurityEntity uss) {
        String sql = " select * from user_security where user_id = ? and company_id = ? ";
        List<Map<String, Object>> result = db.queryList(sql, uss.getUserId(),uss.getCompanyId());
        return !result.isEmpty() ? true : false;
    }
}
