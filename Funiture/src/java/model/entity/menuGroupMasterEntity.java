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
public class menuGroupMasterEntity {
    private int menuGroupId;
    private int companyId;
    private String menuGNameT;
    private String menuGNameE;
    private String showListMenu;
    private String chkLoginSts;
    private String menuPermission;
    private String menuGRemarkT;
    private String menuGRemarkE;
    private String menuGPicLoc;
    private String menuGIconLog;
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
     * @return the menuGNameT
     */
    public String getMenuGNameT() {
        return menuGNameT;
    }

    /**
     * @param menuGNameT the menuGNameT to set
     */
    public void setMenuGNameT(String menuGNameT) {
        this.menuGNameT = menuGNameT;
    }

    /**
     * @return the menuGNameE
     */
    public String getMenuGNameE() {
        return menuGNameE;
    }

    /**
     * @param menuGNameE the menuGNameE to set
     */
    public void setMenuGNameE(String menuGNameE) {
        this.menuGNameE = menuGNameE;
    }

    /**
     * @return the showListMenu
     */
    public String getShowListMenu() {
        return showListMenu;
    }

    /**
     * @param showListMenu the showListMenu to set
     */
    public void setShowListMenu(String showListMenu) {
        this.showListMenu = showListMenu;
    }

    /**
     * @return the chkLoginSts
     */
    public String getChkLoginSts() {
        return chkLoginSts;
    }

    /**
     * @param chkLoginSts the chkLoginSts to set
     */
    public void setChkLoginSts(String chkLoginSts) {
        this.chkLoginSts = chkLoginSts;
    }

    /**
     * @return the menuPermission
     */
    public String getMenuPermission() {
        return menuPermission;
    }

    /**
     * @param menuPermission the menuPermission to set
     */
    public void setMenuPermission(String menuPermission) {
        this.menuPermission = menuPermission;
    }

    /**
     * @return the menuGRemarkT
     */
    public String getMenuGRemarkT() {
        return menuGRemarkT;
    }

    /**
     * @param menuGRemarkT the menuGRemarkT to set
     */
    public void setMenuGRemarkT(String menuGRemarkT) {
        this.menuGRemarkT = menuGRemarkT;
    }

    /**
     * @return the menuGRemarkE
     */
    public String getMenuGRemarkE() {
        return menuGRemarkE;
    }

    /**
     * @param menuGRemarkE the menuGRemarkE to set
     */
    public void setMenuGRemarkE(String menuGRemarkE) {
        this.menuGRemarkE = menuGRemarkE;
    }

    /**
     * @return the menuGPicLoc
     */
    public String getMenuGPicLoc() {
        return menuGPicLoc;
    }

    /**
     * @param menuGPicLoc the menuGPicLoc to set
     */
    public void setMenuGPicLoc(String menuGPicLoc) {
        this.menuGPicLoc = menuGPicLoc;
    }

    /**
     * @return the menuGIconLog
     */
    public String getMenuGIconLog() {
        return menuGIconLog;
    }

    /**
     * @param menuGIconLog the menuGIconLog to set
     */
    public void setMenuGIconLog(String menuGIconLog) {
        this.menuGIconLog = menuGIconLog;
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
     * @return the menuGropId
     */
    public int getMenuGroupId() {
        return menuGroupId;
    }

    /**
     * @param menuGropId the menuGropId to set
     */
    public void setMenuGroupId(int menuGroupId) {
        this.menuGroupId = menuGroupId;
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



}
