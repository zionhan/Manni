package user;

import java.sql.Timestamp;

public class ManUserBasic {
	
	private int uNum; // 유저 고유번호
    private String id;// 아이디(이메일)
    private String passwd;// 비밀번호 
    private String nickName; // 닉네임 
    private Timestamp joinDate; // 가입날짜 
    private int userGrade;    // 회원등급
    private int publicScore;    // 누적점수 
    private int penaltyScore;    // 패널티점수 
    private Timestamp upgradeDate;    // 등업날짜 
    private Timestamp paidEndDate;    // 유료만료 날짜 
    
	public int getuNum() {
		return uNum;
	}
	public String getId() {
		return id;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getNickName() {
		return nickName;
	}
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public int getUserGrade() {
		return userGrade;
	}
	public int getPublicScore() {
		return publicScore;
	}
	public int getPenaltyScore() {
		return penaltyScore;
	}
	public Timestamp getUpgradeDate() {
		return upgradeDate;
	}
	public Timestamp getPaidEndDate() {
		return paidEndDate;
	}
	
	public void setuNum(int uNum) {
		this.uNum = uNum;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}
	public void setPublicScore(int publicScore) {
		this.publicScore = publicScore;
	}
	public void setPenaltyScore(int penaltyScore) {
		this.penaltyScore = penaltyScore;
	}
	public void setUpgradeDate(Timestamp upgradeDate) {
		this.upgradeDate = upgradeDate;
	}
	public void setPaidEndDate(Timestamp paidEndDate) {
		this.paidEndDate = paidEndDate;
	}
    
}
