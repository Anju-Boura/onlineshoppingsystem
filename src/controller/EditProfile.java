package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;


@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EditProfile() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=(Connection)getServletContext().getAttribute("con");
		PrintWriter out=response.getWriter();
		
		
		String name=request.getParameter("name");
		System.out.println(name);
		int  id=Integer.valueOf(request.getParameter("id"));
		String value=request.getParameter("value");
		System.out.println(name.equals("name"));
		if(name.equals("name")) {
			int a=CustomerDao.editname(con, id, value);
			if(a>0) {
				System.out.println(a);
				request.getSession().setAttribute("activeuser",value);
				request.getRequestDispatcher("viewprofile.jsp").include(request,response);
		           out.println("<script type=\"text/javascript\">");
				     out.println("alert('your name has changed successfully');");
					 out.println("</script>");
			}
					
			}
			if(name.equals("email")) {
				int a=CustomerDao.editemail(con, id, value);
				if(a>0) {
					request.getRequestDispatcher("viewprofile.jsp").include(request,response);
			           out.println("<script type=\"text/javascript\">");
					     out.println("alert('your email has changed successfully');");
						 out.println("</script>");
						
				}
			}
				if(name.equals("contact")) {
					 int a=CustomerDao.editcontact(con, id, value);
					if(a>0) {
						request.getRequestDispatcher("viewprofile.jsp").include(request,response);
				           out.println("<script type=\"text/javascript\">");
						     out.println("alert('your contact no. has changed successfully');");
							 out.println("</script>");
							
					}
				}
					if(name.equals("address")) {
						int  a=CustomerDao.editaddress(con, id, value);
						if(a>0) {
							request.getRequestDispatcher("viewprofile.jsp").include(request,response);
					           out.println("<script type=\"text/javascript\">");
							     out.println("alert('your address has changed successfully');");
								 out.println("</script>");
								
						      }
					}
				
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
