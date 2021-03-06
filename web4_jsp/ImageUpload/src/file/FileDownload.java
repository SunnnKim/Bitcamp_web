package file;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/filedownload")
public class FileDownload extends HttpServlet{

   @Override
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
	  response.setContentType("text/html; charset=utf-8");

	  request.setCharacterEncoding("utf-8");
	  response.setCharacterEncoding("utf-8");
	  
	  System.out.println("file download connected");
      String filename = request.getParameter("filename");
      System.out.println(filename);
//      String uploadRoot = "/Users/sunjukim/Desktop/tmp_pic/";
      String uploadRoot = request.getSession().getServletContext().getRealPath("/ababab/");
      System.out.println(uploadRoot);

      File f = new File(uploadRoot + filename);

      response.setHeader("Content-Type", "image/jpg");

      // 파일을 읽고 사용자에게 전송
      FileInputStream fis = new FileInputStream(f);
      BufferedInputStream bis = new BufferedInputStream(fis);
      OutputStream out = response.getOutputStream();
      BufferedOutputStream bos = new BufferedOutputStream(out);
      
      while (true) {
         int ch = bis.read();
         if (ch == -1)
            break;
         bos.write(ch);
      }

      bis.close();
      fis.close();
      bos.close();
      out.close();
   }
}
