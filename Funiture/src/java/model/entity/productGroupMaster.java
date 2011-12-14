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
public class productGroupMaster {
    private String productGroup;
    private String productGNameT;
    private String productGNameE;
    private String productLink;
    private String productLogo;
    private BigDecimal productIcon;
    private String productRemarkT;
    private String productRemarkE;
    private boolean productGDisplayFlag;
    private Timestamp createDate;
    private Timestamp updateDate;
    private String userId;

    /**
     * @return the productGroup
     */
    public String getProductGroup() {
        return productGroup;
    }

    /**
     * @param productGroup the productGroup to set
     */
    public void setProductGroup(String productGroup) {
        this.productGroup = productGroup;
    }

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
     * @return the productLink
     */
    public String getProductLink() {
        return productLink;
    }

    /**
     * @param productLink the productLink to set
     */
    public void setProductLink(String productLink) {
        this.productLink = productLink;
    }

    /**
     * @return the productLogo
     */
    public String getProductLogo() {
        return productLogo;
    }

    /**
     * @param productLogo the productLogo to set
     */
    public void setProductLogo(String productLogo) {
        this.productLogo = productLogo;
    }

    /**
     * @return the productIcon
     */
    public BigDecimal getProductIcon() {
        return productIcon;
    }

    /**
     * @param productIcon the productIcon to set
     */
    public void setProductIcon(BigDecimal productIcon) {
        this.productIcon = productIcon;
    }

   

    /**
     * @return the productGDisplayFlag
     */
    public boolean isProductGDisplayFlag() {
        return productGDisplayFlag;
    }

    /**
     * @param productGDisplayFlag the productGDisplayFlag to set
     */
    public void setProductGDisplayFlag(boolean productGDisplayFlag) {
        this.productGDisplayFlag = productGDisplayFlag;
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
}
