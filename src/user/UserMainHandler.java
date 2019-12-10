package user;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import market.BuyerDataBean;
import market.MarketDao;
import profile.ProfDao;
import project.ProjDao;
import project.ProjDataBean;

@Controller
public class UserMainHandler {
	@Resource
	private MarketDao marketDao;
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private ProjDao projDao;
	
	@RequestMapping( "/userMain.do" )	
	public ModelAndView userMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return new ModelAndView( "user/userMain" );
	}
	
	@RequestMapping( "/userInfo.do" )	
	public ModelAndView userInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String nickName = (String) request.getSession().getAttribute( "nickName" );	
		
		int userJob;
		List<ProjDataBean> projList;		
		
		try {
			userJob = userDao.getUserJob( nickName );
		} catch( Exception e ) {
			userJob = -1;
			e.printStackTrace();
		}
		
		if( userJob == 0 ) {
			projList = projDao.getProjListByStNickName( nickName );
		} else if ( userJob == 1 ) {
			projList = projDao.getProjListByEdNickName( nickName );
		} else {
			projList = null;
		}
		
		if( nickName != null ) {
			ManUserDetail userDetailDto = userDao.getUserDetail( nickName );
			request.setAttribute( "userDetailDto", userDetailDto );
		}
		
		List<BuyerDataBean> buyerList = marketDao.getBuyerList( nickName );		
		
		request.setAttribute( "buyerList", buyerList);		
		request.setAttribute( "userJob", userJob);
		request.setAttribute( "projList", projList );
		
		
			
		return new ModelAndView( "user/userInfo" );
	}

	
}












