package alarm;

public class Packet {
	private String nickName; // 보낸놈
	private String receiver; // 받는놈
	private String aMsg;
	private Integer aCauseNum;
	
	public String getNickName() {
		return nickName;
	}
	public String getReceiver() {
		return receiver;
	}
	public String getaMsg() {
		return aMsg;
	}
	public Integer getaCauseNum() {
		return aCauseNum;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public void setaMsg(String aMsg) {
		this.aMsg = aMsg;
	}
	public void setaCauseNum(Integer aCauseNum) {
		this.aCauseNum = aCauseNum;
	}
	
	
	
	
	

	
	
}
