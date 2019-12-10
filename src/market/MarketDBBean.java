package market;

import java.util.List;

import configuration.SqlMapClient;

public class MarketDBBean implements MarketDao {	
	
	
	@Override
	public List<MarketDataBean> getMarketList() {
		return SqlMapClient.getSession().selectList( "Market.getMarketList" );
	}
	
	@Override
	public List<ReviewDataBean> getReviewList(int mNum) {		
		return SqlMapClient.getSession().selectList( "Market.getReviewList", mNum );
	}
		
	
	@Override
  	 public List<BuyerDataBean> getBuyerList(String nickName) {
      return SqlMapClient.getSession().selectList( "Market.getBuyerList", nickName );
   }
   	@Override
	public MarketDataBean getMarketDto(int mNum) {		
		return SqlMapClient.getSession().selectOne( "Market.getMarketDto", mNum );
	}
	
	@Override
	public int insertMarket(MarketDataBean marketDto) {		
		return SqlMapClient.getSession().update( "Market.insertMarket", marketDto );
	}
	
	@Override
	public int insertReview(ReviewDataBean reviewDto) {		
		return SqlMapClient.getSession().update( "Market.insertReview", reviewDto );
	}
	
	@Override
	public int insertBuyer(BuyerDataBean buyerDto) {		
		return SqlMapClient.getSession().update( "Market.insertBuyer", buyerDto );
	}
	
	@Override
	public int updateMCode(int mBNum) {
		return SqlMapClient.getSession().update( "Market.updateMCode", mBNum );
	}

}
