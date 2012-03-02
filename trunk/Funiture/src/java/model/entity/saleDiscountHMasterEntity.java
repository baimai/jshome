/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entity;

import org.apache.tomcat.util.buf.TimeStamp;

/**
 *
 * @author Achilles
 */
public class saleDiscountHMasterEntity {
    private int companyId;
    private int discountId;
    private String discountType;
    private String discountNameT;
    private String discountNameE;
    private TimeStamp createDate;
    private TimeStamp updateDate;
    private String userId;

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
     * @return the discountId
     */
    public int getDiscountId() {
        return discountId;
    }

    /**
     * @param discountId the discountId to set
     */
    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    /**
     * @return the discountType
     */
    public String getDiscountType() {
        return discountType;
    }

    /**
     * @param discountType the discountType to set
     */
    public void setDiscountType(String discountType) {
        this.discountType = discountType;
    }

    /**
     * @return the discountNameT
     */
    public String getDiscountNameT() {
        return discountNameT;
    }

    /**
     * @param discountNameT the discountNameT to set
     */
    public void setDiscountNameT(String discountNameT) {
        this.discountNameT = discountNameT;
    }

    /**
     * @return the discountNameE
     */
    public String getDiscountNameE() {
        return discountNameE;
    }

    /**
     * @param discountNameE the discountNameE to set
     */
    public void setDiscountNameE(String discountNameE) {
        this.discountNameE = discountNameE;
    }

    /**
     * @return the createDate
     */
    public TimeStamp getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate the createDate to set
     */
    public void setCreateDate(TimeStamp createDate) {
        this.createDate = createDate;
    }

    /**
     * @return the updateDate
     */
    public TimeStamp getUpdateDate() {
        return updateDate;
    }

    /**
     * @param updateDate the updateDate to set
     */
    public void setUpdateDate(TimeStamp updateDate) {
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
}
