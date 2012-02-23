/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import model.entity.memberMasterEntity;
import util.Column;
import util.Default;
import util.Operation;

/**
 *
 * @author Jik
 */
public class memberMasterTable {

    private Database db;

    public memberMasterTable(Database db) {
        this.db = db;
    }

    public void add(memberMasterEntity mb) {

        String sql = "insert into member_master "
                + "( Member_Login,Member_Password,Member_Reg_Date,Member_Name,"
                + "  Member_SurName,Member_Com_Name,Member_Name_Abbr,Member_Addr1,"
                + "  Member_Addr2,Member_Distinct,Member_Amphur,Member_Province,"
                + "  Member_Pstcode,Member_Tel1,Member_Tel2,Member_Fax1,"
                + "  Member_Fax2,Member_Mobile1,Member_Mobile2,Member_Email1,"
                + "  Member_Email2,Member_Grade,Member_logo_loc,Member_Status,"
                + "  Create_Date,User_Id,Company_Id )"
                + "  values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        db.add(sql,
                mb.getMemberLogin(),
                mb.getMemberPassword(),
                mb.getMemberRegDate(),
                mb.getMemberName(),
                mb.getMemberSurName(),
                mb.getMemberComName(),
                mb.getMemberNameAbbr(),
                mb.getMemberAddr1(),
                mb.getMemberAddr2(),
                mb.getMemberDistinct(),
                mb.getMemberAmphur(),
                mb.getMemberProvince(),
                mb.getMemberPstcode(),
                mb.getMemberTel1(),
                mb.getMemberTel2(),
                mb.getMemberFax1(),
                mb.getMemberFax2(),
                mb.getMemberMobile1(),
                mb.getMemberMobile2(),
                mb.getMemberEmail1(),
                mb.getMemberEmail2(),
                mb.getMemberGrade(),
                mb.getMemberlogoloc(),
                mb.getMemberStatus(),
                mb.getCreateDate(),
                mb.getUserId(),
                mb.getCompanyId());
    }

    public void update(memberMasterEntity mb) {
        String sql = "update member_master set "
                + "  Member_Login=?,Member_Password=?,Member_Reg_Date=?,Member_Name=?,"
                + "  Member_SurName=?,Member_Com_Name=?,Member_Name_Abbr=?,Member_Addr1=?,"
                + "  Member_Addr2=?,Member_Distinct=?,Member_Amphur=?,Member_Province=?,"
                + "  Member_Pstcode=?,Member_Tel1=?,Member_Tel2=?,Member_Fax1=?,"
                + "  Member_Fax2=?,Member_Mobile1=?,Member_Mobile2=?,Member_Email1=?,"
                + "  Member_Email2=?,Member_Grade=?,Member_logo_loc=?,Member_Status=?,"
                + "  Member_App_Date=?,Create_Date=? "
                + "  where Member_Id = ? ";

        db.add(sql,
                mb.getMemberLogin(),
                mb.getMemberPassword(),
                mb.getMemberRegDate(),
                mb.getMemberName(),
                mb.getMemberSurName(),
                mb.getMemberComName(),
                mb.getMemberNameAbbr(),
                mb.getMemberAddr1(),
                mb.getMemberAddr2(),
                mb.getMemberDistinct(),
                mb.getMemberAmphur(),
                mb.getMemberProvince(),
                mb.getMemberPstcode(),
                mb.getMemberTel1(),
                mb.getMemberTel2(),
                mb.getMemberFax1(),
                mb.getMemberFax2(),
                mb.getMemberMobile1(),
                mb.getMemberMobile2(),
                mb.getMemberEmail1(),
                mb.getMemberEmail2(),
                mb.getMemberGrade(),
                mb.getMemberlogoloc(),
                mb.getMemberStatus(),
                mb.getMemberAppdate(),
                mb.getCreateDate(),
                mb.getMemberId());
    }
    public void adminUpdate(memberMasterEntity mb){
        String sql = " update member_master set member_status = ?"+
                     " where Member_Id = ?";
        db.add(sql,mb.getMemberStatus(),mb.getMemberId());
    }

    public ArrayList search(String sField, String sValue, String sOper,int Company_Id) {
        String sql = "SELECT * FROM member_master mb"+
                  " where mb.Company_Id = ?";

        if (sOper != null && sValue != null & sField != null) {
            sql = sql + " and " + Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        List<Map<String, Object>> result = db.queryList(sql,Company_Id);
        ArrayList list = new ArrayList();
        if (result.size() > 0) {
            for (int i = 0; i < result.size(); i++) {
                memberMasterEntity mb = new memberMasterEntity();
                mb.setMemberLogin(Default.Str(result.get(i).get("Member_Login")));
                mb.setMemberName(Default.Str(result.get(i).get("Member_Name")));
                mb.setMemberSurName(Default.Str(result.get(i).get("Member_SurName")));
                mb.setMemberComName(Default.Str(result.get(i).get("Member_Com_Name")));
                mb.setMemberStatus(Default.Str(result.get(i).get("Member_Status")));
                mb.setMemberAppdate((Date) result.get(i).get("Member_App_Date"));
                mb.setMemberRegDate((Date) result.get(i).get("Member_Reg_Date"));
                mb.setMemberId((Integer) result.get(i).get("Member_Id"));
                mb.setCompanyId((Integer) result.get(i).get("Company_Id"));
                list.add(mb);
            }
            return list;
        } else {
            return null;
        }

    }

    public Integer getMemberId(String memberLogin,int Company_Id) {
        String sql = "select * from member_master where member_login = ? and Company_Id = ?";
        List<Map<String, Object>> result = db.queryList(sql, memberLogin,Company_Id);
        if (!result.isEmpty()) {
            return (Integer) result.get(0).get("Member_Login");
        } else {
            return 0;
        }
    }

    public Boolean chkMemberLogin(String memberLogin,int Company_Id) {
        String sql = "select * from member_master where member_login = ? and Company_Id = ?";
        List<Map<String, Object>> result = db.queryList(sql, memberLogin,Company_Id);
        if (result.isEmpty()) {
            return false;
        } else {
            return true;
        }
    }

    public ArrayList chkUserPass(memberMasterEntity mm,int Company_Id) {
        String sql = "select * from member_master where member_login = ? and member_password = ? and Company_Id = ?";
        List<Map<String, Object>> result = db.queryList(sql, mm.getMemberLogin(), mm.getMemberPassword(),Company_Id);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            memberMasterEntity mb = new memberMasterEntity();
            mb.setMemberLogin(Default.Str(result.get(0).get("Member_Login")));
            mb.setMemberName(Default.Str(result.get(0).get("Member_Name")));
            mb.setMemberSurName(Default.Str(result.get(0).get("Member_SurName")));
            mb.setMemberComName(Default.Str(result.get(0).get("Member_Com_Name")));
            mb.setMemberNameAbbr(Default.Str(result.get(0).get("Member_Name_Abbr")));
            mb.setMemberId((Integer) result.get(0).get("Member_Id"));
            list.add(mb);
            return list;
        }else{
            return null;
        }
    }
    public Integer getMemberGradeId(String memberGradeId, int Company_Id) {
        String sql = "select * from member_grade_master mbg where mbg.Member_Grade_Id = ? and mbg.Company_Id = ?";
        List<Map<String, Object>> result = db.queryList(sql, memberGradeId, Company_Id);
        if (!result.isEmpty()) {
            return (Integer) result.get(0).get("Member_Id");
        } else {
            return 0;
        }

    }
}
