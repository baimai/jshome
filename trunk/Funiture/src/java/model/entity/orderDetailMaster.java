/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entity;

import java.sql.Timestamp;

/**
 *
 * @author Baimai
 */
public class orderDetailMaster {
    private int companyId;
    private int orderId;
    private int productDetailI;
    private int productVolumn;
    private double productCost;
    private double productAmount;
    private Timestamp createDate;
    private Timestamp updateDate;
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
     * @return the orderId
     */
    public int getOrderId() {
        return orderId;
    }

    /**
     * @param orderId the orderId to set
     */
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    /**
     * @return the productDetailI
     */
    public int getProductDetailI() {
        return productDetailI;
    }

    /**
     * @param productDetailI the productDetailI to set
     */
    public void setProductDetailI(int productDetailI) {
        this.productDetailI = productDetailI;
    }

    /**
     * @return the productVolumn
     */
    public int getProductVolumn() {
        return productVolumn;
    }

    /**
     * @param productVolumn the productVolumn to set
     */
    public void setProductVolumn(int productVolumn) {
        this.productVolumn = productVolumn;
    }

    /**
     * @return the productCost
     */
    public double getProductCost() {
        return productCost;
    }

    /**
     * @param productCost the productCost to set
     */
    public void setProductCost(double productCost) {
        this.productCost = productCost;
    }

    /**
     * @return the productAmount
     */
    public double getProductAmount() {
        return productAmount;
    }

    /**
     * @param productAmount the productAmount to set
     */
    public void setProductAmount(double productAmount) {
        this.productAmount = productAmount;
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
