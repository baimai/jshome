/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Achilles
 */
public class Database {

    private Connection connect;

    public Database() {
        try {


            connect = DriverManager.getConnection("jdbc:mysql://192.168.0.15:3306/webdb?user=jshome&password=jshome");
          // connect = DriverManager.getConnection("jdbc:mysql://192.168.0.15:3306/webdb?user=jshome&password=jshome");


        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void close() {
        if (connect != null) {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    public int add(String sql, Object... args) {
        try {
            PreparedStatement pstmt;
            pstmt = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            for (int i = 0; i < args.length; i++) {
                pstmt.setObject(i + 1, args[i]);
            }
            pstmt.executeUpdate();
            ResultSet rs = pstmt.getGeneratedKeys();
            rs.next();
            int id = rs.getInt(1);
            pstmt.close();
            rs.close();
            return id;
        } catch (SQLException ex) {
            return 0;
        }

    }

    public int update(String sql, Object... args) {
        try {
            PreparedStatement pstmt = connect.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                pstmt.setObject(i + 1, args[i]);
            }
            int i = pstmt.executeUpdate();
            return i;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public int remove(String sql, int id) {
        return update(sql, id);
    }

    public Map<String, Object> querySingle(String sql, Object... args) {
        try {
            PreparedStatement pstmt = connect.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                pstmt.setObject(i + 1, args[i]);
            }
            ResultSet rs = pstmt.executeQuery();
            ResultSetMetaData md = rs.getMetaData();            
            if (rs.next()) {
                Map<String, Object> map;
                map = new HashMap<String, Object>();
                for (int i = 1; i <= md.getColumnCount(); i++) {
                    map.put(md.getColumnLabel(i), rs.getObject(i));
                }
                pstmt.close();
                rs.close();
                return map;
            } else {
                pstmt.close();
                rs.close();
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public List<Map<String, Object>> queryList(String sql, Object... args) {
        try {
            List<Map<String, Object>> list;
            list = new ArrayList<Map<String, Object>>();
            PreparedStatement pstmt = connect.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                pstmt.setObject(i + 1, args[i]);
            }
            ResultSet rs = pstmt.executeQuery();
            ResultSetMetaData md = rs.getMetaData();
            while (rs.next()) {
                Map<String, Object> map;
                map = new HashMap<String, Object>();
                for (int i = 1; i <= md.getColumnCount(); i++) {
                    map.put(md.getColumnLabel(i), rs.getObject(i));
                }
                list.add(map);
            }
            pstmt.close();
            rs.close();
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    //Transaction
    public void beginTransaction() {
        try {
            connect.setAutoCommit(false);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void commit() {
        try {
            connect.commit();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void rollback() {
        try {
            connect.rollback();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //End Transaction

    public String getNow() {
        try {
            Statement stmt;
            stmt = connect.createStatement();
            ResultSet rs = stmt.executeQuery("select now() as date");
            rs.next();
            String date = rs.getString("date");
            stmt.close();
            rs.close();
            return date;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return "";
        }
    }
}
