package calEx;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class CalendarDao {

	private static CalendarDao dao = null;
	private CalendarDao() {

	}
	public static CalendarDao getInstance() {
		if(dao == null ) dao = new CalendarDao();
		return dao;
	}
	
	// 나의 일정 데이터 가지고 오기 (월별)
	public List<CalendarDto> getCalendarList( String id, String yyyyMM ){	// id, 년+월 
		
		
		String sql = " SELECT SEQ,ID, TITLE, CONTENT, RDATE, WDATE " + 
				" FROM" + 
				" ( SELECT ROW_NUMBER()OVER( PARTITION BY SUBSTR(RDATE,1,8) ORDER BY RDATE ASC) AS RNUM, " + 
				"		SEQ,ID, TITLE, CONTENT, RDATE, WDATE " + 
				"   FROM CALENDAR " + 
				"   WHERE ID = ? AND SUBSTR(RDATE, 1, 6) = ? ) " + 
				" WHERE RNUM BETWEEN 1 AND 5  ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs=null;
		
		List<CalendarDto> list = new ArrayList<CalendarDto>();
	
		try {

			conn = DBConnection.getConnection();
			System.out.println("1/6 success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 success");
			
			psmt.setString(1, id);
			psmt.setString(2, yyyyMM);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 success");
			
			while(rs.next()) {
				int  i=1;
				CalendarDto dto = new CalendarDto(rs.getInt(i++),
												  rs.getString(i++), 
												  rs.getString(i++),
												  rs.getString(i++),
												  rs.getString(i++),
												  rs.getString(i++));
			
				list.add(dto);
			}
			System.out.println("4/6 success");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("fail");
		}
		
		finally{
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}
	
	public boolean addCalendar(CalendarDto cal) {
		
		String sql =  " INSERT INTO CALENDAR ( SEQ, ID, TITLE, CONTENT, RDATE, WDATE ) "
					+ " VALUES ( SEQ_CAL.NEXTVAL, ?, ?, ?, ?, SYSDATE ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {

			conn = DBConnection.getConnection();
			System.out.println("1/6 success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 success");
			
			psmt.setString(1, cal.getId());
			psmt.setString(2, cal.getTitle());
			psmt.setString(3, cal.getContent());
			psmt.setString(4, cal.getRdate());
			
			System.out.println("3/6 success");

			
			count = psmt.executeUpdate();
			
			System.out.println("4/6 success");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("fail");
		}
		
		finally{
			DBClose.close(psmt, conn,null);
		}
		
		return count>0? true:false;
		
		
	}
	
	// 일별 일정 데이터 리스트 받아오기
/*
 


 */
	public List<CalendarDto> getCalListByDay(String rdate){
		
		String sql = " SELECT * " + 
					 " FROM CALENDAR " + 
					 " WHERE SUBSTR(RDATE, 1,8) = ? " ;
		
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs=null;
		
		List<CalendarDto> list = new ArrayList<CalendarDto>();
	
		try {

			conn = DBConnection.getConnection();
			System.out.println("1/6 success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 success");
			
			psmt.setString(1, rdate);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 success");
			
			while(rs.next()) {
				int  i = 1;
				CalendarDto dto = new CalendarDto(rs.getInt(i++),
												  rs.getString(i++), 
												  rs.getString(i++),
												  rs.getString(i++),
												  rs.getString(i++),
												  rs.getString(i++));
			
				list.add(dto);
			}
			System.out.println("4/6 success");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("fail");
		}
		
		finally{
			DBClose.close(psmt, conn, rs);
		}
		return list;
		
	}
	
	
	// 일정 1개 보기
	public CalendarDto getCalendarOne( int seq ) {
			
		String sql = " SELECT * FROM CALENDAR "
				+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		 CalendarDto dto = null;
	
		try {

			conn = DBConnection.getConnection();
			System.out.println("1/6 success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 success");
			
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 success");
			
			while(rs.next()) {
				int  i = 1;
				dto = new CalendarDto(rs.getInt(i++),
									  rs.getString(i++), 
									  rs.getString(i++),
									  rs.getString(i++),
									  rs.getString(i++),
									  rs.getString(i++));

			}
			System.out.println("4/6 success");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("fail");
		}
		
		finally{
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
		
	}
	
	//update cal
	public boolean updateCal(String title, String content) {
		// 바꿀것 -> 
		//String
	return false;
	}
	
	
}
