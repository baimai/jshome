/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entity;

import java.sql.Timestamp;

/**
 *
 * @author baimai
 */
public class picProductSetupDetailEntity {
 private int picDetailId;
 private int picId;
 private int productDetailId;
 private int picSeq;
 private Timestamp createDate;
 private Timestamp updateDate;
 private String userId;
 private String productCode;
 private productDetailMasterEntity productDetailMasterEntity;
 private picProductSetupEntity  picProductSetupEntity;
 private String picDetailNameT;
 private String picDetailNameE;
 private String picDetailRemarkT;
 private String picDetailRemarkE;
 private String picCode;

    /**
     * @return the picDetailId
     */
    public int getPicDetailId() {
        return picDetailId;
    }

    /**
     * @param picDetailId the picDetailId to set
     */
    public void setPicDetailId(int picDetailId) {
        this.picDetailId = picDetailId;
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
     * @return the pic_seq
     */
    public int getPicSeq() {
        return picSeq;
    }

    /**
     * @param pic_seq the pic_seq to set
     */
    public void setPicSeq(int picSeq) {
        this.picSeq = picSeq;
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
     * @return the picDetailNameT
     */
    public String getPicDetailNameT() {
        return picDetailNameT;
    }

    /**
     * @param picDetailNameT the picDetailNameT to set
     */
    public void setPicDetailNameT(String picDetailNameT) {
        this.picDetailNameT = picDetailNameT;
    }

    /**
     * @return the picDetailNameE
     */
    public String getPicDetailNameE() {
        return picDetailNameE;
    }

    /**
     * @param picDetailNameE the picDetailNameE to set
     */
    public void setPicDetailNameE(String picDetailNameE) {
        this.picDetailNameE = picDetailNameE;
    }

    /**
     * @return the picDetailRemarkT
     */
    public String getPicDetailRemarkT() {
        return picDetailRemarkT;
    }

    /**
     * @param picDetailRemarkT the picDetailRemarkT to set
     */
    public void setPicDetailRemarkT(String picDetailRemarkT) {
        this.picDetailRemarkT = picDetailRemarkT;
    }

    /**
     * @return the picDetailRemarkE
     */
    public String getPicDetailRemarkE() {
        return picDetailRemarkE;
    }

    /**
     * @param picDetailRemarkE the picDetailRemarkE to set
     */
    public void setPicDetailRemarkE(String picDetailRemarkE) {
        this.picDetailRemarkE = picDetailRemarkE;
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
