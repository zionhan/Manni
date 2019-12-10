package user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserDeleteHandler {
	
	@RequestMapping( "/userDeleteForm.do" )	
	public ModelAndView userDeleteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
		return new ModelAndView( "user/userDeleteForm" );
	}
	
	@Resource
	private UserDao userDao;
		
	@RequestMapping( "/userDeletePro.do" )	
	public ModelAndView userDeletePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String) request.getSession().getAttribute( "memId" );
		String nickName = (String) request.getSession().getAttribute( "nickName" );
		String passwd = request.getParameter( "passwd" );
		
		int resultCheck = userDao.check( id, passwd );
		
		request.setAttribute( "resultCheck", resultCheck );
		if( resultCheck == 1 ) {
			int result = userDao.deleteUser( id );
			userDao.deleteUserDetail( nickName );
			request.setAttribute( "result", result );
		}
		
		return new ModelAndView( "user/userDeletePro" );
	}
}
