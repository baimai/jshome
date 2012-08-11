/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

import java.sql.Date;
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
    private Timestamp createDate;
    private Timestamp updateDate;
    private String userId;
    private int unitId;
    private Date receiveDate;
    private productGroupMasterEntity productGroupMasterEntity;
    private productDetailMasterEntity  productDetailMasterEntity;
    private unitMasterEntity  unitMasterEntity;
    private String productDetailCode ;
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
     * @return the receiveDate
     */
    public Date getReceiveDate() {
        return receiveDate;
    }

    /**
     * @param receiveDate the receiveDate to set
     */
    public void setReceiveDate(Date receiveDate) {
        this.receiveDate = receiveDate;
    }

    /**
     * @return the productGroupMasterEntity
     */
    public productGroupMasterEntity getProductGroupMasterEntity() {
        return productGroupMasterEntity;
    }

    /**
     * @param productGroupMasterEntity the productGroupMasterEntity to set
     */
    public void setProductGroupMasterEntity(productGroupMasterEntity productGroupMasterEntity) {
        this.productGroupMasterEntity = productGroupMasterEntity;
    }

    /**
     * @return the productDetailMasterEntity
     */
    public productDetailMasterEntity getProductDetailMasterEntity() {
        return productDetailMasterEntity;
    }

    /**
     * @param productDetailMasterEntity the productDetailMasterEntity to set
     */
    public void setProductDetailMasterEntity(productDetailMasterEntity productDetailMasterEntity) {
        this.productDetailMasterEntity = productDetailMasterEntity;
    }

    /**
     * @return the unitMasterEntity
     */
    public unitMasterEntity getUnitMasterEntity() {
        return unitMasterEntity;
    }

    /**
     * @param unitMasterEntity the unitMasterEntity to set
     */
    public void setUnitMasterEntity(unitMasterEntity unitMasterEntity) {
        this.unitMasterEntity = unitMasterEntity;
    }

    /**
     * @return the productDetailCode
     */
    public String getProductDetailCode() {
        return productDetailCode;
    }

    /**
     * @param productDetailCode the productDetailCode to set
     */
    public void setProductDetailCode(String productDetailCode) {
        this.productDetailCode = productDetailCode;
    }


  

}
