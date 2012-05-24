/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import model.entity.memberGradeMasterEntity;
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
                + "  Member_Email2,Member_Grade_Id,Member_logo_loc,Member_Status,"
                + "  Create_Date,User_Id,Company_Id )"
                + "  values(?,MD5(?),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

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
                mb.getMemberGradeId(),
                mb.getMemberlogoloc(),
                mb.getMemberStatus(),
                mb.getCreateDate(),
                mb.getUserId(),
                mb.getCompanyId());
    }

public void remove(memberMasterEntity mb) {
        String sql = "delete from Member_Master where Member_Id = ?";
        db.remove(sql, mb.getMemberId());
    }
    public void update(memberMasterEntity mb) {
        String sql = "update member_master set "
                + "  Member_Name=?,"
                + "  Member_SurName=?,Member_Com_Name=?,Member_Name_Abbr=?,Member_Addr1=?,"
                + "  Member_Addr2=?,Member_Distinct=?,Member_Amphur=?,Member_Province=?,"
                + "  Member_Pstcode=?,Member_Tel1=?,Member_Tel2=?,Member_Fax1=?,"
                + "  Member_Fax2=?,Member_Mobile1=?,Member_Mobile2=?,Member_Email1=?,"
                + "  Member_Email2=?,Member_Grade_Id=?,Member_logo_loc=?,Member_Status=?,"
                + "  Update_Date=? "
                + "  where Member_Id = ? ";

        db.add(sql,
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
                mb.getMemberGradeId(),
                mb.getMemberlogoloc(),
                mb.getMemberStatus(),
                mb.getUpdateDate(),
                mb.getMemberId());
    }

    public void adminUpdate(memberMasterEntity mb) {
        String sql = " update member_master set member_status = ?,member_grade_id = ?,member_app_date = ?"
                + " where Member_Id = ?";
        db.add(sql, mb.getMemberStatus(),mb.getMemberGradeId() ,mb.getMemberAppdate(), mb.getMemberId());
    }

    public void editPassword(memberMasterEntity mb) {
        String sql = " update member_master set member_password = MD5(?),Update_Date = ?"
                + " where Member_Id = ?";
        db.add(sql, mb.getMemberPassword(), mb.getUpdateDate(), mb.getMemberId());
    }

    public ArrayList search(String sField, String sValue, String sOper, int Company_Id,int start ,int limit,String status,String date) {
        String sql = "SELECT *,mb.company_id as com_id,mb.member_grade_id as grade_id FROM member_master mb "
                + " left join member_grade_master mgm on mgm.member_grade_id = mb.member_grade_id "
                + " where mb.Company_Id = ? ";

        if(status!=null&&!status.equals("")){
            sql = sql + " and mb.member_status = '"+status+"' ";
        }
        if(date!=null){
            sql = sql + " and date_format(mb.member_reg_date,'%Y-%m-%d') = '"+date+"' ";
        }

        if (sOper != null && sValue != null & sField != null) {
            sql = sql + " and " + Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        sql = sql + " limit ?,?";
        List<Map<String, Object>> result = db.queryList(sql, Company_Id,start,limit);
        ArrayList list = new ArrayList();
        if (result.size() > 0) {
            for (int i = 0; i < result.size(); i++) {
                memberMasterEntity mb = new memberMasterEntity();
                memberGradeMasterEntity mgm = new memberGradeMasterEntity();
                mgm.setMemberGrade(Default.Str(result.get(i).get("Member_Grade")));
                mgm.setMemberGradeId((Integer) result.get(i).get("grade_id"));
                mb.setMemberGradeMasterEntity(mgm);
                mb.setMemberLogin(Default.Str(result.get(i).get("Member_Login")));
                mb.setMemberName(Default.Str(result.get(i).get("Member_Name")));
                mb.setMemberSurName(Default.Str(result.get(i).get("Member_SurName")));
                mb.setMemberNameAbbr(Default.Str(result.get(i).get("Member_SurName")));
                mb.setMemberComName(Default.Str(result.get(i).get("Member_Name_Abbr")));
                mb.setMemberAddr1(Default.Str(result.get(i).get("Member_Addr1")));
                mb.setMemberAddr2(Default.Str(result.get(i).get("Member_Addr2")));
                mb.setMemberStatus(Default.Str(result.get(i).get("Member_Status")));
                mb.setMemberAppdate((Date) result.get(i).get("Member_App_Date"));
                mb.setMemberRegDate((Date) result.get(i).get("Member_Reg_Date"));
                mb.setMemberId((Integer) result.get(i).get("Member_Id"));
                mb.setCompanyId((Integer) result.get(i).get("com_id"));
                list.add(mb);
            }
            return list;
        } else {
            return null;
        }

    }

    public int countAll(int company_id){
         String sql =  "SELECT count(*) as COUNT FROM member_master mb"
                         + " where mb.Company_Id = ?";
         List<Map<String, Object>> result = db.queryList(sql,company_id);
         return !result.isEmpty()?Integer.valueOf(result.get(0).get("COUNT").toString()):0;
    }

    public Integer getMemberId(memberMasterEntity mm) {
        String sql = "select * from member_master where member_login = ? and Company_Id = ?";
        List<Map<String, Object>> result = db.queryList(sql, mm.getMemberLogin(), mm.getCompanyId());
        return !result.isEmpty()?(Integer) result.get(0).get("Member_Login"):0;
    }

    public Boolean chkMemberLogin(memberMasterEntity mm) {
        String sql = "select * from member_master where member_login = ? and Company_Id = ?";
        List<Map<String, Object>> result = db.queryList(sql, mm.getMemberLogin(), mm.getCompanyId());
        return result.isEmpty()?false:true;
    }

    public ArrayList chkUserPass(memberMasterEntity mm) {
        String sql = "select * from member_master where member_login = ? and member_password = MD5(?) and Company_Id = ? and member_status IN ('Y')";
        List<Map<String, Object>> result = db.queryList(sql, mm.getMemberLogin(), mm.getMemberPassword(), mm.getCompanyId());
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
        } else {
            return null;
        }
    }

    public Integer getMemberGradeId(String memberGradeId, int Company_Id) {
        String sql = "select * from member_grade_master mbg where mbg.Member_Grade_Id = ? and mbg.Company_Id = ?";
        List<Map<String, Object>> result = db.queryList(sql, memberGradeId, Company_Id);
        return !result.isEmpty()?(Integer) result.get(0).get("Member_Id"):0;
    }

    public ArrayList getProvince(memberMasterEntity mm) {
        String sql = " select * "
                + " from member_master mm  "
                + " where mm.member_id = ? ";
        List<Map<String, Object>> result = db.queryList(sql, mm.getMemberId());
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            memberMasterEntity mm2 = new memberMasterEntity();
            mm2.setMemberProvince(Default.Str(result.get(0).get("Member_Province")));
            mm2.setMemberAmphur(Default.Str(result.get(0).get("Member_Amphur")));
            mm2.setMemberDistinct(Default.Str(result.get(0).get("Member_Distinct")));
            list.add(mm2);
            return list;
        } else {
            return null;
        }
    }

    public memberMasterEntity searchByUserId(memberMasterEntity mm) {
        String sql = " select * from member_master mm"
                + " left join member_grade_master mgm on mgm.member_grade_id = mm.member_grade_id "
                + " where mm.member_id = ?";

        List<Map<String, Object>> result = db.queryList(sql, mm.getMemberId());
        if (!result.isEmpty()) {
            memberMasterEntity mm2 = new memberMasterEntity();
            memberGradeMasterEntity mgm = new memberGradeMasterEntity();
            mgm.setDiscountRate(Default.BigDecimal(result.get(0).get("Discount_Rate")));
            mgm.setMemberPriceFlag(Default.Str(result.get(0).get("Member_Price_Flag")) );
            mm2.setMemberGradeMasterEntity(mgm);
            mm2.setMemberLogin((String) result.get(0).get("Member_Login"));
            return mm2;
        } else {
            return null;
        }
    }
//
    public Boolean checkChild(memberMasterEntity mm) {
        String sql = " select count(*) as COUNT from order_header_master ohm "+
                     " join member_master mm on mm.member_id = ohm.member_id "+
                     " where ohm.member_id = ? ";
        List<Map<String, Object>> result = db.queryList(sql, mm.getMemberId());
        int checkChild = Integer.valueOf(result.get(0).get("COUNT").toString());
        return checkChild == 0 ? false : true;
    }
    //
}
