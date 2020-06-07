package dto;

import java.io.Serializable;

public class FileDto implements Serializable {
	
	private int seq;
	private String filename;
	private String origin_name;
	private String filepath;
	private String bbs_name;
	private int bbs_seq;
	private int del;
	private int file_seq;
	
	
	
	
	public FileDto() {
	}
	public FileDto(int seq, String filename, String origin_name, String filepath, String bbs_name, int bbs_seq, int del,
			int file_seq) {
		super();
		this.seq = seq;
		this.filename = filename;
		this.origin_name = origin_name;
		this.filepath = filepath;
		this.bbs_name = bbs_name;
		this.bbs_seq = bbs_seq;
		this.del = del;
		this.file_seq = file_seq;
	}
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getOrigin_name() {
		return origin_name;
	}
	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getBbs_name() {
		return bbs_name;
	}
	public void setBbs_name(String bbs_name) {
		this.bbs_name = bbs_name;
	}
	public int getBbs_seq() {
		return bbs_seq;
	}
	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getFile_seq() {
		return file_seq;
	}
	public void setFile_seq(int file_seq) {
		this.file_seq = file_seq;
	}
	@Override
	public String toString() {
		return "FileDto [seq=" + seq + ", filename=" + filename + ", origin_name=" + origin_name + ", filepath="
				+ filepath + ", bbs_name=" + bbs_name + ", bbs_seq=" + bbs_seq + ", del=" + del + ", file_seq="
				+ file_seq + "]";
	}
	
	
	
	
}
