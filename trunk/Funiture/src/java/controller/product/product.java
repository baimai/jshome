/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.product;

import java.math.BigDecimal;

/**
 *
 * @author Achilles
 */
public class product {
    private int productGroupId;
    private String productName;
    private String productCode;
    private int productDetailId;
    private double productPrice;
    private int amount;
    private String productPath;

    /**
     * @return the productName
     */
    public String getProductName() {
        return productName;
    }

    /**
     * @param productName the productName to set
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

  
    /**
     * @return the amount
     */
    public int getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(int amount) {
        this.amount = amount;
    }

 

    /**
     * @return the productGroup
     */
    public int getProductGroupId() {
        return productGroupId;
    }

    /**
     * @param productGroup the productGroup to set
     */
    public void setProductGroupId(int productGroupId) {
        this.productGroupId = productGroupId;
    }

    /**
     * @return the productPrice
     */
    public double getProductPrice() {
        return productPrice;
    }

    /**
     * @param productPrice the productPrice to set
     */
    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
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
     * @return the productPath
     */
    public String getProductPath() {
        return productPath;
    }

    /**
     * @param productPath the productPath to set
     */
    public void setProductPath(String productPath) {
        this.productPath = productPath;
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


    
}
