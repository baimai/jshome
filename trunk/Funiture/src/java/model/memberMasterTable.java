/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import model.entity.memberMasterEntity;

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

        String sql = "insert into color_code_master "
                + "( Member_Login,Member_Password,Member_Reg_Date,Member_Name,"
                + "  Member_SurName,Member_Com_Name,Member_Name_Abbr,Member_Addr1"
                + "  ,Member_Addr2,Member_Distinct,Member_Amphur,Member_Province"
                + " ,Member_Pstcode,Member_Tel1,Member_Tel2,Member_Fax1"
                + ", Member_Fax2,Member_Mobile1,Member_Mobile2,Member_Email1"
                + " ,Member_Email2,Member_Grade,Member_logo_loc,Member_Status"
                + "  Create_Date,User_Id )"
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
                mb.getMemberAppdate(),
                mb.getCreateDate(),
                mb.getUserId());
    }
}
