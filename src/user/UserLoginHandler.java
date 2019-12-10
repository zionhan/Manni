package user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserLoginHandler {
	@Resource	
	private UserDao userDao;
	
	@RequestMapping( "/userLoginForm.do" )
	public ModelAndView userLoginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String page = request.getParameter( "page" );
		request.setAttribute( "page" , page );
		
		return new ModelAndView( "user/userLoginForm" );
	}
	
	@RequestMapping( "/userLoginPro.do" )
	public ModelAndView userLoginPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String page = request.getParameter( "page" );
		request.setAttribute( "page" , page );
		
		String id = request.getParameter( "id" );
		String passwd = request.getParameter( "passwd" );
		String nickName = null;
		int result = userDao.check(id, passwd );
		nickName = userDao.getUserNickName(id);
		
		if( result != 0 ) {
			ManUserBasic userDto = userDao.getUser(id);
			request.setAttribute( "nickName", nickName);
			request.setAttribute( "id", userDto.getId() );
			request.setAttribute( "userGrade", userDto.getUserGrade() );
		}
		request.setAttribute( "result", result );
		return new ModelAndView( "user/userLoginPro" );
	}
	
	
	@RequestMapping( "/userLogout.do" )	
	public ModelAndView userLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().removeAttribute( "memId" );		
		request.getSession().removeAttribute( "nickName" );		
		request.getSession().removeAttribute( "userGrade" );	
		response.sendRedirect("/Manni/userMain.do");
//		System.out.println("난할일ㅇ했어");
		return new ModelAndView( "user/userMain" );
	}
}
