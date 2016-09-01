package vfront.github.pr01.jh;

import org.apache.ibatis.type.Alias;

@Alias("yodol")
public class JhDTO {
	
	private String name;
	private String id;
	private String pw;
	private String addr;
	
	
	
	
	
	public JhDTO() {
		super();
	}
	public JhDTO(String name, String id, String pw, String addr) {
		super();
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.addr = addr;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	@Override
	public String toString() {
		return "JhDTO [name=" + name + ", id=" + id + ", pw=" + pw + ", addr=" + addr + "]";
	}
	
	
	
	

}
