/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.memberGradeMasterEntity;
import util.Column;
import util.Default;
import util.Operation;

/**
 *
 * @author Jik
 */
public class memberGradeMasterTable {

    private Database db;

    public memberGradeMasterTable(Database db) {
        this.db = db;
    }

    public void add(memberGradeMasterEntity mgm) {
        String sql = "insert into Member_Grade_Master "
                + "( Member_Grade_Id,"
                + "Company_Id,"
                + "Member_Grade,"
                + "Grade_Name_T,"
                + "Grade_Name_E,"
                + "Discount_Rate,"
                + "Payment_Term,"
                + "Member_Price_Flag,"
                + "Create_Date,"
                + "User_Id)"
                + "values(?,?,?,?,?,?,?,?,?,?)";
        db.add(sql,
                mgm.getMemberGradeId(),
                mgm.getCompanyId(),
                mgm.getMemberGrade(),
                mgm.getGradeNameT(),
                mgm.getGradeNameE(),
                mgm.getDiscountRate(),
                mgm.getPaymentTerm(),
                mgm.getMemberPriceFlag(),
                mgm.getCreateDate(),
                mgm.getUserId());
    }

    public void update(memberGradeMasterEntity mgm) {
        String sql = "update Member_Grade_Master set "
                + " Company_Id=?,"
                + "Member_Grade=?,"
                + "Grade_Name_T=? ,"
                + "Grade_Name_E=?,"
                + "Discount_Rate=?,"
                + "Payment_Term=?,"
                + "Member_Price_Flag=?,"
                + "Update_Date=?,"
                + "User_Id=?"
                + "where Member_Grade_Id=? ";
        db.add(sql,
                mgm.getCompanyId(),
                mgm.getMemberGrade(),
                mgm.getGradeNameT(),
                mgm.getGradeNameE(),
                mgm.getDiscountRate(),
                mgm.getPaymentTerm(),
                mgm.getMemberPriceFlag(),
                mgm.getUpdateDate(),
                mgm.getUserId(),
                mgm.getMemberGradeId());

    }

    public void remove(memberGradeMasterEntity mgm) {
        String sql = "delete from Member_Grade_Master where Member_Grade_Id = ?";
        db.remove(sql, mgm.getMemberGradeId());
    }

    public ArrayList search(String sField, String sValue, String sOper, int Company_Id ) {
        String sql = "SELECT * FROM Member_Grade_Master "
                  + " where Company_Id = ? ";

         if (sOper != null && sValue != null & sField != null) {
            sql = sql + " where " + Column.getSQLColumn(sField) + Operation.getSQLOperation(sOper, sValue);
        }
        // sql = sql + " limit ?,?";
       System.out.print("sql>>>>" + sql);
        List<Map<String, Object>> result = db.queryList(sql,Company_Id);
        ArrayList list = new ArrayList();
        // System.out.print("sql>>>>" + sql);
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                memberGradeMasterEntity mgm = new memberGradeMasterEntity();
                mgm.setMemberGrade(Default.Str(result.get(i).get("Member_Grade")));
                mgm.setGradeNameT(Default.Str(result.get(i).get("Grade_Name_T")));
                mgm.setGradeNameE(Default.Str(result.get(i).get("Grade_Name_E")));
                mgm.setDiscountRate(Default.BigDecimal(result.get(i).get("Discount_Rate")));
                mgm.setPaymentTerm((Integer) result.get(i).get("Payment_Term"));
               
                mgm.setMemberPriceFlag(Default.Str(result.get(i).get("Member_Price_Flag")));
                mgm.setMemberGradeId((Integer) result.get(i).get("Member_Grade_Id"));
                list.add(mgm);
               //  System.out.println("getMemberGrade" + mg.getMemberGrade());

                 
            }
            return list;
        } else {
            return null;
        }

    }

    public Integer getMemberGradeId(String memberGrade_Id, int Company_Id) {
        String sql = "select * from member_grade_master mbg where mbg.Member_Grade_Id = ? and mbg.Company_Id = ?";
        List<Map<String, Object>> result = db.queryList(sql, memberGrade_Id, Company_Id);
        return !result.isEmpty() ? (Integer) result.get(0).get("Member_Grade_Id") : 0;
    }

    public Integer getMemberGrade(String member_Grade, int Company_Id) {
        String sql = "select * from member_grade_master mbg where mbg.Member_Grade = ? and mbg.Company_Id = ?";
        List<Map<String, Object>> result = db.queryList(sql, member_Grade, Company_Id);
        return !result.isEmpty() ? (Integer) result.get(0).get("Member_Grade_Id") : 0;
    }

    public Boolean checkDuplicate(memberGradeMasterEntity mgm) {
        String sql = " select * from member_grade_master where member_grade = ?";
        List<Map<String, Object>> result = db.queryList(sql, mgm.getMemberGrade());
        return !result.isEmpty() ? true : false;
    }

    public Boolean checkChild(memberGradeMasterEntity mgm) {
        String sql = " select count(*) as COUNT from member_grade_master mgm "
                + " join member_master mm on mm.member_grade_id = mgm.member_grade_id "
                + " where mgm.member_grade_id = ? ";
        List<Map<String, Object>> result = db.queryList(sql, mgm.getMemberGradeId());
        int checkChild = Integer.valueOf(result.get(0).get("COUNT").toString());
        return checkChild == 0 ? false : true;
    }
}
