package com.fp.person.model.vo;

public class Person {
	private int pNo;
	private String pName;
	private String pJob;
	private String pBD;
	private String pNation;
	private String pFile;
	
	public Person() {}

	public Person(int pNo, String pName, String pJob, String pBD, String pNation, String pFile) {
		super();
		this.pNo = pNo;
		this.pName = pName;
		this.pJob = pJob;
		this.pBD = pBD;
		this.pNation = pNation;
		this.pFile = pFile;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpJob() {
		return pJob;
	}

	public void setpJob(String pJob) {
		this.pJob = pJob;
	}

	public String getpBD() {
		return pBD;
	}

	public void setpBD(String pBD) {
		this.pBD = pBD;
	}

	public String getpNation() {
		return pNation;
	}

	public void setpNation(String pNation) {
		this.pNation = pNation;
	}

	public String getpFile() {
		return pFile;
	}

	public void setpFile(String pFile) {
		this.pFile = pFile;
	}

	@Override
	public String toString() {
		return "Person [pNo=" + pNo + ", pName=" + pName + ", pJob=" + pJob + ", pBD=" + pBD + ", pNation=" + pNation
				+ ", pFile=" + pFile + "]";
	}
	
}
