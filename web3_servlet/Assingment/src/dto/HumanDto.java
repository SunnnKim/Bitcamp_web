package dto;

import java.io.Serializable;
import java.util.Arrays;

public class HumanDto implements Serializable{

	private String name;
	private String age;
	private String gender;
	private String[] hobby;
	
	
	public HumanDto() {
		// TODO Auto-generated constructor stub
	}


	public HumanDto(String name, String age, String gender, String[] hobby) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.hobby = hobby;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String[] getHobby() {
		return hobby;
	}


	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}


	@Override
	public String toString() {
		return "HumanDto [name=" + name + ", age=" + age + ", gender=" + gender + ", hobby=" + Arrays.toString(hobby)
				+ "]";
	}
	
	
	
	
	
	
}
