package market;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import project.ProjDataBean;
import user.UserDao;

@Controller
@EnableWebMvc
public class MarketHandler {
	@Resource
	MarketDao marketDao;
	
	@Resource
	UserDao userDao;
	
	@RequestMapping( "/marketMain.do" )
	public ModelAndView marketMain( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		List<MarketDataBean> marketList = marketDao.getMarketList();
		request.setAttribute( "marketList", marketList );	
		
		return new ModelAndView( "market/marketMain" );
	}
	
	
	
	
	
	@RequestMapping( "/marketWriteForm.do" )
	public ModelAndView marketWriteForm( HttpServletRequest request, HttpServletResponse response ) throws Exception {
			
			
		
		return new ModelAndView( "market/marketWriteForm" );
	}
	
	
	
	
	@RequestMapping( "/marketWritePro.do" )
	public ModelAndView marketWritePro( HttpServletRequest request, HttpServletResponse respone ) throws Exception {
		int result = 0;
		
		MarketDataBean marketDto = new MarketDataBean();
     		marketDto.setNickName( (String) request.getSession().getAttribute( "nickName" ) );
		marketDto.setmGuarantee( Integer.parseInt( request.getParameter( "mGuarantee" ) ) );
		marketDto.setmContent( request.getParameter( "mContent" ) );
		marketDto.setmTitle( request.getParameter( "mTitle" ) );
				
		result = marketDao.insertMarket( marketDto );
		
		request.setAttribute( "result", result );		
		
		return new ModelAndView( "market/marketWritePro" );
	}	
	
	
	
	
	@RequestMapping( "/marketContent.do" )
	public ModelAndView marketContent( HttpServletRequest request, HttpServletResponse respone ) throws Exception {
		int mNum = Integer.parseInt( request.getParameter( "mNum" ) );
		
				
		List<ReviewDataBean> reviewList = marketDao.getReviewList( mNum );
		MarketDataBean marketDto = marketDao.getMarketDto( mNum );		
		
		
		request.setAttribute( "reviewList", reviewList );
		request.setAttribute( "marketDto", marketDto );
		
		
		return new ModelAndView( "market/marketContent" );
	}
	
	
	@RequestMapping(value="/marketReviewPro.do", method={RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	@ResponseBody
	public List<ReviewDataBean> marketReviewPro(HttpServletRequest request) throws Exception {

		int mNum = Integer.parseInt(request.getParameter("mNum"));
		String nickName = (String) request.getSession().getAttribute("nickName");
		
		ReviewDataBean reviewDto = new ReviewDataBean();
		reviewDto.setNickName( nickName );
		reviewDto.setmNum( mNum );
		reviewDto.setrComment( request.getParameter( "rComment" ) );
		reviewDto.setrScore( Integer.parseInt( request.getParameter( "rScore" ) ) );
		
		marketDao.insertReview( reviewDto );		
	
		
		return marketDao.getReviewList( mNum );
	}
	
	@RequestMapping( "/marketPayment.do" )
	public ModelAndView marketPayment( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		int mNum = Integer.parseInt( request.getParameter( "mNum" ) );
		
		MarketDataBean marketDto = marketDao.getMarketDto( mNum );		
		
		request.setAttribute( "marketDto", marketDto );	
		
		return new ModelAndView( "market/marketPayment" );
	}
	
	
	@RequestMapping( "/marketBuyer.do" )
	public ModelAndView marketBuyer( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		int mNum = Integer.parseInt( request.getParameter( "mNum" ) );
		String seller = request.getParameter( "seller" );
		String nickName = (String) request.getSession().getAttribute( "nickName" );
		
		BuyerDataBean buyerDto = new BuyerDataBean();
		buyerDto.setBuyer( nickName );
		buyerDto.setSeller( seller );
		buyerDto.setmNum(mNum);
		
		marketDao.insertBuyer( buyerDto );
		
		return new ModelAndView( "market/buyerPro" );
	}
	
	@RequestMapping( "/updateMCode.do" )
	public ModelAndView updateMCODE( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		int mBNum = Integer.parseInt( request.getParameter( "mBNum" ) );		
		
		
		
		int result = marketDao.updateMCode( mBNum );
		
		return new ModelAndView( "market/updateMCode" );
	}	
}
