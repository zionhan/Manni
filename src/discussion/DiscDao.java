package discussion;

import java.util.List;
import java.util.Map;

public interface DiscDao {
	public List<DiscDataBean> getArticles( Map<String, Object> map ); // 게시물 목록 갖고오기
	public List<DiscDataBean> searchArticles( Map<String, Object> map ); // 게시물 목록 갖고오기
	public DiscDataBean getArticle( int dNum ); // 게시물 1개 갖고오기

	
	public int insertArticle( DiscDataBean discDto ); // 게시물 등록
	public int updateArticle( DiscDataBean discDto ); // 게시물 수정
	public int deleteArticle( int dNum ); // 게시물 삭제
	
	//작성글 바로가기인데 수정요망
	public int getMaxNum();
	
	public Integer getNewReGroup(int dNum);
	public Integer getParentReGroup(int dReParent);
	public Integer getParentReSeq(int dReParent); 
	public Integer getParentReDepth(int dReParent);
	public Integer getMaxSeq(Map<String, Integer> map); //dNum, dReGroup, myDepth, dReParent
	public void pushReSeq(Map<String, Integer> map); // dNum, dReGroup, targetSeq:기준시퀀스
//	public void pullReSeq(Map<String, Integer> map); 아직필요없음
	public List<Integer> getRepliesByBoard(int dNum);
	
	public int insertReply(DiscReDataBean discReDto);
	public List<DiscReDataBean> getReplies(int dNum);
	public int getReCount(int dNum);
	
	public int deleteReply(int dReNum);
	public Integer getReChildren(int dReNum);
	public Integer getReParent(int dReNum);
	public Integer getBlind(int dReNum);
	
	
	
	
//	public int updatedLike(Map<String, Integer> map);
//	public int getdLike(int dNum);
	
}
