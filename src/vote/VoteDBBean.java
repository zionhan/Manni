package vote;

import java.util.Map;

import configuration.SqlMapClient;

public class VoteDBBean implements VoteDao {

	@Override
	public Integer getVoteCount(int vCauseNum) {
		int up = SqlMapClient.getSession().selectOne("Vote.getVoteUp", vCauseNum);
		int down = SqlMapClient.getSession().selectOne("Vote.getVoteDown", vCauseNum);
		int result = up - down;
		return result;
	}

	@Override
	public Integer setVoteCount(Map<String, Object> map) {
		int result = SqlMapClient.getSession().update("Vote.setVoteCount", map);
		
		int voteLog = getVoteLog(map);
		if(voteLog == 0) {
			deleteVoteOne(map);
			result = 0;
		}else {
			result = 1;
		}
		return result;
	}

	@Override
	public Integer getVoteLog(Map<String, Object> map) {
		Integer voteLog = SqlMapClient.getSession().selectOne("Vote.getVoteLog", map);
		if(voteLog == null) {
			voteLog = 0;
		}
		return voteLog;
	}

	@Override
	public Integer deleteVoteOne(Map<String, Object> map) {
		return SqlMapClient.getSession().delete("Vote.deleteVoteOne", map);
	}

	@Override
	public Integer deleteVoteAll(int vCauseNum) {
		return SqlMapClient.getSession().delete("Vote.deleteVoteAll", vCauseNum);
	}

}
