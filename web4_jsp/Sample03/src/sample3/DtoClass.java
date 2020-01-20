package sample3;

import java.io.Serializable;

public class DtoClass implements Serializable {

	private String addr;
	private int age;
	
	
	public DtoClass() {
	}
	
	
	public DtoClass(String addr, int age) {
		super();
		this.addr = addr;
		this.age = age;
	}
	
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
	
	
}
