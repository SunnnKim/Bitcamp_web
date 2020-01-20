package sam;
import java.io.Serializable;

public class Human implements Serializable{
	
	private int num;
	private String name;
	
	public Human() {
		// TODO Auto-generated constructor stub
	}

	public Human(int num, String name) {
		super();
		this.num = num;
		this.name = name;
	}

	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	
	
	
}
