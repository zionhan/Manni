package project;

public class ProjEvalDataBean {	
    // 평가 고유번호 
    private int pENum;

    // 닉네임 
    private String nickName;

    // 평점 
    private int eScore;

    // 한줄평 
    private String eComment;

    // 프로젝트 고유번호 
    private int pNum;

	public int getpENum() {
		return pENum;
	}

	public void setpENum(int pENum) {
		this.pENum = pENum;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int geteScore() {
		return eScore;
	}

	public void seteScore(int eScore) {
		this.eScore = eScore;
	}

	public String geteComment() {
		return eComment;
	}

	public void seteComment(String eComment) {
		this.eComment = eComment;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
    

}
