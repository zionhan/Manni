package rank;

import java.util.List;
import vote.VoteDataBean;


public interface RankDao {
	public int checkManVote();
	public List<VoteDataBean> getStreamerArticles();
	public List<VoteDataBean> getEditorArticles();

}
