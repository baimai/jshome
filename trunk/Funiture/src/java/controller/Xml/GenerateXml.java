/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Xml;

/**
 *
 * @author Achilles
 */
public class GenerateXml {

    private String header = "<?xml version='1.0' encoding='utf-8'?>\n";
    private String rowsOp = "<rows>";
    private String rowsEd = "</rows>";
    private String page;
    private String total;
    private String records;
    private String rowDetail = "";
    private String userdata = "";

    /**
     * @param page the page to set
     */
    public void setPage(Object page) {
        this.page = "<page>" + page + "</page>";
    }

    /**
     * @param total the total to set
     */
    public void setTotal(Object total) {
        this.total = "<total>" + total + "</total>";
    }

    /**
     * @param records the records to set
     */
    public void setRecords(Object records) {
        this.records = "<records>" + records + "</records>";
    }

    /**
     * @param rowDetail the rowDetail to set
     */
    public void setRowDetail(Object rowId, Object... args) {
        if (args.length > 0 && rowId != null) {
            String IdOp = "<row id='" + rowId + "'>";
            String detail = "";
            for (int i = 0; i < args.length; i++) {
                detail = detail + "<cell>" + args[i] + "</cell>";
            }
            String IdEnd = "</row>";
            this.rowDetail = this.rowDetail + IdOp + detail + IdEnd;
        }

    }

    /**
     * @return the Xml
     */
    public String getXml() {
        return header + rowsOp + page + total + records + rowDetail + userdata + rowsEd;
    }

    /**
     * @return the userdata
     */
    public String getUserdata() {
        return userdata;
    }

    /**
     * @param userdata the userdata to set
     */
    public void setUserdata(Object obj1, Object obj2) {
        this.userdata = this.userdata + "<userdata name=\"" + obj1 + "\">" + obj2 + "</userdata>";
    }
//
}
