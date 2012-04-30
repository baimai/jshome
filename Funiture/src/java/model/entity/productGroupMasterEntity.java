/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Achilles
 */
public class productGroupMasterEntity {
    private String productGroupCode;
    private String productGNameT;
    private String productGNameE;
    private String productPicLoc;
    private String productIconLoc;
    private String productRemarkT;
    private String productRemarkE;
    private String productGDisplayFlag;
    private Timestamp createDate;
    private Timestamp updateDate;
    private String userId;
    private int companyId;
    private int productGroupId;
    private String companyCode;
    private productDetailMasterEntity productDetailMasterEntity;
 

    /**
     * @return the productGNameT
     */
    public String getProductGNameT() {
        return productGNameT;
    }

    /**
     * @param productGNameT the productGNameT to set
     */
    public void setProductGNameT(String productGNameT) {
        this.productGNameT = productGNameT;
    }

    /**
     * @return the productGNameE
     */
    public String getProductGNameE() {
        return productGNameE;
    }

    /**
     * @param productGNameE the productGNameE to set
     */
    public void setProductGNameE(String productGNameE) {
        this.productGNameE = productGNameE;
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
     * @return the productRemarkT
     */
    public String getProductRemarkT() {
        return productRemarkT;
    }

    /**
     * @param productRemarkT the productRemarkT to set
     */
    public void setProductRemarkT(String productRemarkT) {
        this.productRemarkT = productRemarkT;
    }

    /**
     * @return the productRemarkE
     */
    public String getProductRemarkE() {
        return productRemarkE;
    }

    /**
     * @param productRemarkE the productRemarkE to set
     */
    public void setProductRemarkE(String productRemarkE) {
        this.productRemarkE = productRemarkE;
    }

    /**
     * @return the productGroupCode
     */
    public String getProductGroupCode() {
        return productGroupCode;
    }

    /**
     * @param productGroupCode the productGroupCode to set
     */
    public void setProductGroupCode(String productGroupCode) {
        this.productGroupCode = productGroupCode;
    }

    /**
     * @return the productPicLoc
     */
    public String getProductPicLoc() {
        return productPicLoc;
    }

    /**
     * @param productPicLoc the productPicLoc to set
     */
    public void setProductPicLoc(String productPicLoc) {
        this.productPicLoc = productPicLoc;
    }

    /**
     * @return the productIconLoc
     */
    public String getProductIconLoc() {
        return productIconLoc;
    }

    /**
     * @param productIconLoc the productIconLoc to set
     */
    public void setProductIconLoc(String productIconLoc) {
        this.productIconLoc = productIconLoc;
    }

    /**
     * @return the productGDisplayFlag
     */
    public String getProductGDisplayFlag() {
        return productGDisplayFlag;
    }

    /**
     * @param productGDisplayFlag the productGDisplayFlag to set
     */
    public void setProductGDisplayFlag(String productGDisplayFlag) {
        this.productGDisplayFlag = productGDisplayFlag;
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
     * @return the productGroupId
     */
    public int getProductGroupId() {
        return productGroupId;
    }

    /**
     * @param productGroupId the productGroupId to set
     */
    public void setProductGroupId(int productGroupId) {
        this.productGroupId = productGroupId;
    }

    /**
     * @return the companyCode
     */
    public String getCompanyCode() {
        return companyCode;
    }

    /**
     * @param companyCode the companyCode to set
     */
    public void setCompanyCode(String companyCode) {
        this.companyCode = companyCode;
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
}
