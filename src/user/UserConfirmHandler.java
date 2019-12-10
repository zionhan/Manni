package user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserConfirmHandler {
	@Resource
	private UserDao userDao;
	
	@RequestMapping( "/userConfirmId.do" )	
	public ModelAndView userConfirmId(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = request.getParameter( "id" );

		int result = userDao.checkId( id );
		
		request.setAttribute( "id", id );
		request.setAttribute( "result", result );
		
		return new ModelAndView( "user/userConfirmId" );
	}
	
	@RequestMapping( "/userConfirmNickName.do" )	
	public ModelAndView userConfirmNickName(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String nickName = request.getParameter( "nickName" );

		int result = userDao.checkNickName( nickName );
		
		request.setAttribute( "nickName", nickName );
		request.setAttribute( "result", result );
		
		return new ModelAndView( "user/userConfirmNickName" );

	}
	
	@RequestMapping( "/userConfirmNickName2.do" )	
	public ModelAndView userConfirmNickName2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding( "utf-8" );
		String nickName = request.getParameter( "nickName" );

		int result = userDao.checkNickName( nickName );
		
		request.setAttribute( "nickName", nickName );
		request.setAttribute( "result", result );
		
		return new ModelAndView( "user/userConfirmNickName2" );

	}
}
