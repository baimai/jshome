/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entity;

import java.sql.Timestamp;

/**
 *
 * @author Jikng
 */
public class colorCodeMaster {
private String colorCode;
    private String colorNameE;
    private String colorNameT;
    private Integer colorId;
    private String userId;
    private Timestamp createDate;
    private Timestamp updateDate;

    /**
     * @return the colorCode
     */
    public String getColorCode() {
        return colorCode;
    }

    /**
     * @param colorCode the colorCode to set
     */
    public void setColorCode(String colorCode) {
        this.colorCode = colorCode;
    }

    /**
     * @return the colorNameE
     */
    public String getColorNameE() {
        return colorNameE;
    }

    /**
     * @param colorNameE the colorNameE to set
     */
    public void setColorNameE(String colorNameE) {
        this.colorNameE = colorNameE;
    }

    /**
     * @return the colorNameT
     */
    public String getColorNameT() {
        return colorNameT;
    }

    /**
     * @param colorNameT the colorNameT to set
     */
    public void setColorNameT(String colorNameT) {
        this.colorNameT = colorNameT;
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
     * @return the colorId
     */
    public Integer getColorId() {
        return colorId;
    }

    /**
     * @param colorId the colorId to set
     */
    public void setColorId(Integer colorId) {
        this.colorId = colorId;
    }
}
