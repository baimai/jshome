/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 *
 * @author Achilles
 */
public class saleDiscountDMasterEntity {
    private int discountDetailId;
    private int discountId;
    private int seqNo;
    private int discountFrom;
    private int discountTo;
    private BigDecimal discount;
    private int salesVolumn;
    private int getFreeVolumn;
    private Timestamp createDate;
    private Timestamp updateDate;
    private String userId;

    /**
     * @return the discountDetailId
     */
    public int getDiscountDetailId() {
        return discountDetailId;
    }

    /**
     * @param discountDetailId the discountDetailId to set
     */
    public void setDiscountDetailId(int discountDetailId) {
        this.discountDetailId = discountDetailId;
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
     * @return the seqNo
     */
    public int getSeqNo() {
        return seqNo;
    }

    /**
     * @param seqNo the seqNo to set
     */
    public void setSeqNo(int seqNo) {
        this.seqNo = seqNo;
    }

    /**
     * @return the discountFrom
     */
    public int getDiscountFrom() {
        return discountFrom;
    }

    /**
     * @param discountFrom the discountFrom to set
     */
    public void setDiscountFrom(int discountFrom) {
        this.discountFrom = discountFrom;
    }

    /**
     * @return the discountTo
     */
    public int getDiscountTo() {
        return discountTo;
    }

    /**
     * @param discountTo the discountTo to set
     */
    public void setDiscountTo(int discountTo) {
        this.discountTo = discountTo;
    }

    /**
     * @return the discount
     */
    public BigDecimal getDiscount() {
        return discount;
    }

    /**
     * @param discount the discount to set
     */
    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    /**
     * @return the salesVolumn
     */
    public int getSalesVolumn() {
        return salesVolumn;
    }

    /**
     * @param salesVolumn the salesVolumn to set
     */
    public void setSalesVolumn(int salesVolumn) {
        this.salesVolumn = salesVolumn;
    }

    /**
     * @return the getFreeVolumn
     */
    public int getGetFreeVolumn() {
        return getFreeVolumn;
    }

    /**
     * @param getFreeVolumn the getFreeVolumn to set
     */
    public void setGetFreeVolumn(int getFreeVolumn) {
        this.getFreeVolumn = getFreeVolumn;
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
}
