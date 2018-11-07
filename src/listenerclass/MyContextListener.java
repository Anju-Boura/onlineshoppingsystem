package listenerclass;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;



@WebListener
public class MyContextListener implements ServletContextListener {

    public MyContextListener() {
        // TODO Auto-generated constructor stub
    }

	
    public void contextDestroyed(ServletContextEvent eve)  { 
    	System.out.println("context is destroyed..................");
    	
    	
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent eve)  { 
      System.out.println("context is initialized...................");
      try{
    	 
    	  Class.forName("com.mysql.jdbc.Driver");
    		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/onlineshopping","root","anju");
    		System.out.println(connection);
  		System.out.println(connection);
  		ServletContext context=eve.getServletContext();
  		context.setAttribute("con",connection);
  		
  	    }
      catch(Exception e){System.out.println(e);}
    }
	
}
