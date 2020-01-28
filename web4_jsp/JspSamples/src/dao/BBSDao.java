package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
		
		String sql =  " INSERT INTO BBS ( SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DEL, READCOUNT ) "
					+ " VALUES ( SEQ_BBS.NEXTVAL, ?, 0, 0, 0, ?, ?, TO_DATE( ? , 'YYYY-MM-DD'), 0, 0 ) ";
				System.out.println(sql);
//		INSERT INTO BBS
//		VALUES ( SEQ_BBS.NEXTVAL, 'asd', 0, 0, 0, 'asd1', 'asd1', TO_DATE( '2020-1-29', 'YYYY-MM-DD'), 0, 0 )
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			System.out.println(dto.getId());
			System.out.println(dto.getTitle());
			System.out.println(dto.getContent());
			System.out.println(dto.getWdate());
			
			conn = DBConnection.getConnection();	
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getWdate());
		
			
			
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
	
	
	
	
}
