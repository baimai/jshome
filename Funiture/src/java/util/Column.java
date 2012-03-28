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
        } else if (sField.equals("companyCode")) {
            sField = "cm.Company_Code";
        } else if (sField.equals("productCode")) {
            sField = "pdm.Product_Code";
        } else if (sField.equals("picCode")) {
            sField = "pps.Pic_Code";
        } else if (sField.equals("productRemarkT")) {
            sField = "pps.Product_Remark_T";
        } else if (sField.equals("productRemarkE")) {
            sField = "pps.Product_Remark_E";
        } else if (sField.equals("createDate")) {
            sField = "pps.Create_Date";
        } else if (sField.equals("updateDate")) {
            sField = "pps.Update_Date";
        } else if (sField.equals("userId")) {
            sField = "pps.User_Id";
        } else if (sField.equals("picNameT")) {
            sField = "pps.Pic_Name_T";
        } else if (sField.equals("picNameE")) {
            sField = "pps.Pic_Name_E";
        } else if (sField.equals("orderStatus")) {
            sField = "ohm.Order_Status";
        }else if (sField.equals("colorCode")) {
            sField = "cm.Color_Code";
        }else if (sField.equals("colorNameT")) {
            sField = "cm.Color_Name_T";
        }else if (sField.equals("colorNameE")) {
            sField = "cm.Color_Name_E";
        }else if (sField.equals("memberLogin")) {
            sField = "mb.Member_Login";
        }else if (sField.equals("memberName")) {
            sField = "mb.Member_Name";
        }else if (sField.equals("memberSurName")) {
            sField = "mb.Member_SurName";
        }else if (sField.equals("memberStatus")) {
            sField = "mb.Member_Status";
        }else if (sField.equals("orderId")) {
            sField = "ohm.Order_Id";
        }
        return sField;
    }
}
