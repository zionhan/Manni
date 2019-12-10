package user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserModifyHandler {
	
	@Resource
	private UserDao userDao;
	
	@RequestMapping( "/userModifyForm.do" )	
	public ModelAndView userModifyForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return new ModelAndView( "user/userModifyForm" );
	}
	
	@RequestMapping( "/userModifyPro.do" )	
	public ModelAndView userModifyPro(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ManUserBasic userDto = new ManUserBasic();
	
		// id
		userDto.setId( (String) request.getSession().getAttribute( "memId" ) );
	
		// passwd
		userDto.setPasswd(request.getParameter("passwd"));
	
		int result = userDao.updateUser( userDto );
		
		request.setAttribute( "result", result );
		
		return new ModelAndView( "user/userModifyPro" );
	}
	
	@RequestMapping( "/userModifyView.do" )	
	public ModelAndView userModifyView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = (String) request.getSession().getAttribute( "memId" );
		String passwd = request.getParameter( "passwd" );
	
		int result = userDao.check( id, passwd );
		
		request.setAttribute( "result", result );
		if( result == 1 ) {
			ManUserBasic userDto = userDao.getUser( id );
			request.setAttribute( "userDto", userDto );
		}
		
		return new ModelAndView( "user/userModifyView" );
	}
}
