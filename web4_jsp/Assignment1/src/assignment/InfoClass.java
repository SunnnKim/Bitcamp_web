package assignment;

import java.io.Serializable;
import java.util.Arrays;

public class InfoClass implements Serializable {
	
	private String id;
	private String pw;
	private String[] hobby;
	private int age;
	private String detail;
	
	public InfoClass() {
	}

	public InfoClass(String id, String pw, String[] hobby, int age, String detail) {
		super();
		this.id = id;
		this.pw = pw;
		this.hobby = hobby;
		this.age = age;
		this.detail = detail;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Override
	public String toString() {
		return "InfoClass [id=" + id + ", pw=" + pw + ", hobby=" + Arrays.toString(hobby) + ", age=" + age + ", detail="
				+ detail + "]";
	}
	
	
	
	
}
