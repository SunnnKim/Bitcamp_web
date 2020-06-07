package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.FileDto;

public class FileDao {
	
	private static FileDao dao = null;
	
	private FileDao() {
		DBConnection.initConnection();
	}
	public static FileDao getInstance() {
		if(dao == null )dao = new FileDao();
		return dao;
	}
	
	public boolean insertFiles(FileDto dto) {
		
		String sql =  " INSERT INTO FILES ( SEQ, FILENAME, ORIGIN_NAME, FILEPATH, BBS_NAME, BBS_SEQ, DEL, FILE_SEQ )"
					+ " VALUES ( SEQ_FILES.NEXTVAL, ?, ?, ?, ?, ?, 0, ? ) "; 
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 writePds success");
				
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getFilename());
			psmt.setString(2, dto.getOrigin_name());
			psmt.setString(3, dto.getFilepath());
			psmt.setString(4, dto.getBbs_name());
			psmt.setInt(5, dto.getBbs_seq());
			psmt.setInt(6, dto.getFile_seq());
			
			System.out.println("2/6 writePds success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 writePds success");
			
		} catch (SQLException e) {
			System.out.println("writePds fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);			
		}
		
		return count>0?true:false;	
		
	}
}
