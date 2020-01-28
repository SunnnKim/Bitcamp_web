package dto;

import java.io.Serializable;

public class BBSDto implements Serializable {

	private int seq;	// 글의 고유 번호
	private String id;
	
	// 답변이 있는 게시판
	private int ref;	// 그룹번호
	private int step;	// 행번호 (row)
	private int depth;	// 깊이
	
	private String title;
	private String content;
	private String wdate;	// 작성일
	
	private int del;		// 지워졌는지에 대한 인덱스
	private int readcount;	// 조회수
	
	public BBSDto() {
		// TODO Auto-generated constructor stub
	}

	public BBSDto(int seq, String id, int ref, int step, int depth, String title, String content, String wdate, int del,
			int readcount) {
		super();
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
	}

	public BBSDto(String id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}
	
	

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	@Override
	public String toString() {
		return "BBSDto [seq=" + seq + ", id=" + id + ", ref=" + ref + ", step=" + step + ", depth=" + depth + ", title="
				+ title + ", content=" + content + ", wdate=" + wdate + ", del=" + del + ", readcount=" + readcount
				+ "]";
	}
	
	
	
	

	
	
	
}
