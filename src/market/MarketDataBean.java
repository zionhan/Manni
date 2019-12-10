package market;

import java.sql.Timestamp;

public class MarketDataBean {
    // 마켓 고유 번호 
	private Integer mNum;

    // 올린사람 닉네임 
    private String nickName;

    // 서비스 제목 
    private String mTitle;

    // 서비스 가격 
    private int mGuarantee;

    // 서비스 상세내용 
    private String mContent;

    // 글 올린날짜 
    private Timestamp mDate;

	public Integer getmNum() {
		return mNum;
	}

	public void setmNum(Integer mNum) {
		this.mNum = mNum;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

	public int getmGuarantee() {
		return mGuarantee;
	}

	public void setmGuarantee(int mGuarantee) {
		this.mGuarantee = mGuarantee;
	}

	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	public Timestamp getmDate() {
		return mDate;
	}

	public void setmDate(Timestamp mDate) {
		this.mDate = mDate;
	}
}
