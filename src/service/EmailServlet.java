package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;

@WebServlet("/EmailServlet")
public class EmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public EmailServlet() {
        super();
        
	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext sc=getServletContext();
		Connection con=(Connection)sc.getAttribute("con");
		
		String from=request.getParameter("email");
		System.out.println(from);
		String password=request.getParameter("pwd");
		System.out.println(password);
		String sub=request.getParameter("sub");
		String body=request.getParameter("body");
		List<String> to=CustomerDao.getemails(con);
		Properties props = new Properties();
		props.put("mail.smtp.host","smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port","465");
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth",true);
		props.put("mail.smtp.port", "465");
		Session session=Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from,password);
			}
		});
		InternetAddress[] toaddress=new InternetAddress[to.size()];
		MimeMessage message=new MimeMessage(session);
		try {
			
			int i=0;
			for(String s:to) {
				toaddress[i]=new InternetAddress(s);
				System.out.println(s);
			i++;
			
			}
			for(i=0;i<toaddress.length;i++) {
			message.addRecipient(Message.RecipientType.TO ,toaddress[i] );
			}
			message.setSubject(sub);
			message.setText(body);
			Transport.send(message);
			System.out.println("message sent successfully");
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		PrintWriter out=response.getWriter();
		
		 request.getRequestDispatcher("email.jsp").include(request,response);
           out.println("<script type=\"text/javascript\">");
		     out.println("alert('mail sent successfully');");
			 out.println("</script>");
			
		
		
		
		
		
		
		
		
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
