/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package listener;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

/**
 * Web application lifecycle listener.
 * @author Achilles
 */
public class init implements ServletContextListener {
Connection conn;
    public void contextInitialized(ServletContextEvent sce) {
        try {
            conn = getWebdb().getConnection();
            sce.getServletContext().setAttribute("Connection", conn);
            sce.getServletContext().setAttribute("Company_Id", 1);
        } catch (NamingException ex) {
            Logger.getLogger(init.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(init.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(init.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private DataSource getWebdb() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/webdb");
    }
}
