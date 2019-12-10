package profile;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.ManUserDetail;
import user.UserDao;

@Controller
public class ProfContentHandler {
	
	@Resource
	private ProfDao profDao;
	
	@Resource
	private UserDao userDao;	
	
	
	@RequestMapping( "/profContent.do" )
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		String edNickName = request.getParameter("edNickName");				
		int userJob;
		try {
			userJob = userDao.getUserJob( request.getParameter( "nickName" ) );
		} catch( Exception e ) {
			userJob = -1;
			e.printStackTrace();
		}
			
			
		ManUserDetail userDetailDto = profDao.getUserDetail( edNickName );
		request.setAttribute( "userDetailDto", userDetailDto );
		
		
		request.setAttribute( "userJob", userJob );
		
		return new ModelAndView( "profile/profContent" );
	}	
}
