package competition;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CompWriteHandler {
	@Resource
	private CompDao compDao;
	
	
	@RequestMapping( "/compWriteForm.do" )
	public ModelAndView compWriteForm( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		
		Integer maxCompNum = compDao.getMaxCompNum();
		int fCauseNum = maxCompNum + 1;
		request.setAttribute("fCauseNum", fCauseNum);
		
		return new ModelAndView( "competition/compWriteForm" );
	}
	
	@RequestMapping( "/compWritePro.do" )
	public ModelAndView compWritePro( HttpServletRequest request, HttpServletResponse response )  throws Exception {
		request.setCharacterEncoding( "utf-8" );
		CompDataBean compDto = new CompDataBean();
		
		
		// String 타입을 java.util.Date 로 변환한다.
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date datecEndDate = formatter.parse( request.getParameter( "cEndDate" ) );

		// java.util.Date 를 java.sql.Timestamp 로 변환한다.
		Timestamp cEndDate = new Timestamp( datecEndDate.getTime() );
		
		// , 들어있는 숫자(금액) 에서 ,를 빼주고 숫자값으로  변환한다.
		String cRewardS = request.getParameter( "cReward" );
		String pRewardS = request.getParameter( "pReward" );
		cRewardS = cRewardS.replace(",", "");
		pRewardS = pRewardS.replace(",", "");	
		int cReward = Integer.parseInt( cRewardS );
		int pReward = Integer.parseInt( pRewardS );		
					
		
		compDto.setcTitle( request.getParameter( "cTitle" ) );
		compDto.setNickName( (String) request.getSession().getAttribute( "nickName") );		
		compDto.setcEndDate( cEndDate );
		compDto.setcExpireDate( cEndDate );
		compDto.setcReward( cReward );
		compDto.setpReward( pReward );
		compDto.setcField( request.getParameter( "cField" ) );
		compDto.setcEditStyle( request.getParameter( "cEditStyle" ) );
		compDto.setcEditTime( request.getParameter( "cEditTime" ) );
		compDto.setcContent( request.getParameter( "cContent" ) );
		
		int result = compDao.insertComp( compDto );
		request.setAttribute( "result", result );		
		
		return new ModelAndView( "competition/compWritePro" );
	}
	
}
