/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import model.entity.stockBalanceEntity;

/**
 *
 * @author Achilles
 */
public class stockBalanceTable {

    private Database db;

    public stockBalanceTable(Database db) {
        this.db = db;
    }
    public Integer getBalanceProduct(stockBalanceEntity sb) {
        String sql = "select * from stock_balance where product_detail_id = ?";
        List<Map<String, Object>> result = db.queryList(sql, sb.getProductDetailId());
        if (!result.isEmpty()) {
            return ((BigDecimal) result.get(0).get("balance")).intValue();
        } else {
            return 0;
        }
    }
}
