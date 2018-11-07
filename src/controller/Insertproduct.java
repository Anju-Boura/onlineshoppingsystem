package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import beans.Product;
import dao.ProductDao;

@WebServlet("/Insertproduct")
@MultipartConfig(fileSizeThreshold=1024*1024*2,maxFileSize=1024*1024*10,maxRequestSize=1024*1024*50)
public class Insertproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product p=new Product();
		p.setCategory(request.getParameter("category"));
		p.setName(request.getParameter("name"));
		p.setPrice(Double.parseDouble(request.getParameter("price")));
		p.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		p.setDescription(request.getParameter("description"));
		
		System.out.println(request.getParameter("image"));
		//-----------
		Connection conn=(Connection)getServletContext().getAttribute("con");
		
		
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
	
		Part part =request.getPart("image");
		String filename=extractFileName(part);
		String savepath="D:\\onlineshopping\\online_shoppingsite\\WebContent\\images\\product"+File.separator+filename;
		File fileSaveDir=new File(savepath);
		
		
		part.write(savepath+File.separator);
		System.out.println(filename);
		out.println("<script>");
		out.println("alert('inserted successfully');");
		out.println("</script>");
		p.setImage(filename);
		
		int i=ProductDao.save(p,conn);
		System.out.println(i);
		
		RequestDispatcher rd=request.getRequestDispatcher("/admin_panel.jsp");
		rd.include(request,response);

		
		
	}
	public String extractFileName(Part part) {
		String contentdisp=part.getHeader("content-disposition");
		String items[]=contentdisp.split(";");
		for(String s : items) {
			if(s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=")+2, s.length()-1);
			}
	
		}
		return "";
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
