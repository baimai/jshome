/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 *
 * @author Achilles
 */
public class Default {

    public static String Str(Object obj) {
        if (obj == null) {
            return "";
        } else {
            return (String) obj;
        }
    }

    public static BigDecimal BigDecimal(Object obj) {
        if (obj == null) {
            return BigDecimal.valueOf(0.00);
        } else {
            return (BigDecimal) obj;
        }
    }
    public static Integer Integer(Object obj) {
        if (obj == null) {
            return 0;
        } else {
            return (Integer) obj;
        }
    }
    public static Timestamp Date(Object obj) {
        if (obj == null) {
            return Timestamp.valueOf("0000-00-00 00:00:00");
        } else {
            return (Timestamp) obj;
        }
    }

}
