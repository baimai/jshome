/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entity;


import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 *
 * @author Jik
 */

public class memberGradeMasterEntity {
 private int companyId ;
   private String memberGrade;
   private String gradeNameT;
   private String gradeNameE;
   private BigDecimal discountRate;
   private int paymentTerm;
   private Timestamp createDate;
   private Timestamp updateDate;
   private String userId;
   private int memberGradeId;
    /**
     * @return the companyId
     */
    public int getCompanyId() {
        return companyId;
    }

    /**
     * @param companyId the companyId to set
     */
    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    /**
     * @return the memberGrade
     */
    public String getMemberGrade() {
        return memberGrade;
    }

    /**
     * @param memberGrade the memberGrade to set
     */
    public void setMemberGrade(String memberGrade) {
        this.memberGrade = memberGrade;
    }

    /**
     * @return the gradeNameT
     */
    public String getGradeNameT() {
        return gradeNameT;
    }

    /**
     * @param gradeNameT the gradeNameT to set
     */
    public void setGradeNameT(String gradeNameT) {
        this.gradeNameT = gradeNameT;
    }

    /**
     * @return the gradeNameE
     */
    public String getGradeNameE() {
        return gradeNameE;
    }

    /**
     * @param gradeNameE the gradeNameE to set
     */
    public void setGradeNameE(String gradeNameE) {
        this.gradeNameE = gradeNameE;
    }

    /**
     * @return the discountRate
     */
    public BigDecimal getDiscountRate() {
        return discountRate;
    }

    /**
     * @param discountRate the discountRate to set
     */
    public void setDiscountRate(BigDecimal discountRate) {
        this.discountRate = discountRate;
    }

    /**
     * @return the paymentTerm
     */
    public int getPaymentTerm() {
        return paymentTerm;
    }

    /**
     * @param paymentTerm the paymentTerm to set
     */
    public void setPaymentTerm(int paymentTerm) {
        this.paymentTerm = paymentTerm;
    }

    /**
     * @return the createDate
     */
    public Timestamp getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate the createDate to set
     */
    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    /**
     * @return the updateDate
     */
    public Timestamp getUpdateDate() {
        return updateDate;
    }

    /**
     * @param updateDate the updateDate to set
     */
    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    /**
     * @return the userId
     */
    public String getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * @return the memberGradeId
     */
    public int getMemberGradeId() {
        return memberGradeId;
    }

    /**
     * @param memberGradeId the memberGradeId to set
     */
    public void setMemberGradeId(int memberGradeId) {
        this.memberGradeId = memberGradeId;
    }

    private static class DateTime {

        public DateTime() {
        }
    }
  

}
