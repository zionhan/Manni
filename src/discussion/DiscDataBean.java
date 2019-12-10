package discussion;

import java.sql.Timestamp;

public class DiscDataBean {
	
	private int dNum;
	private String nickName;
	private String dTitle;
	private String dContent;
	private String dField;
	private Timestamp dWriteDate;
	private int dCntReply;
	private int dCntVote;
	
	public int getdNum() {
		return dNum;
	}
	public String getNickName() {
		return nickName;
	}
	public String getdTitle() {
		return dTitle;
	}
	public String getdContent() {
		return dContent;
	}
	public String getdField() {
		return dField;
	}
	public Timestamp getdWriteDate() {
		return dWriteDate;
	}
	public int getdCntReply() {
		return dCntReply;
	}
	public int getdCntVote() {
		return dCntVote;
	}
	public void setdNum(int dNum) {
		this.dNum = dNum;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setdTitle(String dTitle) {
		this.dTitle = dTitle;
	}
	public void setdContent(String dContent) {
		this.dContent = dContent;
	}
	public void setdField(String dField) {
		this.dField = dField;
	}
	public void setdWriteDate(Timestamp dWriteDate) {
		this.dWriteDate = dWriteDate;
	}
	public void setdCntReply(int dCntReply) {
		this.dCntReply = dCntReply;
	}
	public void setdCntVote(int dCntVote) {
		this.dCntVote = dCntVote;
	}
	
	
	
	
	

}