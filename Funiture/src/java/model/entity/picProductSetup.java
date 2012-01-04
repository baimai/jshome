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
public class picProductSetup {
    
    private String picCode;
    private int picId;
    private int productDetailId;
    private String companyCode;
    private int companyId;
    private String picNameT;
    private String picNameE;
    private String productCode;
    private String productRemarkT;
    private String productRemarkE;
    private Timestamp createDate;
    private Timestamp updateDate;
    private String UserId;

    /**
     * @return the menuCode
     */
    public String getPicCode() {
        return picCode;
    }

    /**
     * @param menuCode the menuCode to set
     */
    public void setPicCode(String picCode) {
        this.picCode = picCode;
    }

    /**
     * @return the productCode
     */
    public String getProductCode() {
        return productCode;
    }

    /**
     * @param productCode the productCode to set
     */
    public void setProductCode(String productCode) {
        this.productCode = productCode;
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
     * @return the UserId
     */
    public String getUserId() {
        return UserId;
    }

    /**
     * @param UserId the UserId to set
     */
    public void setUserId(String UserId) {
        this.UserId = UserId;
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
     * @return the picNameT
     */
    public String getPicNameT() {
        return picNameT;
    }

    /**
     * @param picNameT the picNameT to set
     */
    public void setPicNameT(String picNameT) {
        this.picNameT = picNameT;
    }

    /**
     * @return the picNameE
     */
    public String getPicNameE() {
        return picNameE;
    }

    /**
     * @param picNameE the picNameE to set
     */
    public void setPicNameE(String picNameE) {
        this.picNameE = picNameE;
    }

    /**
     * @return the picId
     */
    public int getPicId() {
        return picId;
    }

    /**
     * @param picId the picId to set
     */
    public void setPicId(int picId) {
        this.picId = picId;
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
    
}
