/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.error;

import java.util.ArrayList;

/**
 *
 * @author Achilles
 */
public class errorClass {

    private String errorCode;
    private String header;
    private String[] itemCode;
    private String[] itemName;
    private String[] itemDetail;
    private String remark;

    /**
     * @return the errorCode
     */
    public String getErrorCode() {
        return errorCode;
    }

    /**
     * @param errorCode the errorCode to set
     */
    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    /**
     * @return the header
     */
    public String getHeader() {
        return header;
    }

    /**
     * @param header the header to set
     */
    public void setHeader(String header) {
        this.header = header;
    }

   

    

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the itemCode
     */
    public String[] getItemCode() {
        return itemCode;
    }

    /**
     * @param itemCode the itemCode to set
     */
    public void setItemCode(String[] itemCode) {
        this.itemCode = itemCode;
    }

    /**
     * @return the itemName
     */
    public String[] getItemName() {
        return itemName;
    }

    /**
     * @param itemName the itemName to set
     */
    public void setItemName(String[] itemName) {
        this.itemName = itemName;
    }

    /**
     * @return the itemDetail
     */
    public String[] getItemDetail() {
        return itemDetail;
    }

    /**
     * @param itemDetail the itemDetail to set
     */
    public void setItemDetail(String[] itemDetail) {
        this.itemDetail = itemDetail;
    }

   
   

   
}
