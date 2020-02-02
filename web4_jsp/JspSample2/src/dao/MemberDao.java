package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	
	
	// 회원가입시 아이디확인 
	public boolean idCheck() {
		
		
		return false;
		
		
	}
	
	// 로그인시 아이디 비밀번호 확인
	public boolean checkLogin(String id, String pwd) {
		
		String sql =  " SELECT COUNT(*) "
					+ " FROM MEMBER "
					+ " WHERE ID = ? AND PWD = ? ";
		
		// 기본 세팅 = NULL
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("1/6 check success");
		
		int count=0; // 아이디 비밀번호가 맞는지 확인하기
		
		try {

			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			// ? 값 세팅하기
			psmt.setString(1,id);
			psmt.setString(2,pwd);
			
			System.out.println("2/6 check success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 check success");

			if(rs.next()) {
				
				count = rs.getInt(1);
				
			}
			
			
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("fail");
		}
		
		finally {
			
			DBClose.close(psmt, conn, null);
		}
		
		System.out.println("4/6 check success");
		return count>0? true:false;
		
		
	}
	
	// 로그인 정보 가져오기
	public MemberDto getLoginUser(String id) {

		String sql =  " SELECT ID, NAME, EMAIL "
					+ " FROM MEMBER "
					+ " WHERE ID = ? ";
		
		// 기본 세팅 = NULL
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("1/6 check success");
		

		MemberDto dto = new MemberDto();
		
		try {

			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			// ? 값 세팅하기
			psmt.setString(1,id);
			
			System.out.println("2/6 check success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 check success");

			if(rs.next()) {
				
				
				String _id = rs.getString(1);
				String _name = rs.getString(2);
				String _email = rs.getString(3);
				
				dto.setId(_id);
				dto.setName(_name);
				dto.setEmail(_email);
			}
			
			
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("fail");
		}
		
		finally {
			
			DBClose.close(psmt, conn, null);
		}
		
		System.out.println("4/6 check success");
		return dto;
		
		
	}
	
	
}
