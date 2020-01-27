package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;

@WebServlet("/custuserupdate")
public class CustUserUpdate extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String address = req.getParameter("address");
		String name = req.getParameter("name");
		System.out.println(id);
		System.out.println(name);
		System.out.println(address);
		
		CustUserDao dao = CustUserDao.getInstance();
		
		boolean b = dao.updateCustUser(id, address);
		System.out.println("boolean: "+b);
		resp.sendRedirect("checkUpdate.jsp?isSuccess="+b+"&id="+id);
	
	}

}
