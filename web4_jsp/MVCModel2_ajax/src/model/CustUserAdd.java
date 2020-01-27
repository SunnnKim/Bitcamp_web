package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;

@WebServlet("/custuseradd")
public class CustUserAdd extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String command = req.getParameter("command");
		if(command.equals("add")) {
			resp.sendRedirect("custuseradd.html");
		}else{
			CustUserDao dao = CustUserDao.getInstance();
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String address = req.getParameter("address");
			boolean isSuccess = dao.addCustUser(id, name, address);
			System.out.println("boolena ;"+ isSuccess);
			resp.sendRedirect("checkadd.jsp?isSuccess="+isSuccess);
			
			}
	
	}
}
