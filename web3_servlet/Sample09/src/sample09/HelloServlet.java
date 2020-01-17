package sample09;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")	//<- name space (명시적 주소) : web.xml 간략하게 추가할 수 있음 
public class HelloServlet extends HttpServlet {

	// include 서블릿 불러오기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("hello Servlet doGet");
		
		// include (가져오기), forward (이동하다)
		// include / forward 할 서블릿은 꼭 등록이 되어있어야함 ( @webServlet("/이름") )
		
		// include : 뷰를 따로따로 만들어놓고 붙여놓을 수 있음
		// 뷰에 뿌려지는 url 주소는 처음 열었던 서블릿으로 되어있음 (이경우는 hello) 
		
		// forward : 페이지 이동하기
		// 앞뒤로 다른 태그가 있어도 표시되지 않고 다른 페이지로 이동하게 됨

		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("<body>");
		
		pw.println("<h1>Hello Servlet Start</h1>");
		
		// include : 붙여넣기, 해당 서블릿을 중간에 끼워넣음 (페이지 이동x)
//		RequestDispatcher dis = req.getRequestDispatcher("include"); // web.xml에 등록된 이름으로
//		dis.include(req, resp);
	
		// forward  : 전진하기, 중간에 끼워넣지 않고 해당 서블릿으로 이동함
		RequestDispatcher dis = req.getRequestDispatcher("forward");
		dis.forward(req, resp);
		
		pw.println("<h1>Hello Servlet End</h1>");
		
		pw.println("</body>");
		pw.println("</head>");
		pw.println("</html>");
		pw.close();
		
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

	
}
