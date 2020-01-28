package dao;

import dto.BBSDto;

public class BBSDao {

	private static BBSDao dao = null;
	
	private BBSDao() {

	}
	public static BBSDao getInstance() {
		if(dao == null) dao = new BBSDao();
		return dao;
	}
	
	public boolean writeBbs( BBSDto dto) {
		//  seq,  id,  ref,  step,  depth,  title,  content,  wdate,  del, readcount
		boolean b = false;
		
		String sql =  " INSERT INTO BBS ( SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DEL, READCOUNT ) "
					+ " VALUES ( SEQ_BBS.NEXTVAL, ?, 0, 0, 0, ?, ?,  ) ";
				
		return b;
	}
}
