package competition;

import java.util.HashMap;
import java.util.List;
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

import file.FileDao;
import user.UserDao;


@Controller
@EnableWebMvc
public class CompContentHandler {
	@Resource
	private CompDao compDao;
	
	@Resource	
	private UserDao userDao;
	
	@Resource
	private FileDao fileDao;
	
	@RequestMapping( "/compContent.do" )
	public ModelAndView process( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		request.setCharacterEncoding("utf-8");		
		
		int userJob = -1;
		int isCReDate = -1;
		int cReNum = 0;
		int cNum = Integer.parseInt( request.getParameter( "cNum" ) );
		String nickName = (String) request.getSession().getAttribute( "nickName" );
		List<CompParDataBean> compParList = compDao.getCompParList( cNum );
		
		if( !(nickName == null || nickName.equals("") ) ) {
			cReNum = compDao.getCReNum( cNum, nickName );						
		
			try {
				userJob = userDao.getUserJob( nickName );				
				isCReDate = compDao.isCReDate( cReNum );				
			} catch( Exception e ) {
				userJob = -1;
				isCReDate = -1;
				e.printStackTrace();		
			}		
		}
		
		
		CompDataBean compDto = compDao.getComp( cNum );		
		List<CompParDataBean> compReList = compDao.getCompReList(cNum);	
		request.setAttribute( "cReNum", cReNum );
		request.setAttribute( "compParList", compParList );
		request.setAttribute( "compDto", compDto );
		request.setAttribute( "userJob", userJob );
		request.setAttribute( "isCReDate", isCReDate );
		request.setAttribute( "cNum", cNum );		
		request.setAttribute( "compReList", compReList );	
		
		
		//file 테이블에서 조회 후 name 반환!
		String video_name = fileDao.getFileName(cNum);
		request.setAttribute("video_name", video_name);
		request.setAttribute("cNum", cNum);
		request.setAttribute("compWriter", compDto.getNickName());
		
		
		
		return new ModelAndView( "competition/compContent" );
	}


//	@RequestMapping( "/compParList.do" )
//	public ModelAndView participant( HttpServletRequest request, HttpServletResponse response ) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		
//		int cNum = Integer.parseInt( request.getParameter( "cNum" ) );
//		int cnt = compDao.getCompParCount( cNum );		
//		
//		
//		
//		request.setAttribute( "cnt", cnt );
//		
//	
//		return new ModelAndView( "competition/compParList");
//	}
	
	
	@ResponseBody
	@RequestMapping( value="/compChoicePro.do", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public Map<String, String> compChoicePro( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		request.setCharacterEncoding( "utf-8" );
		
		String msg = "";
		Map<String, String> map = new HashMap<String, String>();
		String memId = (String) request.getSession().getAttribute( "memId" );
		String passwd = request.getParameter( "passwd" );
		String edNickName = request.getParameter( "edNickName" );
		int cNum = Integer.parseInt ( request.getParameter( "cNum" ) ); 
		
		int result = userDao.check( memId, passwd );
		
		if( result == -1 ) {
			msg = "입력하신 비밀번호가 다릅니다.";
		}
		
		if( result != -1 ) {
			CompParDataBean compParDto = new CompParDataBean();
			compParDto.setEdNickName( edNickName );
			compParDto.setcNum( cNum );			
			compDao.updateCompEdNickName( compParDto );
			msg = edNickName + "을 채택했습니다.";
		}				
		map.put( "msg", msg );
		map.put( "result", Integer.toString( result ) );		
		
		return map;
	}
	
//	@ResponseBody
//	@RequestMapping( value="/updateCReLike.do", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
//	public Map<String, Integer> upCReLike( HttpServletRequest request, HttpServletResponse response ) {		
//		int cReNum = Integer.parseInt( request.getParameter( "cReNum" ) );
//		int update = Integer.parseInt( request.getParameter( "update") );
//		
//		
//		int cReLike = Integer.parseInt( request.getParameter( "cReLike" ) );
//		
//		Map< String, Integer > map = new HashMap< String, Integer > ();
//		map.put( "cReNum", cReNum );
//		map.put( "update", update );
//		int result = compDao.updateCReLike(map);
//		
//		if( result == 1 ) {
//			cReLike = compDao.getCReLike(cReNum);
//		}
//		map.put( "cReLike", cReLike );				
//			
//		return map;
//	}
}
