package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.CustUserDto;

public class CustUserDao {
	
	private static CustUserDao dao = null;
	private CustUserDao() {
		// JDBC
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
	public static CustUserDao getInstance() {
		if(dao == null ) dao = new CustUserDao();
		return dao;
	}
	
	// 고객정보를 뿌려주는 메소드
	public List<CustUserDto> getCustUserList(){
		
		String sql = " SELECT ID, NAME, ADDRESS "
				   + " FROM CUSTUSER "
				   + " ORDER BY ID DESC ";	// ID순서로 정렬하여 불러오기
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<CustUserDto> list = new ArrayList<CustUserDto>();
		
		try {
	
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while ( rs.next()) { 
				String id = rs.getString("ID");
				String name = rs.getString("NAME");
				String address = rs.getString("ADDRESS");
				
				list.add(new CustUserDto(id, name, address));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			// 닫기
			close(conn, psmt, rs);
		}
		
		return list;
	}
	
	// insert

	public boolean addCustUser(String id, String name, String address) {
		

		String sql = " INSERT INTO CUSTUSER ( ID, NAME, ADDRESS ) "
				   + " VALUES ( ?, ?, ? ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
	
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, address);
			count = psmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			// 닫기
			close(conn, psmt, null);
		}
		
		return count>0? true : false;
	}
	
	// Data Detail보기
	public CustUserDto showCustUserDetail(String id) {
		
		String sql = " SELECT  ID, NAME, ADDRESS"
				   + " FROM CUSTUSER "
				   + " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		CustUserDto dto = null;
		
		try {
	
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while(rs.next()) {
				String _id = rs.getString(1);
				String _name = rs.getString(2);
				String _address = rs.getString(3);
				dto = new CustUserDto(_id, _name, _address);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			// 닫기
			close(conn, psmt, null);
		}
		
		return dto;
	}
	
	// update
	public boolean updateCustUser(String id, String address) {
			
			String sql = " UPDATE CUSTUSER"
						   + " SET ADDRESS = ?"
						   + " WHERE ID = ? ";
			
			Connection conn = null;
			PreparedStatement psmt = null;

			int count = 0;
			
			try {
		
				conn = getConnection();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, address);
				psmt.setString(2, id);
				
				count = psmt.executeUpdate();
	
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				// 닫기
				close(conn, psmt, null);
			}
			
			return count>0? true:false;
			
			
		}
	
	// 1개 지우기
	public boolean deleteOne(String id) {
		
		String sql =  " DELETE FROM CUSTUSER "
					+ " WHERE ID = ? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = getConnection();
			conn.setAutoCommit(false); // 데이터 잘못될 수도 있으니 꺼준다
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id);
			
			
			count = psmt.executeUpdate();
			// 여기까지 오면 정상실행된 것
			// 커밋한다
			conn.commit();
				
		} catch (SQLException e) {
			e.printStackTrace();
			// 데이터 넣고 오류가 발생하면 롤백하기
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		finally {
			try {
				// 아까 꺼둔 autoCommit 켜주기
				conn.setAutoCommit(true);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			close(conn, psmt, null);
			
		}
		return count>0? true : false;
	}
		

	// 2개이상 지우기
	// executeBatch 실행하기
	public boolean deleteCustusers(String ids[]) {
		
		String sql =  " DELETE FROM CUSTUSER "
					+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count[] = new int[ids.length];
		try {
			conn = getConnection();
			conn.setAutoCommit(false); // 데이터 잘못될 수도 있으니 꺼준다
			
			psmt = conn.prepareStatement(sql);
			for (int i = 0; i < ids.length; i++) {
				psmt.setString(1,ids[i]);
				psmt.addBatch();	// 데이터 넣으면서 축적시킴
				// 같은 코드를 반복해서 실행하기 위해서
			}
			
			count = psmt.executeBatch();
			// 여기까지 오면 정상실행된 것
			// 커밋한다
			conn.commit();
				
		} catch (SQLException e) {
			e.printStackTrace();
			// 데이터 넣고 오류가 발생하면 롤백하기
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		finally {
			try {
				// 아까 꺼둔 autoCommit 켜주기
				conn.setAutoCommit(true);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			close(conn, psmt, null);
			
		}
		
		boolean isS = true;
		for (int i = 0; i < count.length; i++) {
			if(count[i] != -2) {
				// -2 는 정상종료임
				isS = false;
			}
		}
		
		return isS;
	}
	
	// search - select
	public List<CustUserDto> searchCustuser (int choice, String data) {
		
		List<CustUserDto> sList = new ArrayList<CustUserDto>();
		
		String sql = " SELECT  ID, NAME, ADDRESS "
				   + " FROM CUSTUSER " ;
		if(choice == 1 ) {
			// Id 찾기
			sql += " WHERE ID = ? ";
		}
		else if(choice == 2 ) {
			// Name으로 찾기
			sql += " WHERE NAME LIKE ? ";
		}else {
			// address 로 찾기
			sql += " WHERE ADDRESS LIKE ? ";
		}
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		CustUserDto dto = null;
		try {
	
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			if(choice == 1 ) {
				psmt.setString(1, data);
			}else {
				psmt.setString(1, "%"+data+"%");
			}
			rs = psmt.executeQuery();

			while(rs.next()) {
				String _id = rs.getString(1);
				String _name = rs.getString(2);
				String _address = rs.getString(3);
				dto = new CustUserDto(_id, _name, _address);
				sList.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			// 닫기
			close(conn, psmt, null);
		}
		
		return sList;
	}	
	
	// TODO: JDBC 메소드
	// JDBC연결하는 메소드
	public Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";	// DB Development에 등록된 주소
		String user = "hr";
		String password = "hr";
		// JDBC
		Connection conn = DriverManager.getConnection(url,user, password); 

		return conn;
	}
	// JDBC요소들 닫는 메소드
	public void close(Connection conn, PreparedStatement psmt, ResultSet rs) {
		
			try {
				
				if(conn != null ) conn.close();
				if(psmt != null ) psmt.close();
				if(rs != null ) rs.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
}
