package profile;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.ManUserDetail;

@Controller
public class ProfListHandler {
	
	@Resource
	private ProfDao profDao;
	
	@RequestMapping( "/profList.do" )	
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int cnt = 0; // 프로필 개수
		
		cnt = profDao.checkUserDetail();
		request.setAttribute( "cnt" , cnt );
		
		
		if( cnt != 0 ) {
			List<ManUserDetail> articles = profDao.getArticles();
			request.setAttribute( "articles", articles );
		}
		
		return new ModelAndView( "profile/profList" );
	}	
}
