package dto;

import java.io.Serializable;

public class MemberDto implements Serializable{

	private String msg;
	public MemberDto() {
		// TODO Auto-generated constructor stub
	}
	public MemberDto(String msg) {
		this.msg = msg;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
