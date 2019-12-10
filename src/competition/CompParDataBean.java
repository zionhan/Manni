package competition;

import java.sql.Timestamp;

public class CompParDataBean {
	// 컴퍼티션 참여자 고유번호 
    private int cReNum;

    // 닉네임 
    private String nickName;

    // 컴퍼티션 참여 날짜 
    private Timestamp cJoinDate;

    // 컴퍼티션 댓글 게시 날짜 
    private Timestamp cReDate;

    // 편집영상 사이트 링크 
    private String editUrl;

    // 컴퍼티션 댓글 내용 
    private String cComment;

    // 컴퍼티션 댓글 좋아요 갯수 
    private int cReLike;

    // 편집 사용툴 
    private String editTool;

    // 편집 사용 플러그인 
    private String editPlugin;

    // 컴퍼티션 고유번호 
    private int cNum;
    
    private String edNickName;
    

	public int getcReNum() {
		return cReNum;
	}

	public void setcReNum(int cReNum) {
		this.cReNum = cReNum;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Timestamp getcJoinDate() {
		return cJoinDate;
	}

	public void setcJoinDate(Timestamp cJoinDate) {
		this.cJoinDate = cJoinDate;
	}

	public Timestamp getcReDate() {
		return cReDate;
	}

	public void setcReDate(Timestamp cReDate) {
		this.cReDate = cReDate;
	}

	public String getEditUrl() {
		return editUrl;
	}

	public void setEditUrl(String editUrl) {
		this.editUrl = editUrl;
	}

	public String getcComment() {
		return cComment;
	}

	public void setcComment(String cComment) {
		this.cComment = cComment;
	}

	public int getcReLike() {
		return cReLike;
	}

	public void setcReLike(int cReLike) {
		this.cReLike = cReLike;
	}

	public String getEditTool() {
		return editTool;
	}

	public void setEditTool(String editTool) {
		this.editTool = editTool;
	}

	public String getEditPlugin() {
		return editPlugin;
	}

	public void setEditPlugin(String editPlugin) {
		this.editPlugin = editPlugin;
	}

	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public String getEdNickName() {
		return edNickName;
	}

	public void setEdNickName(String edNickName) {
		this.edNickName = edNickName;
	} 
	
	

}
