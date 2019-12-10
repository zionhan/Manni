package discussion;

import java.util.List;
import java.util.Map;
import configuration.SqlMapClient;

public class DiscDBBean implements DiscDao {

	@Override
	public List<DiscDataBean> getArticles(Map<String, Object> map) {
		int sort = (int) map.get("sort");
		List<DiscDataBean> articles = null;
		if (sort == 1) {
			articles = SqlMapClient.getSession().selectList("Disc.getArticlesByVote", map);
		}
		else if (sort == 2) {
			articles = SqlMapClient.getSession().selectList("Disc.getArticlesByReply", map);
		}
		else if (sort == 3) {
			articles = SqlMapClient.getSession().selectList("Disc.getArticlesByTime", map);
		}
		return articles;
	}
	@Override
	public List<DiscDataBean> searchArticles(Map<String, Object> map) {
		
		List<DiscDataBean> articles = null;
		int search = (int) map.get("search");
		if(search == 1) {//글제목
//			map.put("search", "dTitle");
			articles = SqlMapClient.getSession().selectList("Disc.searchArticlesByBoardTitle", map);
		}
		else if(search == 2) {//글내용
//			map.put("search", "dContent");
			articles = SqlMapClient.getSession().selectList("Disc.searchArticlesByBoardContent", map);
		}
		else if(search == 3) {//글작성자
//			map.put("search", "nickName");
			articles = SqlMapClient.getSession().selectList("Disc.searchArticlesByBoardWriter", map);
		}
		else if(search == 4) {//댓글내용
//			map.put("search", "dReply");
			articles = SqlMapClient.getSession().selectList("Disc.searchArticlesByReplyContent", map);
		}
		else if(search == 5) {//댓글작성자
//			map.put("search", "nickName");
			articles = SqlMapClient.getSession().selectList("Disc.searchArticlesByReplyWriter", map);
		}
		return articles;
	}

	@Override
	public DiscDataBean getArticle(int dNum) {
		return SqlMapClient.getSession().selectOne("Disc.getArticle", dNum);
	}

	@Override
	public int insertArticle(DiscDataBean discDto) {
		return SqlMapClient.getSession().insert("Disc.insertArticle", discDto);
	}

	@Override
	public int updateArticle(DiscDataBean discDto) {
		return SqlMapClient.getSession().update("Disc.updateArticle", discDto);
	}

	@Override
	public int deleteArticle(int dNum) {
		return SqlMapClient.getSession().delete("Disc.deleteArticle", dNum);
	}

	//이거수정해야함 작성글바로가기인데
	@Override
	public int getMaxNum() {
		return SqlMapClient.getSession().selectOne("Disc.getMaxNum");
	}

	@Override
	public Integer getNewReGroup(int dNum) {
		Integer reGroup = SqlMapClient.getSession().selectOne("Disc.getNewReGroup", dNum);
		if(reGroup == null) {
			//비어있는 경우
			reGroup = 0;
		}else {
			//몬가 있당
			reGroup += 1; //1만 더해주면 됨
		}
		return reGroup;
	}
	@Override
	public Integer getParentReGroup(int dReParent) {
		return SqlMapClient.getSession().selectOne("Disc.getParentReGroup", dReParent);
	}
	@Override
	public Integer getParentReSeq(int dReParent) {
		Integer reSeq = SqlMapClient.getSession().selectOne("Disc.getParentReSeq", dReParent);
		if(reSeq == null) {
			reSeq = 0;
		}	
		return reSeq;
	}
	@Override
	public Integer getParentReDepth(int dReParent) {
		Integer reDepth = SqlMapClient.getSession().selectOne("Disc.getParentReDepth", dReParent); 
		if(reDepth == null) {
			reDepth = 0;
		}
		return reDepth;
	}
	@Override
	public Integer getMaxSeq(Map<String, Integer> map) {
		Integer maxSeq = SqlMapClient.getSession().selectOne("Disc.getMaxSeq", map);
		if(maxSeq == null) {
			maxSeq = getParentReSeq(map.get("dReParent"));
		}
		return maxSeq;
	}
	@Override
	public void pushReSeq(Map<String, Integer> map) {
		SqlMapClient.getSession().selectOne("Disc.pushReSeq", map);
	}	
	
	@Override
	public List<Integer> getRepliesByBoard(int dNum) {
		return SqlMapClient.getSession().selectList("Disc.getRepliesByBoard", dNum);
	}
	

	@Override
	public int insertReply(DiscReDataBean discReDto) {
		return SqlMapClient.getSession().insert("Disc.insertReply", discReDto);
	}

	@Override
	public List<DiscReDataBean> getReplies(int dNum) {
		return SqlMapClient.getSession().selectList("Disc.getReplies", dNum);
	}

	@Override
	public int getReCount(int dNum) {
		return SqlMapClient.getSession().selectOne("Disc.getReCount", dNum);
	}
	
	@Override
	public int deleteReply(int dReNum) {
		int result = 0;
		int children = getReChildren(dReNum);
		int dReParent = getReParent(dReNum);
		int sibling = getReChildren(dReNum);
		int parentBlind = getBlind(dReParent);
		
		if(children != 0) {
			//자식 있음 -> 블라인드
			result = SqlMapClient.getSession().update("Disc.setBlind", dReNum);
		}else {
			//자식 없음 -> 삭제
			result = SqlMapClient.getSession().delete("Disc.deleteReply", dReNum);
			
			//부모 있음 && 부모 블라인드 && 다른 형제 없음
			if(dReParent != -1 && parentBlind == 1 && sibling == 0) {//-1 이어야 재귀가 root를 탐색하고 삭제함
				deleteReply(dReParent); // 재귀함수 아이디어 ★
			}
		}
		return result;
	}
	@Override
	public Integer getReChildren(int dReNum) {
		Integer children = SqlMapClient.getSession().selectOne("Disc.getReChildren", dReNum);
		if(children == null) {
			children = 0;
		}
		return children;
	}
	@Override
	public Integer getReParent(int dReNum) {
		Integer dReParent = SqlMapClient.getSession().selectOne("Disc.getReParent", dReNum);
		if(dReParent == null) {
			dReParent = 0;
		}
		return dReParent;
	}
	@Override
	public Integer getBlind(int dReNum) {
		Integer blind = SqlMapClient.getSession().selectOne("Disc.getBlind", dReNum);
		if(blind == null) {
			blind = 0;
		}
		return blind;
	}
	
	


	




}
