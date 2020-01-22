package ajax03;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.CustUserDto;
import net.sf.json.JSONObject;

@WebServlet("/custuser")
public class CustUser extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 
		// get으로 받기
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		System.out.println(id);
		System.out.println(pwd);
		// 1. 데이터 하나만 보내보기
		String data = "{ \"name\":\"aaa\" }";
		
		String str = "안녕";
		
		String json = "{ \"str\":\" "+ str+ "\" }";
		// req.setAttribute("str", json);	// key, value

		/*
		PrintWriter out = resp.getWriter();
		out.println(data);
		 */
		
		JSONObject obj = new JSONObject();
		//obj.put("str", str);
		
		// 데이터 여러개 보내기 (map)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("title", "apple");
		// req.setAttribute("map", map); // map으로 날리기
		
		// list보내기
		List<CustUserDto> list = new ArrayList<CustUserDto>();
		list.add(new CustUserDto(101, "홍길동"));
		list.add(new CustUserDto(102, "일지매"));
		map.put("list", list);
		
		
		obj.put("map", map);
		resp.setContentType("application/x-json; charset=UTF-8");
		resp.getWriter().print(obj);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}

	
}
