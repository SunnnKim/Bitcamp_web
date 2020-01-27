package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.CustUserDao;

@WebServlet("/custuserdel")
public class CustUserDel extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String command = req.getParameter("command");
		String id = req.getParameter("id");
		CustUserDao dao = CustUserDao.getInstance();
		if(command.equals("one")) {
			boolean b = dao.deleteOne(id);
			resp.getWriter().append(b+"");
		}
		else {
			String ids[] = req.getParameterValues("delck");
			boolean b = dao.deleteCustusers(ids);
			resp.sendRedirect("checkalldel.jsp?b="+b);
			
		}
	}

	
	
}
