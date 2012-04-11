/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.entity.catalogEntity;
import model.entity.companyMasterEntity;
import model.entity.productDetailMasterEntity;
import util.Default;

/**
 *
 * @author Achilles
 */
public class catalogTable {

    private Database db;

    public catalogTable(Database db) {
        this.db = db;
    }

    public void add(catalogEntity ca) {

        String sql = "insert into catalog_master "
                + "( catalog_name,catalog_pic_loc,company_id)"
                + "  values(?,?,?)";

        db.add(sql,
                ca.getCatalogName(),
                ca.getCatalogPicLoc(),
                ca.getCompanyId());
    }

    public ArrayList search(String productGroup, String picCode) {
        String sql = " select * from product_detail_master pdm ";
        if (!productGroup.equals("")) {
            if (productGroup.equals("all")) {
                sql = sql + " join product_group_master pgm on pgm.product_group_id = pdm.product_group_id ";
            }else{
                 sql = sql + " join product_group_master pgm on pgm.product_group_id = pdm.product_group_id and pgm.product_group_id = "+productGroup;
            }
        }
        if (!picCode.equals("")) {
            if (picCode.equals("all")) {
                sql = sql + " join pic_product_setup pps on pps.product_detail_id = pdm.product_detail_id ";
            }else{
                 sql = sql + " join pic_product_setup  pps on pps.product_detail_id = pdm.product_detail_id and pps.pic_code = '"+picCode+"'";
            }
        }
        List<Map<String, Object>> result = db.queryList(sql);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
                productDetailMasterEntity pdm = new productDetailMasterEntity();
                pdm.setCompanyId((Integer) result.get(i).get("Company_Id"));
                pdm.setProductGroupId((Integer) result.get(i).get("Product_Group_Id"));
                pdm.setProductCode(Default.Str(result.get(i).get("Product_Code")));
                pdm.setProductDNameT(Default.Str(result.get(i).get("Product_D_Name_T")));
                pdm.setProductDNameE(Default.Str((result.get(i).get("Product_D_Name_E"))));
                pdm.setProductPrice1(Default.BigDecimal(result.get(i).get("Product_Price1")));
                pdm.setProductPrice2(Default.BigDecimal(result.get(i).get("Product_Price2")));
                pdm.setProductPrice3(Default.BigDecimal(result.get(i).get("Product_Price3")));
                pdm.setProductPrice4(Default.BigDecimal(result.get(i).get("Product_Price4")));
                pdm.setProductSpect1_T(Default.Str(result.get(i).get("Product_Spec1_T")));
                pdm.setProductSpect2_T(Default.Str(result.get(i).get("Product_Spec2_T")));
                pdm.setProductSpect3_T(Default.Str(result.get(i).get("Product_Spec3_T")));
                pdm.setProductSpect4_T(Default.Str(result.get(i).get("Product_Spec4_T")));
                pdm.setProductSpect5_T(Default.Str(result.get(i).get("Product_Spec5_T")));
                pdm.setProductSpect6_T(Default.Str(result.get(i).get("Product_Spec6_T")));
                pdm.setProductSpect1_E(Default.Str(result.get(i).get("Product_Spec1_E")));
                pdm.setProductSpect2_E(Default.Str(result.get(i).get("Product_Spec2_E")));
                pdm.setProductSpect3_E(Default.Str(result.get(i).get("Product_Spec3_E")));
                pdm.setProductSpect4_E(Default.Str(result.get(i).get("Product_Spec4_E")));
                pdm.setProductSpect5_E(Default.Str(result.get(i).get("Product_Spec5_E")));
                pdm.setProductSpect6_E(Default.Str(result.get(i).get("Product_Spec6_E")));
                pdm.setProductDPicLoc(Default.Str(result.get(i).get("Product_D_Pic_Loc")));
                pdm.setProductDIconLoc(Default.Str(result.get(i).get("Product_D_Icon_Loc")));
                pdm.setProductDRemarkT(Default.Str(result.get(i).get("Product_D_Remark_T")));
                pdm.setProductDRemarkE(Default.Str(result.get(i).get("Product_D_Remark_E")));
                pdm.setProductDDisplayFlag(Default.Str(result.get(i).get("Product_D_Display_Flag")));
                pdm.setUserId(Default.Str(result.get(i).get("User_Id")));
                pdm.setProductDetailId((Integer) result.get(i).get("Product_Detail_Id"));
                pdm.setProductModelCode(Default.Str(result.get(i).get("product_model_code")));
                if (result.get(i).get("Product_Color_Id") != null) {
                    pdm.setProductColorId((Integer) result.get(i).get("Product_Color_Id"));
                }
                list.add(pdm);
            }
            return list;
        } else {
            return null;
        }


    }

    public ArrayList searchDetail(int companyId) {
        String sql = " SELECT c.Company_Name_T, "+
                     " concat(c.company_addr_t,' ต.',company_district_t,' อ.',company_amphur_t,' จ.',company_province_t,' ',company_postcode) as address, "+
                     " concat('Tel : ',c.company_tel1) as tel,concat('Fax : ',c.company_fax1) as fax,concat('Email : ',c.company_email1) as email,"+
                     " c.Company_Catalog_Loc,c.Company_Logo_Loc,c.Show_Price_List_Flag "+
                     " FROM company_master c "+
                     " where c.company_id = ?";

        List<Map<String, Object>> result = db.queryList(sql,companyId);
        ArrayList list = new ArrayList();
        if (!result.isEmpty()) {
            for (int i = 0; i < result.size(); i++) {
               companyMasterEntity c = new companyMasterEntity();
                c.setCompanyNameT((String) result.get(0).get("Company_Name_T"));
                c.setCompanyAddrT((String)result.get(0).get("address"));
                c.setCompanyTel1((String)result.get(0).get("tel"));
                c.setCompanyFax1((String)result.get(0).get("fax"));
                c.setCompanyEmail1((String)result.get(0).get("email"));
                c.setCompanyCatalogLoc((String)result.get(0).get("Company_Catalog_Loc"));
                c.setCompanyLogoLoc((String)result.get(0).get("Company_Logo_Loc"));
                c.setShowPriceListFlag((String)result.get(0).get("Show_Price_List_Flag"));
                list.add(c);
            }
            return list;
        } else {
            return null;
        }


    }
}
