package ser;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//여기는 서버 영역!
public class HelloServlet extends HttpServlet{
	
	// servlet 을 만들기 위해서는 HttpServlet 클래스를 상속하여
	// doGet과 doPost 메소드를 오버라이딩한다 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// get방식일때는 이곳으로
		System.out.println("Hello Servlet doGet");
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// post방식일때는 이곳으로
		System.out.println("Hello Servlet doPost");
	}


}
