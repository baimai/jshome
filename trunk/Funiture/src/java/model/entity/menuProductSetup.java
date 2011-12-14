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
public class menuProductSetup {
    
    private String menuCode;
    private String productCode;
    private String productRemarkT;
    private String productRemarkE;
    private Timestamp createDate;
    private Timestamp updateDate;
    private String UserId;

    /**
     * @return the menuCode
     */
    public String getMenuCode() {
        return menuCode;
    }

    /**
     * @param menuCode the menuCode to set
     */
    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode;
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
    
}
