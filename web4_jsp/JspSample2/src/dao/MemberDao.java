package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

/*
 	ID VARCHAR2(50) PRIMARY KEY,
	PWD VARCHAR2(50) NOT NULL,
	NAME VARCHAR2(50) NOT NULL,
	EMAIL VARCHAR2(50) UNIQUE,
	AUTH NUMBER(1) NOT NULL
 
 */

public class MemberDao {
	// singleton
	private static MemberDao dao =  null;
	
	private MemberDao() {
		// DB initconnect
		DBConnection.initConnection();
	}
	
	public static MemberDao getInstance() {
		if( dao == null ) dao = new MemberDao();
		return dao;
	}
	
	
	// insert new Member
	public boolean insertMember(MemberDto dto) {
		
		String sql =  " INSERT INTO MEMBER ( ID, PWD, NAME, EMAIL, AUTH ) "
					+ " VALUES ( ?, ?, ?, ?, 3 ) ";	// 회원은 모두 AUTH = 3
		
		
		// 기본 세팅 = NULL
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;	// update이기 때문에  executeQuery -> int 반환
		System.out.println("1/6 insert success");
		
		
		try {

			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			// ? 값 세팅하기
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			
			System.out.println("2/6 insert success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 insert success");

		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("insert fail");
		}
		
		finally {
			
			DBClose.close(psmt, conn, null);
		}
		
		System.out.println("4/6 insert success");
		return count>0? true:false;
	}
	
	
	// id check
	public boolean idCheck() {
		
		
		return false;
		
		
	}
	
	
	
	
}
