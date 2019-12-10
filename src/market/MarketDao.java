package market;

import java.util.List;

public interface MarketDao {
	public List<MarketDataBean> getMarketList();
	public List<ReviewDataBean> getReviewList( int mNum );
	
	public List<BuyerDataBean> getBuyerList( String nickName );
	
	public MarketDataBean getMarketDto( int mNum );
	
	
	public int insertMarket( MarketDataBean marketDto );
	public int insertReview( ReviewDataBean reviewDto );
	
	public int insertBuyer( BuyerDataBean buyerDto);
	
	
	public int updateMCode( int mBNum );

}
