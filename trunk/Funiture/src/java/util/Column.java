/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author Achilles
 */
public class Column {

    public static String getSQLColumn(String sField) {
        if (sField.equals("productGroupCode")) {
            sField = "pgm.Product_Group_Code";
        } else if (sField.equals("productGNameT")) {
            sField = "pgm.Product_G_Name_T";
        } else if (sField.equals("productGNameE")) {
            sField = "pgm.Product_G_Name_E";
        } else if (sField.equals("productRemarkT")) {
            sField = "pgm.Product_Remark_T";
        } else if (sField.equals("productRemarkE")) {
            sField = "pgm.Product_Remark_E";
        }
        return sField;
    }
}
