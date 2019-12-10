package rank;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vote.VoteDataBean;

@Controller
public class RankListHandler {
	
	@Resource
	private RankDao rankDao;
	
	@RequestMapping( "/rankList.do" )	
	public ModelAndView rankList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int cnt = 0; // 회원 수 개수
		int preferJob = Integer.parseInt(request.getParameter("preferJob"));// 스트리머를 볼 건지 에디터를 볼 건지( 스트리머 = 0, 에디터 = 1 )
		cnt = rankDao.checkManVote();		
		
		request.setAttribute( "preferJob", preferJob );
		if( cnt != 0 ) {
			List<VoteDataBean> StreamerArticles = rankDao.getStreamerArticles();
			request.setAttribute( "StreamerArticles", StreamerArticles );
			List<VoteDataBean> EditorArticles = rankDao.getEditorArticles();
			request.setAttribute( "EditorArticles", EditorArticles );
		}
		
		
		return new ModelAndView( "rank/rankList" );
	}	
}
