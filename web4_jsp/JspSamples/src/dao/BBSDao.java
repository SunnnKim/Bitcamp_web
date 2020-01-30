package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BBSDto;

public class BBSDao {

	private static BBSDao dao = null;
	
	private BBSDao() {

	}
	public static BBSDao getInstance() {
		if(dao == null) dao = new BBSDao();
		return dao;
	}
	
	// write Bbs
	public boolean writeBbs( BBSDto dto) {
		//  seq,  id,  ref,  step,  depth,  title,  content,  wdate,  del, readcount
		
		String sql =  " INSERT INTO BBS ( "
					+ " SEQ, ID,"
					+ " REF, STEP, DEPTH,"
					+ " TITLE, CONTENT, WDATE,"
					+ " DEL, READCOUNT ) "
					+ " VALUES ("
					+ " SEQ_BBS.NEXTVAL, ?, "	// SEQ, ID
					+ " (SELECT NVL(MAX(REF), 0)+1 FROM BBS),"	// REF: 서브쿼리로 작성,REF값이 있으면 MAX값의 +1을 대입, 없으면 0+1
					+ " 0, 0, " 	// STEP, DEPTH
					+ " ?, ?, SYSDATE, "	// TITLE, CONTENT, WDATE
					+ " 0, 0 ) ";			// DEL, READCOUNT

		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			
			conn = DBConnection.getConnection();	
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
 
		
			
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false;
	}
	// 전체 글의 개수 구하는 함수
	public int getAllBbs(String optionpick, String txt) {
		
		String sql = " SELECT COUNT(*) FROM BBS "
				+ " WHERE ( DEL = 0 OR ( DEL = 1 AND  DEPTH = 0 ) ) ";
		
		String sqlWord = "";
		if(optionpick.equals("title")) {
			sqlWord = "AND TITLE LIKE '%" + txt.trim() + "%' ";
		}else if(optionpick.equals("id")) {
			sqlWord = "AND ID='" + txt.trim() + "'";
		}else if(optionpick.equals("content")) {
			sqlWord = "AND CONTENT LIKE '%" + txt.trim() + "%' ";
		}
		sql += sqlWord;
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int len = 0;
		
		try {
			
			conn = DBConnection.getConnection();	
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if( rs.next()) {
				len = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			DBClose.close(psmt, conn, null);
		}
		return len;
	}
	
	
	
	public List<BBSDto> getBbsPageList(int page){
		
		String sql =  " SELECT SEQ, ID, REF, STEP, DEPTH, "
					+ " TITLE, CONTENT, WDATE, DEL, READCOUNT "
					+ " FROM ";
		
		// PAGING (SUB QUERY)
				sql += " ( SELECT ROW_NUMBER()OVER( ORDER BY REF DESC, STEP ASC ) AS RNUM,"
						+ " SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DEL, READCOUNT "
						+ " FROM BBS "
						+ " WHERE DEL = 0 OR ( DEL = 1 AND  DEPTH = 0 ) "
						+ " ORDER BY REF DESC, STEP ASC ) ";
				sql += " WHERE RNUM >= ? AND RNUM <= ? ";
				
		/*
		 
			1. ROWNUM
			2. 검색
			3. 정렬
			4. 범위 : 1 ~ 10
			
		*/
		
		// 글의 갯수
		int start, end;
		start = 1 + 10 * page;	// 0 -> 1	1 -> 11
		end = 10 + 10 * page;	// 0 -> 10  1 -> 20

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BBSDto> list = new ArrayList<BBSDto>();
		
		try {
			
			conn = DBConnection.getConnection();	
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			rs = psmt.executeQuery();
			
			while( rs.next()) {
				int i = 1;
				BBSDto dto = new BBSDto(rs.getInt(i++),
										rs.getString(i++),
										rs.getInt(i++),
										rs.getInt(i++),
										rs.getInt(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getInt(i++),
										rs.getInt(i++));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			DBClose.close(psmt, conn, null);
		}
		
		return list;
	}
	
	
	
	public BBSDto showBbs(int seq) {
		
		String sql = " SELECT * FROM BBS "
				+ " WHERE SEQ = " + seq;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		BBSDto dto = null;
		
		try {
			
			conn = DBConnection.getConnection();	
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if( rs.next()) {
				int i = 1;
				dto = new BBSDto(rs.getInt(i++),
										rs.getString(i++),
										rs.getInt(i++),
										rs.getInt(i++),
										rs.getInt(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getInt(i++),
										rs.getInt(i++));
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			DBClose.close(psmt, conn, null);
		}
		
		
		return dto;
	}
	// readcount 올리기
	public void readCount(int seq) {
		
		String sql =  " UPDATE BBS "
					+ " SET READCOUNT = READCOUNT + 1 " 
					+ " WHERE SEQ = " + seq;
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			
			conn = DBConnection.getConnection();	
			psmt = conn.prepareStatement(sql);
			count = psmt.executeUpdate();
			
			
			System.out.println(count);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			DBClose.close(psmt, conn, null);
		}
		
		
	}
	
	public boolean updateBbs(String title, String content, int seq) {
		// 바뀐 내용
		// title, content, wdate, 
		String sql =  " UPDATE BBS "
					+ " SET TITLE = ?, CONTENT = ?, WDATE = SYSDATE "
					+ " WHERE SEQ = " + seq;
				
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			
			conn = DBConnection.getConnection();	
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			
			
			count = psmt.executeUpdate();
			
			
			System.out.println(count);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0? true:false;
		
	}
	
	// delete
	public boolean deletebbs(int seq) {
		
				String sql =  " UPDATE BBS "
							+ " SET DEL = 1 "
							+ " WHERE SEQ = " + seq;
						
				Connection conn = null;
				PreparedStatement psmt = null;
				int count = 0;
				
				try {
					
					conn = DBConnection.getConnection();	
					psmt = conn.prepareStatement(sql);
					
					
					count = psmt.executeUpdate();
					
					
					System.out.println(count);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				finally {
					DBClose.close(psmt, conn, null);
				}
				return count>0? true:false;
				
		
	}
	
	
	
	// 답글 달기
	public boolean answer(int seq, BBSDto bbs ) {
						// 부모글의 seq, 답글의 obj
		
		// 여기서는 두가지 작업을 해준다. (UPDATE + INSERT)
		// update =>
		String sql1=  " UPDATE BBS "
					+ " SET STEP = STEP + 1 "
					+ " WHERE REF = ( SELECT REF FROM BBS"
									+ " WHERE SEQ = ? )"
					+ "		AND STEP > ( SELECT STEP FROM BBS"
									+ " WHERE SEQ = ? ) ";
		
		
		// new post insert
		String sql2 = " INSERT INTO BBS ( SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DEL, READCOUNT )"
					+ " VALUES ( SEQ_BBS.NEXTVAL, ?, "
							+" ( SELECT REF FROM BBS WHERE SEQ = ? ), "	// REF
							+" ( SELECT STEP FROM BBS WHERE SEQ = ? ) + 1,"	// STEP : 부모 글의 STEP+1
							+" ( SELECT DEPTH FROM BBS WHERE SEQ = ? ) + 1,"	// DEPTH
							+" ? , ?, SYSDATE, 0, 0 ) ";	
							
							
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			
			// 여러 코드 한번에 execute 하기 
			conn = DBConnection.getConnection();
			
			// conn 얻어온 이후에 auto-commit꺼주기
			conn.setAutoCommit(false);
			
			// update execute
			psmt = conn.prepareStatement(sql1);
			
			psmt.setInt(1, seq);
			psmt.setInt(2, seq);
			System.out.println("2/6 answer success");

			
			count = psmt.executeUpdate();
			System.out.println("3/6 answer success");
			
			// psmt 초기화 : 한꺼번에 두개 이상의 쿼리문 실행하고 싶을 때 사용
			psmt.clearParameters();
			
			// insert
			psmt = conn.prepareStatement(sql2);
			
			psmt.setString(1, bbs.getId());
			psmt.setInt(2, seq);	// ref
			psmt.setInt(3, seq);	// step
			psmt.setInt(4, seq);	// depth
			psmt.setString(5, bbs.getTitle());
			psmt.setString(6, bbs.getContent());
			count = psmt.executeUpdate();
			System.out.println("4/6 answer success");
			
			conn.commit();
			System.out.println("5/6 answer success");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				System.out.println("answer fail");
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		finally {
			try {
				DBClose.close(psmt, conn, null);
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		System.out.println("6/6 answer success");
		return count>0? true:false;
				
		
		
	}
	
	// search
	public List<BBSDto> searchBbs(String optionpick, String txt, int page){
		
		List<BBSDto> slist = new ArrayList<BBSDto>();

	 String sql =  " SELECT SEQ, ID, REF, STEP, DEPTH, "
					+ " TITLE, CONTENT, WDATE, DEL, READCOUNT "
					+ " FROM ";
		
		// PAGING (SUB QUERY)
				sql += " ( SELECT ROW_NUMBER()OVER( ORDER BY REF DESC, STEP ASC ) AS RNUM,"
						+ " SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DEL, READCOUNT "
						+ " FROM BBS ";
				
		String sqlWord = "";
		if(optionpick.equals("title")) {
			sqlWord = " WHERE TITLE LIKE '%" + txt.trim() + "%' ";
		}else if(optionpick.equals("id")) {
			sqlWord = " WHERE ID ='" + txt.trim() + "'";
		}else if(optionpick.equals("content")) {
			sqlWord = " WHERE CONTENT LIKE '%" + txt.trim() + "%' ";
		}
		sql += sqlWord;
		
						
		sql += " AND DEL = 0 "
		+ " ORDER BY REF DESC, STEP ASC ) "
		+ " WHERE RNUM >= ? AND RNUM <= ? ";
		
	 
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		
	
		
		
		int start, end;
		start = 1 + 10 * page;	// 0 -> 1	1 -> 11
		end = 10 + 10 * page;	// 0 -> 10  1 -> 20
		
		
		try {
			
			conn = DBConnection.getConnection();	
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			rs = psmt.executeQuery();
			
			while( rs.next()) {
				int i = 1;
				BBSDto dto = new BBSDto(rs.getInt(i++),
										rs.getString(i++),
										rs.getInt(i++),
										rs.getInt(i++),
										rs.getInt(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getInt(i++),
										rs.getInt(i++));
				
				slist.add(dto);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			DBClose.close(psmt, conn, null);
		}
		
		return slist;
		
	}
	
	
}
