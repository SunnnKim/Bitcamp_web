package sample08;

import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Member;

public class SampleServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String name = req.getParameter("name");
		
		// 1번 : sendRedirect 는 doGet으로 감
		
	
		String age = req.getParameter("age");
		
		System.out.println("SampleServlet doGet");
		System.out.println("name = " + name);
		System.out.println("age = " + age);

		
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("SampleServlet doPost");

		
		// 2번 : RequestDispatcher 는 post면 post, get이면 get으로 감 (데이터 보내준 서블릿의 메소드 방식을 따름)
		Object obj = req.getAttribute("dto");
		Member mem = (Member)obj;
		
		System.out.println(mem); //확인
		
		
		
		// 다시 form으로 이동하기 : sendRedirect / forward 중 사용 -> jsp파일로 이동
		String name = "성춘향";
		int age = 25;
		
		Member member = new Member(name, age);	// form으로 가기위한 포장
		// 패키징
		req.setAttribute("member", member);
		// 이동할 페이지 + 짐 챙기기
		req.getRequestDispatcher("detail.jsp").forward(req, resp);;
		
		
		
		
		
	}

}
