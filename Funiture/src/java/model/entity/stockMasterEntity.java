/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

import java.sql.Timestamp;

/**
 *
 * @author Achilles
 */
public class stockMasterEntity {

    private int productDetailId;
    private int companyId;
    private int stockId;
    private int quantity;
    private Timestamp Receive_Date;
    private Timestamp createDate;
    private Timestamp updateDate;
    private String userId;
    private int unitId;

    /**
     * @return the productDetailId
     */
    public int getProductDetailId() {
        return productDetailId;
    }

    /**
     * @param productDetailId the productDetailId to set
     */
    public void setProductDetailId(int productDetailId) {
        this.productDetailId = productDetailId;
    }

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
     * @return the stockId
     */
    public int getStockId() {
        return stockId;
    }

    /**
     * @param stockId the stockId to set
     */
    public void setStockId(int stockId) {
        this.stockId = stockId;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
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
     * @return the unitId
     */
    public int getUnitId() {
        return unitId;
    }

    /**
     * @param unitId the unitId to set
     */
    public void setUnitId(int unitId) {
        this.unitId = unitId;
    }

    /**
     * @return the Receive_Date
     */
    public Timestamp getReceive_Date() {
        return Receive_Date;
    }

    /**
     * @param Receive_Date the Receive_Date to set
     */
    public void setReceive_Date(Timestamp Receive_Date) {
        this.Receive_Date = Receive_Date;
    }
}
