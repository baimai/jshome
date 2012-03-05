/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 *
 * @author Baimai
 */
public class orderDetailMasterEntity {
    private int companyId;
    private int orderId;
    private int productDetailId;
    private int productVolumn;
    private BigDecimal productCost;
    private BigDecimal productAmount;
    private Timestamp createDate;
    private Timestamp updateDate;
    private String userId;
    private BigDecimal shippingCost;
    private productDetailMasterEntity productDetailMasterEntity;
    private memberMasterEntity memMasterEntity;
    private BigDecimal discountPrice;
    private int freeVolumn;
    private String discountText;
    private int orderDetailId;
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
     * @return the orderId
     */
    public int getOrderId() {
        return orderId;
    }

    /**
     * @param orderId the orderId to set
     */
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }



    /**
     * @return the productVolumn
     */
    public int getProductVolumn() {
        return productVolumn;
    }

    /**
     * @param productVolumn the productVolumn to set
     */
    public void setProductVolumn(int productVolumn) {
        this.productVolumn = productVolumn;
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
     * @return the productCost
     */
    public BigDecimal getProductCost() {
        return productCost;
    }

    /**
     * @param productCost the productCost to set
     */
    public void setProductCost(BigDecimal productCost) {
        this.productCost = productCost;
    }

    /**
     * @return the productAmount
     */
    public BigDecimal getProductAmount() {
        return productAmount;
    }

    /**
     * @param productAmount the productAmount to set
     */
    public void setProductAmount(BigDecimal productAmount) {
        this.productAmount = productAmount;
    }

    /**
     * @return the shippingCost
     */
    public BigDecimal getShippingCost() {
        return shippingCost;
    }

    /**
     * @param shippingCost the shippingCost to set
     */
    public void setShippingCost(BigDecimal shippingCost) {
        this.shippingCost = shippingCost;
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
     * @return the discountPrice
     */
    public BigDecimal getDiscountPrice() {
        return discountPrice;
    }

    /**
     * @param discountPrice the discountPrice to set
     */
    public void setDiscountPrice(BigDecimal discountPrice) {
        this.discountPrice = discountPrice;
    }

    /**
     * @return the freeVolumn
     */
    public int getFreeVolumn() {
        return freeVolumn;
    }

    /**
     * @param freeVolumn the freeVolumn to set
     */
    public void setFreeVolumn(int freeVolumn) {
        this.freeVolumn = freeVolumn;
    }

    /**
     * @return the discountText
     */
    public String getDiscountText() {
        return discountText;
    }

    /**
     * @param discountText the discountText to set
     */
    public void setDiscountText(String discountText) {
        this.discountText = discountText;
    }

    /**
     * @return the orderDetailId
     */
    public int getOrderDetailId() {
        return orderDetailId;
    }

    /**
     * @param orderDetailId the orderDetailId to set
     */
    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    /**
     * @return the memMasterEntity
     */
    public memberMasterEntity getMemMasterEntity() {
        return memMasterEntity;
    }

    /**
     * @param memMasterEntity the memMasterEntity to set
     */
    public void setMemMasterEntity(memberMasterEntity memMasterEntity) {
        this.memMasterEntity = memMasterEntity;
    }

   

}
