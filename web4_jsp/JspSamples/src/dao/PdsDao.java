package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.PdsDto;

public class PdsDao {
	
	private static PdsDao dao = null;
	
	private PdsDao() {
		// TODO Auto-generated constructor stub
	}

	public static PdsDao getInstance() {
		if(dao == null ) dao = new PdsDao();
		return dao;
	}
	
	public List<PdsDto> getPdsList(){
		String sql =  " SELECT SEQ, ID, TITLE, CONTENT, FILENAME, READCOUNT, DOWNCOUNT, REGDATE "
					+ " FROM PDS "
					+ " ORDER BY SEQ DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PdsDto> list = new ArrayList<PdsDto>();
		
		try {

			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int i = 1;
				PdsDto dto = new PdsDto(rs.getInt(i++),
										rs.getString(i++), 
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getInt(i++),
										rs.getInt(i++),
										rs.getString(i++));
				
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
			
		}
		return list;
		
	}
	
	public boolean writePds(PdsDto pds) {
		String sql =  " INSERT INTO PDS ( SEQ, ID, TITLE, CONTENT, FILENAME, READCOUNT, DOWNCOUNT, REGDATE ) "
					+ " VALUES ( SEQ_PDS.NEXTVAL, ?, ?, ?, ?, 0, 0, SYSDATE ) ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
		
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pds.getId());
			psmt.setString(2, pds.getTitle());
			psmt.setString(3, pds.getContent());
			psmt.setString(4, pds.getFilename());
		
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			DBClose.close(psmt, conn, null);
			
		}
		return count>0 ? true:false;
		
	}

	// 자료실 파일 다운로드 수 올리기
	public void downCount(int seq) {
		String sql =  " UPDATE PDS "
					+ " SET DOWNCOUNT = DOWNCOUNT + 1 "
					+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0 ; 
		
		try {
		
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq );
		
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			DBClose.close(psmt, conn, null);
			
		}
		
	}
	
	// 자료실 파일 조회수 올리기
	public void readCount(int seq) {
		String sql =  " UPDATE PDS "
					+ " SET READCOUNT = READCOUNT + 1 "
					+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0 ; 
		
		try {
		
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq );
		
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			DBClose.close(psmt, conn, null);
			
		}
		
	}
	
	
	// 자료실 파일 디테일보기
	public PdsDto getPdsDetail(int seq) {
		
		String sql =  " SELECT SEQ, ID, TITLE, CONTENT, FILENAME, READCOUNT, DOWNCOUNT, REGDATE "
					+ " FROM PDS "
					+ " WHERE SEQ  = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		PdsDto dto = null;
		
		try {

			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			
			
			if(rs.next()) {
				int i = 1;
				dto = new PdsDto(rs.getInt(i++),
										rs.getString(i++), 
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getInt(i++),
										rs.getInt(i++),
										rs.getString(i++));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
			
		}
		
		return dto;
		
		
	}
	
	// 파일 수정하기
	public boolean updatePds(String title, String content, String filename, int seq ) {
		
		String sql =  " UPDATE PDS"
				+ " SET TITLE = ?, CONTENT=?, FILENAME = ?"
				+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
		
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, filename);
			psmt.setInt(4, seq);
		
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			DBClose.close(psmt, conn, null);
			
		}
		return count>0 ? true:false;
		
	}
	
	
	// 파일 삭제하기
	public boolean deletePds(int seq) {
		
		String sql =  " DELETE FROM PDS "
					+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0 ; 
		
		try {
		
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq );
		
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			DBClose.close(psmt, conn, null);
			
		}
		return count>0 ? true:false;
	}
	
	
	
	
}
