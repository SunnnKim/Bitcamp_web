package fileupdate;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fileupdate")
public class FileUpdate extends HttpServlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		System.out.println("seq : " + seq);
	
	}

	
	
	
	
}
