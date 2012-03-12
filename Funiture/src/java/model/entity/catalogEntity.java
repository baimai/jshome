/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entity;

/**
 *
 * @author Achilles
 */
public class catalogEntity {
private int catalogId;
    private int companyId;
    private String catalogName;
    private String catalogPicLoc;

    /**
     * @return the catalogId
     */
    public int getCatalogId() {
        return catalogId;
    }

    /**
     * @param catalogId the catalogId to set
     */
    public void setCatalogId(int catalogId) {
        this.catalogId = catalogId;
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
     * @return the catalogName
     */
    public String getCatalogName() {
        return catalogName;
    }

    /**
     * @param catalogName the catalogName to set
     */
    public void setCatalogName(String catalogName) {
        this.catalogName = catalogName;
    }

    /**
     * @return the catalogPicLoc
     */
    public String getCatalogPicLoc() {
        return catalogPicLoc;
    }

    /**
     * @param catalogPicLoc the catalogPicLoc to set
     */
    public void setCatalogPicLoc(String catalogPicLoc) {
        this.catalogPicLoc = catalogPicLoc;
    }
}
