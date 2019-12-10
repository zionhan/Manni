package project;

import java.sql.Timestamp;

public class ProjDataBean {
	 // 프로젝트 고유번호 
    private int pNum;

    // 스트리머 닉네임 
    private String stNickName;

    // 에디터 닉네임 
    private String edNickName;

    // 프로젝트 보수 
    private int pReward;

    // 프로젝트 분야 
    private String pField;

    // 프로젝트 편집 스타일 
    private String pEditStyle;

    // 프로젝트 원하는 편집시간 
    private String pEditTime;

    // 프로젝트 상세 요구사항 
    private String pContent;

    // 프로젝트 제안 날짜 
    private Timestamp pSuggestDate;

    // 프로젝트 제안 만료 
    private Timestamp pExpireDate;

    // 프로젝트 시작날짜 = 제안수락 날짜 
    private Timestamp pStartDate;

    // 프로젝트 마감날짜 
    private Timestamp pEndDate;

    // 프로젝트 진행 상태 
    private int pCode;

    // 편집영상 사이트 링크 
    private String editUrl;

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public String getStNickName() {
		return stNickName;
	}

	public void setStNickName(String stNickName) {
		this.stNickName = stNickName;
	}

	public String getEdNickName() {
		return edNickName;
	}

	public void setEdNickName(String edNickName) {
		this.edNickName = edNickName;
	}

	public int getpReward() {
		return pReward;
	}

	public void setpReward(int pReward) {
		this.pReward = pReward;
	}

	public String getpField() {
		return pField;
	}

	public void setpField(String pField) {
		this.pField = pField;
	}

	public String getpEditStyle() {
		return pEditStyle;
	}

	public void setpEditStyle(String pEditStyle) {
		this.pEditStyle = pEditStyle;
	}

	public String getpEditTime() {
		return pEditTime;
	}

	public void setpEditTime(String pEditTime) {
		this.pEditTime = pEditTime;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public Timestamp getpSuggestDate() {
		return pSuggestDate;
	}

	public void setpSuggestDate(Timestamp pSuggestDate) {
		this.pSuggestDate = pSuggestDate;
	}

	public Timestamp getpExpireDate() {
		return pExpireDate;
	}

	public void setpExpireDate(Timestamp pExpireDate) {
		this.pExpireDate = pExpireDate;
	}

	public Timestamp getpStartDate() {
		return pStartDate;
	}

	public void setpStartDate(Timestamp pStartDate) {
		this.pStartDate = pStartDate;
	}

	public Timestamp getpEndDate() {
		return pEndDate;
	}

	public void setpEndDate(Timestamp pEndDate) {
		this.pEndDate = pEndDate;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}

	public String getEditUrl() {
		return editUrl;
	}

	public void setEditUrl(String editUrl) {
		this.editUrl = editUrl;
	}
}
