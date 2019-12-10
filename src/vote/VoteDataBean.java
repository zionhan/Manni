package vote;

public class VoteDataBean {
	private int vNum;
	private int vCauseNum;
	private int vote;
	private String nickName;
	
	public int getvNum() {
		return vNum;
	}
	public int getvCauseNum() {
		return vCauseNum;
	}
	public int getVote() {
		return vote;
	}
	public String getNickName() {
		return nickName;
	}
	public void setvNum(int vNum) {
		this.vNum = vNum;
	}
	public void setvCauseNum(int vCauseNum) {
		this.vCauseNum = vCauseNum;
	}
	public void setVote(int vote) {
		this.vote = vote;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
		
	
//	CREATE TABLE man_vote
//	(
//	    vNum         NUMBER(18, 0)    NOT NULL, 
//	    vCauseNum    NUMBER(18, 0)    NOT NULL, 
//	    vote         NUMBER(1, 0)     NOT NULL, 
//	    nickName     VARCHAR2(20)     NOT NULL,
//	CONSTRAINT MAN_LIKE_PK PRIMARY KEY (vNum)
//	)
	
}
