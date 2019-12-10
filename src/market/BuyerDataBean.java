package market;

import java.sql.Timestamp;

public class BuyerDataBean {
	// 마켓 참여 고유 번호 
    private int mBNum;
    // 마켓 참여자 닉네임 
    private String buyer;
    // 마켓 판매자 닉네임 
    private String seller;
    // 마켓 진행상태  0진행, 1완료
    private int mCode;
    // 마켓 구매 날짜 
    private Timestamp mBuyDate;
    // 마켓 고유 번호 
    private Integer mNum;
	public int getmBNum() {
		return mBNum;
	}
	public void setmBNum(int mBNum) {
		this.mBNum = mBNum;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public int getmCode() {
		return mCode;
	}
	public void setmCode(int mCode) {
		this.mCode = mCode;
	}
	public Timestamp getmBuyDate() {
		return mBuyDate;
	}
	public void setmBuyDate(Timestamp mBuyDate) {
		this.mBuyDate = mBuyDate;
	}
	public Integer getmNum() {
		return mNum;
	}
	public void setmNum(Integer mNum) {
		this.mNum = mNum;
	}
    
}