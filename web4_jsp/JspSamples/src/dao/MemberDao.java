package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDao {

	private static MemberDao dao;
	
	private MemberDao() {
		DBConnection.initConnection();	// DB 키기
	}
	public static MemberDao getInstance() {
		if( dao == null ) dao = new MemberDao();
		return dao;
	}
	
	public boolean addMem( MemberDto dto) {
		
		String sql = " INSERT INTO MEMBER ( ID, PWD, NAME, EMAIL, AUTH )"
						+ " VALUES ( ?, ?, ?, ?, 3 ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("1/6 addMember success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addMember success");
			
			psmt.setString(1,dto.getId());	// id
			psmt.setString(2,dto.getPwd());	// pwd
			psmt.setString(3,dto.getName());	// name
			psmt.setString(4,dto.getEmail());	// email

			count = psmt.executeUpdate();
			System.out.println("3/6 addMember success");
			
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("addMember fail");
		}
		finally {
			DBClose.close(psmt, conn, null);
		}
		System.out.println("4/6 addMember success");
		
		return count>0 ? true : false;
	}
	
	
	// 중복된 id확인하기
	public boolean checkid(String id) {
		boolean b= false;
		String sql = " SELECT ID"
				+ " FROM MEMBER "
				+ " WHERE ID = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs=null;
		
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("1/6 addMember success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addMember success");
			
			psmt.setString(1,id);	// id
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				b = true;
			}
			
			System.out.println("3/6 addMember success");
			
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("addMember fail");
		}
		finally {
			DBClose.close(psmt, conn, rs);
		}
		System.out.println("4/6 addMember success");
		
		return b;
		
		
	}
	
	// login
	public MemberDto login(String id, String pwd) {
		
		MemberDto loginuser = null;
		String sql =  " SELECT ID, NAME, EMAIL "
					+ " FROM MEMBER "
					+ " WHERE ID = ? AND PWD = ? ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("1/6 success");
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			
			rs = psmt.executeQuery();
			System.out.println("2/6 success");
			
			if(rs.next()) {
				System.out.println(rs.getString(1));
				String _id = rs.getString(1);
				String _name = rs.getString(2);
				String _email = rs.getString(3);
				loginuser = new MemberDto(_id, null, _name, _email, 3);
			}
			System.out.println("3/6 success");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("fail to connect");
		}
		finally {
			DBClose.close(psmt, conn, rs);
		}
		
		System.out.println("4/6 success");
		
		return loginuser;
	}
	
}
