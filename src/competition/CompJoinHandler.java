package competition;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import user.UserDao;

@Controller
@EnableWebMvc
public class CompJoinHandler {
	@Resource
	private CompDao compDao;
	
	@Resource
	private UserDao userDao;
	
	
	@ResponseBody
	@RequestMapping( value="/compJoinPro.do", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public Map<String, String> compJoinPro( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		request.setCharacterEncoding("utf-8");
		String msg = "";
		
		String passwd = request.getParameter( "passwd" );
		String id = (String) request.getSession().getAttribute( "memId" );
		String nickName = (String) request.getSession().getAttribute( "nickName" );
		int cNum = Integer.parseInt( request.getParameter( "cNum" ) );		
				
		int result = userDao.check(id, passwd);	
		
		if( result == -1 ) {
			msg = "비밀번호가 다릅니다.";
		} else if ( result != -1 ) {			
			CompParDataBean compParDto = new CompParDataBean();			
			compParDto.setNickName( nickName );
			compParDto.setcNum( cNum );
			compDao.insertCompPar( compParDto );
			msg = "컴퍼티션에 참가에 성공하였습니다.";
		}		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put( "result", Integer.toString( result ) );
		map.put( "msg", msg );
		
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping( value="/compLeavePro.do", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public Map<String, String> compLeavePro( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		request.setCharacterEncoding("utf-8");
		String msg = "";
		
		String passwd = request.getParameter( "passwd" );
		String id = (String) request.getSession().getAttribute( "memId" );
		String nickName = (String) request.getSession().getAttribute( "nickName" );
		int cNum = Integer.parseInt( request.getParameter( "cNum" ) );	
		int cReNum = compDao.getCReNum( cNum, nickName );
				
		int result = userDao.check(id, passwd);	
		
		if( result == -1 ) {
			msg = "비밀번호가 다릅니다.";
		} else if ( result != -1 ) {			
			CompParDataBean compParDto = new CompParDataBean();			
			compParDto.setNickName( nickName );
			compParDto.setcNum( cNum );
			compDao.deleteCompPar( cReNum );
			msg = "컴퍼티션에 탈퇴에 성공하였습니다.";
		}		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put( "result", Integer.toString( result ) );
		map.put( "msg", msg );
		
		return map;
	}
	

	
	@ResponseBody
	@RequestMapping( value="/compRePro.do", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public Map<String, String> compRePro( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		request.setCharacterEncoding("utf-8");
		String msg = "";
		Map<String, String> map = new HashMap<String, String>();
		
		CompParDataBean compParDto = new CompParDataBean();	
		
		compParDto.setcReNum( Integer.parseInt( request.getParameter( "cReNum" ) ) );		
		compParDto.setEditUrl( request.getParameter( "editUrl" ) );
		compParDto.setcComment( request.getParameter( "cComment" ) );
		compParDto.setEditTool( request.getParameter( "editTool" ) );
		compParDto.setEditPlugin( request.getParameter( "editPlugin" ) );
		
		int result = compDao.updateCompRe( compParDto );		
		if( result == 0 ) {
			msg = "업로드에 실패했습니다.";			
		} else {
			msg = "업로드에 성공했습니다.";
		}		
		map.put( "msg", msg );
		
		return map;
	}	
	
	
	
	
	
	
	
	@RequestMapping( "/compReModify.do" )
	public ModelAndView compReModify( HttpServletRequest request, HttpServletResponse response ) {
		request.setAttribute( "cReNum", request.getParameter( "cReNum" ) );		
		request.setAttribute( "cNum", request.getParameter( "cNum" ) );		
		return new ModelAndView( "competition/compReModify" );
	}
	
	@RequestMapping( "/compReModifyForm.do" )
	public ModelAndView compReModifyForm( HttpServletRequest request, HttpServletResponse response ) {
		String memId = (String) request.getSession().getAttribute( "memId" );
		String passwd = request.getParameter( "passwd" );		
		int cReNum = Integer.parseInt( request.getParameter( "cReNum" ) );
		
		CompParDataBean compParDto = compDao.getCompPar( cReNum );
		
		int result = userDao.check( memId, passwd );
		
		
		request.setAttribute( "compParDto", compParDto );
		request.setAttribute( "cReNum", request.getParameter( "cReNum" ) );		
		request.setAttribute( "cNum", request.getParameter( "cNum" ) );
		request.setAttribute( "result", result );
		
		return new ModelAndView( "competition/compReModifyForm" );
	}
}
