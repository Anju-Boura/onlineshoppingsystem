package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Customer;
import dao.CustomerDao;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
       
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("hello");
		ServletContext context=getServletContext();
		try {
		Connection con=(Connection)context.getAttribute("con");
	
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String mobileno=req.getParameter("mobileno");
		String address=req.getParameter("address");
		long phoneno=Long.parseLong(mobileno);
		Customer cus=new Customer(name,email,address,phoneno,password);
		int a=CustomerDao.save(cus,con);
		if(a>0) {
			System.out.println("inserted data..........");
			PrintWriter out=res.getWriter();
			req.getRequestDispatcher("registration.html").include(req,res);
			
			out.println("<script type=\"text/javascript\">");
			
			out.println("alert('you are registered succesfully ...now plz login');");
			
			out.println("</script>");
			
			
		}
	}
		catch(Exception e) {
			System.out.println(e);}
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
