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
	
	public List<BBSDto> getList(){
		
		String sql =  " SELECT SEQ, ID, REF, STEP, DEPTH, "
					+ " TITLE, CONTENT, WDATE, DEL, READCOUNT "
					+ " FROM BBS "
					+ " ORDER BY REF DESC, STEP ASC ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BBSDto> list = new ArrayList<BBSDto>();
		
		try {
			
			conn = DBConnection.getConnection();	
			psmt = conn.prepareStatement(sql);
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
				String sql =  " DELETE FROM BBS "
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
}
