package project;

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

import competition.CompParDataBean;
import file.FileDao;
import user.UserDao;


@Controller
public class ProjMainHandler {
	@Resource
	private ProjDao projDao;	
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private FileDao fileDao;
	
	
	
	
	@RequestMapping( "/projContent.do" )
	public ModelAndView projContent( HttpServletRequest request, HttpServletResponse response ) {
		int pNum = Integer.parseInt( request.getParameter( "pNum" ) );
		ProjDataBean projDto = projDao.getProjDto( pNum );		
		request.setAttribute( "projDto", projDto );	
		request.setAttribute("pNum", pNum);
		
		//file 테이블에서 조회 후 name 반환!
		String video_name = fileDao.getFileName(pNum);
		request.setAttribute("video_name", video_name);
		
		return new ModelAndView( "project/projContent" );
	}
	
	@RequestMapping( "/projUpdatePCode.do" )
	public ModelAndView updatePCode( HttpServletRequest request, HttpServletResponse response ) {
		int pNum = Integer.parseInt( request.getParameter( "pNum" ) );
		int pCode = Integer.parseInt( request.getParameter( "pCode" ) );
		
		ProjDataBean projDto = new ProjDataBean();
		projDto.setpNum( pNum ); 
		projDto.setpCode( pCode );
				
		int result = projDao.updatePCode( projDto );
		
		request.setAttribute( "result", result );		
		return new ModelAndView( "project/projUpdatePCode" );		
	}	
	
	
	@RequestMapping( "/projDelete.do" )
	public ModelAndView deleteProj( HttpServletRequest request, HttpServletResponse response ) {
		int result = projDao.deleteProj( Integer.parseInt( request.getParameter( "pNum" ) ) );
		request.setAttribute( "result", result );
		return new ModelAndView( "project/projDelete" );		
	}
	
	
	
	@ResponseBody
	@RequestMapping( value="/projJoinPro.do", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public Map<String, String> compJoinPro( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		request.setCharacterEncoding("utf-8");
		String msg = "";
		
		String passwd = request.getParameter( "passwd" );
		String id = (String) request.getSession().getAttribute( "memId" );		
		
		int pCode = 1;
		int pNum = Integer.parseInt( request.getParameter( "pNum" ) );		
				
		int result = userDao.check(id, passwd);	
		
		if( result == -1 ) {
			msg = "비밀번호가 다릅니다.";
		} else if ( result != -1 ) {			
			ProjDataBean projDto = new ProjDataBean();			
			projDto.setpNum( pNum );
			projDto.setpCode( pCode );
			projDao.updatePCode(projDto);
			msg = "프로젝트 승인에 성공하였습니다.";
		}		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put( "result", Integer.toString( result ) );
		map.put( "msg", msg );
		
		return map;
	}
	
	
//	@ResponseBody
//	@RequestMapping( value="/compLeavePro.do", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
//	public Map<String, String> compLeavePro( HttpServletRequest request, HttpServletResponse response ) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		String msg = "";
//		
//		String passwd = request.getParameter( "passwd" );
//		String id = (String) request.getSession().getAttribute( "memId" );
//		String nickName = (String) request.getSession().getAttribute( "nickName" );
//		int cNum = Integer.parseInt( request.getParameter( "cNum" ) );	
//		int cReNum = compDao.getCReNum( cNum, nickName );
//				
//		int result = userDao.check(id, passwd);	
//		
//		if( result == -1 ) {
//			msg = "비밀번호가 다릅니다.";
//		} else if ( result != -1 ) {			
//			CompParDataBean compParDto = new CompParDataBean();			
//			compParDto.setNickName( nickName );
//			compParDto.setcNum( cNum );
//			compDao.deleteCompPar( cReNum );
//			msg = "컴퍼티션에 탈퇴에 성공하였습니다.";
//		}		
//		
//		Map<String, String> map = new HashMap<String, String>();
//		map.put( "result", Integer.toString( result ) );
//		map.put( "msg", msg );
//		
//		return map;
//	}
	

	
	@ResponseBody
	@RequestMapping( value="/projRePro.do", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public Map<String, String> compRePro( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		request.setCharacterEncoding("utf-8");
		String msg = "";
		Map<String, String> map = new HashMap<String, String>();
		
		ProjDataBean projDto = new ProjDataBean();	
		
		projDto.setpNum( Integer.parseInt( request.getParameter( "pNum" ) ) );		
		projDto.setEditUrl( request.getParameter( "editUrl" ) );		
		
		int result = projDao.updateProjRe( projDto );		
		if( result == 0 ) {
			msg = "업로드에 실패했습니다.";			
		} else {
			msg = "업로드에 성공했습니다.";
		}		
		map.put( "msg", msg );
		
		return map;
	}	
	

	
	
	@ResponseBody
	@RequestMapping( value="/projChoicePro.do", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public Map<String, String> projChoicePro( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		request.setCharacterEncoding( "utf-8" );
		
		String msg = "";
		Map<String, String> map = new HashMap<String, String>();
		String memId = (String) request.getSession().getAttribute( "memId" );
		String passwd = request.getParameter( "passwd" );
		String edNickName = request.getParameter( "edNickName" );
		
		
		int pNum = Integer.parseInt ( request.getParameter( "pNum" ) ); 
		
		int result = userDao.check( memId, passwd );
		
		if( result == -1 ) {
			msg = "입력하신 비밀번호가 다릅니다.";
		}
		
		if( result != -1 ) {
			ProjDataBean projDto = new ProjDataBean();
			projDto.setpNum( pNum );
			projDto.setpCode( 2 );			
			projDao.updatePCode( projDto );
			msg = edNickName + "을 채택했습니다.";
		}				
		map.put( "msg", msg );
		map.put( "result", Integer.toString( result ) );		
		
		return map;
	}

}
