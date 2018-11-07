package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("email_log");
		String password=request.getParameter("password_log");
		
		ServletContext context=getServletContext();
		Connection con=(Connection)context.getAttribute("con");
		
		boolean status=CustomerDao.checkLogin(email,password,con);
		
		response.setContentType("text/html");
		
		
		if(status==true){
			 String name=CustomerDao.getUser(email,password,con);
			int id=CustomerDao.getID(email, password, con);
			
			
			 
			
			 HttpSession session=request.getSession();
			session.setAttribute("activeuser",name);
			session.setAttribute("id",id);
			request.getRequestDispatcher("home.jsp").include(request,response);

			 out.println("<script type=\"text/javascript\">");
			
			 out.println("alert('you are loggedin  succesfully ..welcome to online shopping');");
			
			 out.println("</script>");
		}
		else {
			 request.getRequestDispatcher("registration.html").include(request,response);
            out.println("<script type=\"text/javascript\">");
		     out.println("alert('invalid email address or password');");
			 out.println("</script>");
			
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
