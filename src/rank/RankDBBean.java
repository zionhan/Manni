package rank;

import java.util.List;

import configuration.SqlMapClient; 
import vote.VoteDataBean;

public class RankDBBean implements RankDao {
	public int checkManVote() {
		return SqlMapClient.getSession().selectOne( "Rank.checkManVote" );
	}
	public List<VoteDataBean> getStreamerArticles() {		
		return SqlMapClient.getSession().selectList( "Rank.getStreamerArticles" );
	}
	public List<VoteDataBean> getEditorArticles() {		
		return SqlMapClient.getSession().selectList( "Rank.getEditorArticles" );
	}
}
