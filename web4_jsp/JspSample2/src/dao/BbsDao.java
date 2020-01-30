package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;

public class BbsDao {

	private static BbsDao dao = null;
	
	private BbsDao() {
		// TODO Auto-generated constructor stub
	}
	
	public static BbsDao getInstance() {
		if( dao == null ) dao = new BbsDao();
		return dao;
	}
	
	/*
		SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DEL, READCOUNT
	 */
	
	// 모든 글 가져오기 + 페이징
	public List<BbsDto> getBbsList(int page){
		
		String sql =  " SELECT * "
					+ " FROM ( SELECT ROW_NUMBER()OVER( ORDER BY REF DESC, STEP ASC ) AS RNUM,"
								+ " SEQ, ID, "
								+ " REF, STEP, DEPTH, "
								+ " TITLE, CONTENT, WDATE, DEL, READCOUNT "
							+ " FROM BBS "
							+ " WHERE DEL = 0 OR ( DEL = 1 AND DEPTH = 0 ) "
							+ " ORDER BY REF DESC, STEP ASC ) "
					+ " WHERE RNUM >= ? AND RNUM <= ? ";
		
		// 페이지 시작 번호 + 끝번호
		int start, end;
		start = 1 + 10 * page;
		end = 10 + 10 * page;
		
		
		// setting
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BbsDto> list = new ArrayList<>();
		
		try {
		
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);

			rs = psmt.executeQuery();
			
			while(rs.next()) {
					int i = 1;
				BbsDto dto = new BbsDto(rs.getInt(i++),
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
	
	
	// 글 추가하기
	public boolean insertBbs(BbsDto dto) {
		
		String sql =  " INSERT INTO BBS ( SEQ, ID, "
					+ " REF, STEP, DEPTH, "
					+ " TITLE, CONTENT, WDATE,"
					+ " DEL, READCOUNT ) "
					+ " VALUES ( SEQ_BBS.NEXTVAL, ? , "
					+ " ( SELECT NVL( MAX(REF), 0)+1 FROM BBS ) , 0 , 0 , "	// REF는 그룹번호로, 게시판에 올라간 인덱스 번호
					+ " ? , ? , SYSDATE , "
					+ " 0, 0 ) ";
		
		// setting
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
		
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getTitle());

		
			count = psmt.executeUpdate();
			
		
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
