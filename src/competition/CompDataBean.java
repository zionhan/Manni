package competition;

import java.sql.Timestamp;

public class CompDataBean {
	 // 컴퍼티션 고유번호 
    private int cNum;

    // 컴퍼티션 글제목 
    private String cTitle;
    
 // 닉네임 
    private String nickName;

    // 컴퍼티션 시작날짜 
    private Timestamp cStartDate;

    // 컴퍼티션 마감날짜 
    private Timestamp cEndDate;
    
    // 컴퍼티션 채택 마감날짜
    private Timestamp cExpireDate;

    // 컴퍼티션 1차 금액 
    private int cReward;

    // 컴퍼티션 2차 금액 
    private int pReward;

    // 컴퍼티션 분야 
    private String cField;

    // 컴퍼티션 편집스타일 
    private String cEditStyle;

    // 컴퍼티션 원하는 편집시간 
    private String cEditTime;

    // 컴퍼티션 상세 요구사항 
    private String cContent;
    
    // 컴퍼티션 진행 상태      0 진행중, 1 완료 
    private int cCode;
    
    // 채택된 편집자 닉네임
    private String edNickName;
    
    // 컴퍼티션 참여자 수
    private int cParCnt;

	public int getcNum() {
		return cNum;
	}

	public String getcTitle() {
		return cTitle;
	}

	public String getNickName() {
		return nickName;
	}

	public Timestamp getcStartDate() {
		return cStartDate;
	}

	public Timestamp getcEndDate() {
		return cEndDate;
	}

	public Timestamp getcExpireDate() {
		return cExpireDate;
	}

	public int getcReward() {
		return cReward;
	}

	public int getpReward() {
		return pReward;
	}

	public String getcField() {
		return cField;
	}

	public String getcEditStyle() {
		return cEditStyle;
	}

	public String getcEditTime() {
		return cEditTime;
	}

	public String getcContent() {
		return cContent;
	}

	public int getcCode() {
		return cCode;
	}

	public String getEdNickName() {
		return edNickName;
	}

	public int getcParCnt() {
		return cParCnt;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public void setcStartDate(Timestamp cStartDate) {
		this.cStartDate = cStartDate;
	}

	public void setcEndDate(Timestamp cEndDate) {
		this.cEndDate = cEndDate;
	}

	public void setcExpireDate(Timestamp cExpireDate) {
		this.cExpireDate = cExpireDate;
	}

	public void setcReward(int cReward) {
		this.cReward = cReward;
	}

	public void setpReward(int pReward) {
		this.pReward = pReward;
	}

	public void setcField(String cField) {
		this.cField = cField;
	}

	public void setcEditStyle(String cEditStyle) {
		this.cEditStyle = cEditStyle;
	}

	public void setcEditTime(String cEditTime) {
		this.cEditTime = cEditTime;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public void setEdNickName(String edNickName) {
		this.edNickName = edNickName;
	}

	public void setcParCnt(int cParCnt) {
		this.cParCnt = cParCnt;
	}
    
    

    
}
