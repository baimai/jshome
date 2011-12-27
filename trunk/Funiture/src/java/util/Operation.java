/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author Achilles
 */
public class Operation {

    public static String getSQLOperation(String sOper, String sValue) {
        if (sOper.equals("eq")) {
            sOper = " like '" + sValue + "'";
        } else if (sOper.equals("ne")) {
            sOper = " not like '" + sValue + "'";
        } else if (sOper.equals("bw")) {
            sOper = " LIKE '" + sValue + "%'";
        } else if (sOper.equals("bn")) {
            sOper = " NOT LIKE '" + sValue + "%'";
        } else if (sOper.equals("ew")) {
            sOper = " LIKE '%" + sValue + "'";
        } else if (sOper.equals("en")) {
            sOper = " NOT LIKE '%" + sValue + "'";
        } else if (sOper.equals("cn")) {
            sOper = " LIKE '%" + sValue + "%'";
        } else if (sOper.equals("nc")) {
            sOper = " NOT LIKE '%" + sValue + "%'";
        } else if (sOper.equals("in")) {
            sOper = " IN ('" + sValue + "')";
        } else if (sOper.equals("ni")) {
            sOper = " NOT IN ('" + sValue + "')";
        } else if (sOper.equals("nu")) {
            sOper = " IS NULL";
        } else if (sOper.equals("nn")) {
            sOper = " IS NOT NULL";
        }
        return sOper;
    }
}
