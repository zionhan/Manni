package project;

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
public class ProjWriteHandler {	
	
	@Resource
	private ProjDao projDao;
	
	
	@RequestMapping( "/projWriteForm.do" )
	public ModelAndView projWriteForm ( HttpServletRequest request, HttpServletResponse response ) {		
		String edNickName = request.getParameter( "edNickName" );
				
		request.setAttribute( "edNickName", edNickName );
		
		Integer maxProjNum = projDao.getMaxProjNum();
		int fCauseNum = maxProjNum + 1;
		request.setAttribute("fCauseNum", fCauseNum);
		
		return new ModelAndView( "project/projWriteForm" );
	}
	
	@RequestMapping( "/projWritePro.do" )
	public ModelAndView projWritePro ( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		request.setCharacterEncoding( "utf-8" );
		
		ProjDataBean projDto = new ProjDataBean();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date datePEndDate = formatter.parse( request.getParameter( "pEndDate" ) );
		Timestamp pEndDate = new Timestamp( datePEndDate.getTime() ) ;			
		
		
		String pRewardS = request.getParameter( "pReward" );
		pRewardS = pRewardS.replace(",", "");	
		int pReward = Integer.parseInt( pRewardS );			
		
		
		projDto.setStNickName( (String) request.getSession().getAttribute( "nickName" ) );
		projDto.setEdNickName( request.getParameter( "edNickName" ) );
		projDto.setpReward( pReward );
		projDto.setpField( request.getParameter( "pField" ) );
		projDto.setpEditStyle( request.getParameter( "pEditStyle" ) );
		projDto.setpEditTime( request.getParameter( "pEditTime" ) );
		projDto.setpContent( request.getParameter( "pContent" ) );		
		projDto.setpEndDate( pEndDate );
		projDto.setpCode( 0 );		
		
		int result = projDao.insertProj( projDto );		
		request.setAttribute( "result", result );			
		
		return new ModelAndView( "project/projWritePro" );
	}

}
