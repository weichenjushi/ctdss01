package cn.ctdss.lr.utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class SetTimeTaskListener
 *
 */
@WebListener
public class SetTimeTaskListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public SetTimeTaskListener() {
//    	 System.out.println("ø’≤Œππ‘Ï");  
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0) {
//       System.out.println("SetTimeTaskListener.contextInitialized()");
//       System.out.println(this.hashCode());  
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
//       System.out.println("SetTimeTaskListener.contextDestroyed()");
//       System.out.println(this.hashCode());  
    }
	
}
