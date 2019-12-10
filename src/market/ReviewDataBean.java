package market;

import java.sql.Timestamp;

public class ReviewDataBean {
	// 평가 고유 번호 
    private int rNum;

    // 평가자 닉네임 
    private String nickName;

    // 상세내용 
    private String rComment;

    // 평가날짜 
    private Timestamp rDate;

    // 평점 
    private int rScore;

    // 평가 발생 코드 
    private int mNum;

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getrComment() {
		return rComment;
	}

	public void setrComment(String rComment) {
		this.rComment = rComment;
	}

	public Timestamp getrDate() {
		return rDate;
	}

	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}

	public int getrScore() {
		return rScore;
	}

	public void setrScore(int rScore) {
		this.rScore = rScore;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
}
