package project;

import java.sql.Timestamp;

public class ProjFileDataBean {
    // 프로젝트 파일 고유 번호 
    private Double pFNum;

    // 올리사람 닉네임 
    private String nickName;

    // 영상 파일 이름 
    private String pFileName;

    // 영상 파일 경로 
    private String pFilePath;

    // 업로드 날짜 
    private Timestamp pFUploadDate;

    // 프로젝트 고유번호 
    private int pNum;

	public Double getpFNum() {
		return pFNum;
	}

	public void setpFNum(Double pFNum) {
		this.pFNum = pFNum;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getpFileName() {
		return pFileName;
	}

	public void setpFileName(String pFileName) {
		this.pFileName = pFileName;
	}

	public String getpFilePath() {
		return pFilePath;
	}

	public void setpFilePath(String pFilePath) {
		this.pFilePath = pFilePath;
	}

	public Timestamp getpFUploadDate() {
		return pFUploadDate;
	}

	public void setpFUploadDate(Timestamp pFUploadDate) {
		this.pFUploadDate = pFUploadDate;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
    
    

}
