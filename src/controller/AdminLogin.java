package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AdminLogin() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
	String username =request.getParameter("admin_user");
	String password=request.getParameter("admin_password");
	if(username.equals("admin") && password.equals("admin123")) {
		 out.println("<script type=\"text/javascript\">");
			
		 out.println("alert('LOGIN SUCCESSFULLY...WELVOME TO ADMIN');");
		
		 out.println("</script>");
		 response.sendRedirect("admin_panel.jsp");
		 
		
	}
	else {
		out.println("<script type=\"text/javascript\">");
		
		 out.println("alert('username or password is incorrect...');");
		
		 out.println("</script>");
		 request.getRequestDispatcher("admin.jsp").include(request,response);
		
	}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
