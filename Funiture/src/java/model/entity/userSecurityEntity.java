/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author Baimai
 */
public class userSecurityEntity {
private String userId;
private int companyId;
private String userPassword;
private String userNameT;
private String userNameE;
private String userAuthoritySts;
private String userAliveSts;
private Timestamp approvedDate;
private Timestamp holdDate;
private Timestamp createDate;
private Timestamp updateDate;

    /**
     * @return the userId
     */
    public String getUserId() {
        return userId;
    }

    /**
     * @param UserId the UserId to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
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
     * @return the userPassword
     */
    public String getUserPassword() {
        return userPassword;
    }

    /**
     * @param userPassword the userPassword to set
     */
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    /**
     * @return the userNameT
     */
    public String getUserNameT() {
        return userNameT;
    }

    /**
     * @param userNameT the userNameT to set
     */
    public void setUserNameT(String userNameT) {
        this.userNameT = userNameT;
    }

    /**
     * @return the userNameE
     */
    public String getUserNameE() {
        return userNameE;
    }

    /**
     * @param userNameE the userNameE to set
     */
    public void setUserNameE(String userNameE) {
        this.userNameE = userNameE;
    }

    /**
     * @return the userAuthoritySts
     */
    public String getUserAuthoritySts() {
        return userAuthoritySts;
    }

    /**
     * @param userAuthoritySts the userAuthoritySts to set
     */
    public void setUserAuthoritySts(String userAuthoritySts) {
        this.userAuthoritySts = userAuthoritySts;
    }

    /**
     * @return the userAliveSts
     */
    public String getUserAliveSts() {
        return userAliveSts;
    }

    /**
     * @param userAliveSts the userAliveSts to set
     */
    public void setUserAliveSts(String userAliveSts) {
        this.userAliveSts = userAliveSts;
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
     * @return the approvedDate
     */
    public Timestamp getApprovedDate() {
        return approvedDate;
    }

    /**
     * @param approvedDate the approvedDate to set
     */
    public void setApprovedDate(Timestamp approvedDate) {
        this.approvedDate = approvedDate;
    }

    /**
     * @return the holdDate
     */
    public Timestamp getHoldDate() {
        return holdDate;
    }

    /**
     * @param holdDate the holdDate to set
     */
    public void setHoldDate(Timestamp holdDate) {
        this.holdDate = holdDate;
    }

    public void setCompanyId(String Str) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

  
}
