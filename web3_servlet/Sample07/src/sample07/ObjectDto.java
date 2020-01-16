package sample07;

import java.io.Serializable;

public class ObjectDto implements Serializable {	//Serializable : 직렬화

	private String name;
	private int age;
	private String fruits[];
	
	public ObjectDto() {
		
	
	}

	public ObjectDto(String name, int age, String[] fruits) {
		super();
		this.name = name;
		this.age = age;
		this.fruits = fruits;
	}
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String[] getFruits() {
		return fruits;
	}

	public void setFruits(String[] fruits) {
		this.fruits = fruits;
	}
	
	
	
	
}
