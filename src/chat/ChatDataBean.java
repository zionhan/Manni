package chat;

import java.sql.Timestamp;

public class ChatDataBean {

	private int chNum;
	private int chCauseNum;
	private String sender;
	private String msg;
	private Timestamp chDate;
	private String chDateStr;
	
	public int getChNum() {
		return chNum;
	}
	public int getChCauseNum() {
		return chCauseNum;
	}
	public String getSender() {
		return sender;
	}
	public String getMsg() {
		return msg;
	}
	public Timestamp getChDate() {
		return chDate;
	}
	public String getChDateStr() {
		return chDateStr;
	}
	public void setChNum(int chNum) {
		this.chNum = chNum;
	}
	public void setChCauseNum(int chCauseNum) {
		this.chCauseNum = chCauseNum;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public void setChDate(Timestamp chDate) {
		this.chDate = chDate;
	}
	public void setChDateStr(String chDateStr) {
		this.chDateStr = chDateStr;
	}
	
	
	
}
