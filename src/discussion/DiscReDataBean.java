package discussion;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class DiscReDataBean implements Serializable {

	private int dNum;
	private int dReNum;
	private int dReParent;
	private int dReGroup;
	private int dReSeq;
	private int dReDepth;
	private int dReBlind;
	private String nickName;
	private String dReply;
	private Timestamp dReWriteDate;
	private int rCntVote;
	
	public int getdNum() {
		return dNum;
	}
	public int getdReNum() {
		return dReNum;
	}
	public int getdReParent() {
		return dReParent;
	}
	public int getdReGroup() {
		return dReGroup;
	}
	public int getdReSeq() {
		return dReSeq;
	}
	public int getdReDepth() {
		return dReDepth;
	}
	public int getdReBlind() {
		return dReBlind;
	}
	public String getNickName() {
		return nickName;
	}
	public String getdReply() {
		return dReply;
	}
	public Timestamp getdReWriteDate() {
		return dReWriteDate;
	}
	public int getrCntVote() {
		return rCntVote;
	}
	public void setdNum(int dNum) {
		this.dNum = dNum;
	}
	public void setdReNum(int dReNum) {
		this.dReNum = dReNum;
	}
	public void setdReParent(int dReParent) {
		this.dReParent = dReParent;
	}
	public void setdReGroup(int dReGroup) {
		this.dReGroup = dReGroup;
	}
	public void setdReSeq(int dReSeq) {
		this.dReSeq = dReSeq;
	}
	public void setdReDepth(int dReDepth) {
		this.dReDepth = dReDepth;
	}
	public void setdReBlind(int dReBlind) {
		this.dReBlind = dReBlind;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setdReply(String dReply) {
		this.dReply = dReply;
	}
	public void setdReWriteDate(Timestamp dReWriteDate) {
		this.dReWriteDate = dReWriteDate;
	}
	public void setrCntVote(int rCntVote) {
		this.rCntVote = rCntVote;
	}
	
	
	
	
	
	
	
	
	
}
