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
public class menuDetailMasterEntity {
    private int menuCodeId;
    private int menuGroupId;
    private int companyId;
    private String menuModel;
    private int menuSeq;
    private String menuCNameT;
    private String menuCNameE;
    private String showListSts;
    private int picid;
    private String menuCPicLoc;
    private String menuCIconLoc;
    private String menuCRemarkT;
    private String menuCRemarkE;
    private Timestamp createDate;
    private Timestamp updateDate;
    private String userId;
    private String picCode;
    private menuGroupMasterEntity menuGroupMasterEntity;
    private memberGradeMasterEntity memberGradeMasterEntity;
    private picProductSetupEntity picProductSetupEntity ;
    /**
     * @return the menuCodeId
     */
    public int getMenuCodeId() {
        return menuCodeId;
    }

    /**
     * @param menuCodeId the menuCodeId to set
     */
    public void setMenuCodeId(int menuCodeId) {
        this.menuCodeId = menuCodeId;
    }

    /**
     * @return the menuGroupId
     */
    public int getMenuGroupId() {
        return menuGroupId;
    }

    /**
     * @param menuGroupId the menuGroupId to set
     */
    public void setMenuGroupId(int menuGroupId) {
        this.menuGroupId = menuGroupId;
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
     * @return the menuModel
     */
    public String getMenuModel() {
        return menuModel;
    }

    /**
     * @param menuModel the menuModel to set
     */
    public void setMenuModel(String menuModel) {
        this.menuModel = menuModel;
    }

    /**
     * @return the menuSeq
     */
    public int getMenuSeq() {
        return menuSeq;
    }

    /**
     * @param menuSeq the menuSeq to set
     */
    public void setMenuSeq(int menuSeq) {
        this.menuSeq = menuSeq;
    }

    /**
     * @return the menuCNameT
     */
    public String getMenuCNameT() {
        return menuCNameT;
    }

    /**
     * @param menuCNameT the menuCNameT to set
     */
    public void setMenuCNameT(String menuCNameT) {
        this.menuCNameT = menuCNameT;
    }

    /**
     * @return the menuCNameE
     */
    public String getMenuCNameE() {
        return menuCNameE;
    }

    /**
     * @param menuCNameE the menuCNameE to set
     */
    public void setMenuCNameE(String menuCNameE) {
        this.menuCNameE = menuCNameE;
    }

    /**
     * @return the showListSts
     */
    public String getShowListSts() {
        return showListSts;
    }

    /**
     * @param showListSts the showListSts to set
     */
    public void setShowListSts(String showListSts) {
        this.showListSts = showListSts;
    }

  



    /**
     * @return the menuCPicLoc
     */
    public String getMenuCPicLoc() {
        return menuCPicLoc;
    }

    /**
     * @param menuCPicLoc the menuCPicLoc to set
     */
    public void setMenuCPicLoc(String menuCPicLoc) {
        this.menuCPicLoc = menuCPicLoc;
    }

    /**
     * @return the menuCIconLoc
     */
    public String getMenuCIconLoc() {
        return menuCIconLoc;
    }

    /**
     * @param menuCIconLoc the menuCIconLoc to set
     */
    public void setMenuCIconLoc(String menuCIconLoc) {
        this.menuCIconLoc = menuCIconLoc;
    }

    /**
     * @return the menuCRemarkT
     */
    public String getMenuCRemarkT() {
        return menuCRemarkT;
    }

    /**
     * @param menuCRemarkT the menuCRemarkT to set
     */
    public void setMenuCRemarkT(String menuCRemarkT) {
        this.menuCRemarkT = menuCRemarkT;
    }

    /**
     * @return the menuCRemarkE
     */
    public String getMenuCRemarkE() {
        return menuCRemarkE;
    }

    /**
     * @param menuCRemarkE the menuCRemarkE to set
     */
    public void setMenuCRemarkE(String menuCRemarkE) {
        this.menuCRemarkE = menuCRemarkE;
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
     * @return the menuGroupMasterEntity
     */
    public menuGroupMasterEntity getMenuGroupMasterEntity() {
        return menuGroupMasterEntity;
    }

    /**
     * @param menuGroupMasterEntity the menuGroupMasterEntity to set
     */
    public void setMenuGroupMasterEntity(menuGroupMasterEntity menuGroupMasterEntity) {
        this.menuGroupMasterEntity = menuGroupMasterEntity;
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
     * @return the picId
     */
    public int getPicId() {
        return picid;
    }

    /**
     * @param picId the picId to set
     */
    public void setPicId(int picid) {
        this.picid = picid;
    }

    /**
     * @return the memberGradeMasterEntity
     */
    public memberGradeMasterEntity getMemberGradeMasterEntity() {
        return memberGradeMasterEntity;
    }

    /**
     * @param memberGradeMasterEntity the memberGradeMasterEntity to set
     */
    public void setMemberGradeMasterEntity(memberGradeMasterEntity memberGradeMasterEntity) {
        this.memberGradeMasterEntity = memberGradeMasterEntity;
    }

    /**
     * @return the picProductSetupEntity
     */
    public picProductSetupEntity getPicProductSetupEntity() {
        return picProductSetupEntity;
    }

    /**
     * @param picProductSetupEntity the picProductSetupEntity to set
     */
    public void setPicProductSetupEntity(picProductSetupEntity picProductSetupEntity) {
        this.picProductSetupEntity = picProductSetupEntity;
    }

    /**
     * @return the picCode
     */
    public String getPicCode() {
        return picCode;
    }

    /**
     * @param picCode the picCode to set
     */
    public void setPicCode(String picCode) {
        this.picCode = picCode;
    }

 


}
