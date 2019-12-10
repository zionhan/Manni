package vote;

import java.util.Map;

public interface VoteDao {
	public Integer getVoteCount(int vCauseNum);
	public Integer setVoteCount(Map<String, Object> map); // nickName, vCauseNum, vote
	public Integer getVoteLog(Map<String, Object> map); // nickName, vCauseNum
	public Integer deleteVoteOne(Map<String, Object> map); // nickName, vCauseNum
	public Integer deleteVoteAll(int vCauseNum);
}
