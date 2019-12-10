package discussion;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import vote.VoteDao;

@Controller
@EnableWebMvc
public class DiscController {

	@Resource
	private DiscDao discDao;
	
	@Resource
	private VoteDao voteDao;
	
	@RequestMapping("/discussion.do")
	public String discDiscussion(HttpServletRequest request) throws Exception {
		
		//임시!!★
		//request.getSession().setAttribute("nickName", "방민");
		
		//디스커션20 디스댓글21
				
//		int discussion = 20000000;
//		int quantity = 10; // 한번에 로드할 게시물 수
//		int start = discussion + 1; // 첫 시작 주소			
//		int end = discussion + quantity; // 첫 끝 주소		
		
//		int sort = 0; // 0: 추천순(기본값), 1: 댓글순, 2: 최신순
//		System.out.println("디스커션 왔음");
//		String test = request.getParameter("test");
//		System.out.println("test: " + test);
		
		String sortStr = request.getParameter("sort");
		int sort = 1;
		if(sortStr != null && !sortStr.equals("")) {
			sort = Integer.parseInt(sortStr);
		}
//		System.out.println("discussion sort: " + sort);

		String searchStr = request.getParameter("search");
		String searchTimeStr = request.getParameter("searchTime");
		String searchText = request.getParameter("searchText");
		int search = 0;
		int searchTime = 0;
		if(		searchStr != null 			&& 
			!	searchStr.equals("") 		&& 
				searchTimeStr != null 		&& 
			!	searchTimeStr.equals("")	) {
			search = Integer.parseInt(searchStr);
			searchTime = Integer.parseInt(searchTimeStr);
		}
		
		int quantity = 10; // 한 번에 로드할 게시물 수
		int start = 1; // 첫 시작 주소			
		int end = quantity; // 첫 끝 주소		
		
		
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<DiscDataBean> articles = null;
		if(search == 0) {
			map.put("sort", sort);
			articles = discDao.getArticles(map); // 기본 or 정렬
		}else {
			//현재 시간을 sql.date로 구해서 string으로 변환하고 오라클에 보낸다
			//변환 및 연산은 오라클에서 한다!
			map.put("search", search); //검색대상
			map.put("searchTime", searchTime); //검색기간
			map.put("searchText", searchText);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("YYYYMMdd");
			String now = dateFormat.format(Calendar.getInstance().getTime());
			now += "235959";
			map.put("now", now);
			
			articles = discDao.searchArticles(map); // 검색
		}
		
		
		request.setAttribute("sort", sort);
		
		request.setAttribute("quantity", quantity);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		
		request.setAttribute("search", search);
		request.setAttribute("searchTime", searchTime);
		request.setAttribute("searchText", searchText);
		
		request.setAttribute("articles", articles);
		

		return "discussion/discussion";
	}
	
	@RequestMapping("/discMore.do")
	public String discMore(HttpServletRequest request) throws Exception {

		int sort = Integer.parseInt(request.getParameter("sort"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int start = Integer.parseInt(request.getParameter("start"));
		int end = Integer.parseInt(request.getParameter("end"));
		
		
		int search = Integer.parseInt(request.getParameter("search"));
		int searchTime = Integer.parseInt(request.getParameter("searchTime"));
		String searchText = request.getParameter("searchText");
		
		start += quantity;
		end += quantity;
		
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<DiscDataBean> articles = null;
		if(search == 0) {
			map.put("sort", sort);
			articles = discDao.getArticles(map); // 기본 or 정렬
		}else {
			//현재 시간을 sql.date로 구해서 string으로 변환하고 시간 추가해서 오라클에 보낸다
			//변환 및 연산은 오라클에서 한다!
			map.put("search", search); //검색대상
			map.put("searchTime", searchTime); //검색기간
			map.put("searchText", searchText);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("YYYYMMdd");
			String now = dateFormat.format(Calendar.getInstance().getTime());
			now += "235959";
			map.put("now", now);
			
			articles = discDao.searchArticles(map); // 검색
		}
		
		request.setAttribute("sort", sort);
		
		request.setAttribute("quantity", quantity);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		
		request.setAttribute("search", search);
		request.setAttribute("searchTime", searchTime);
		request.setAttribute("searchText", searchText);
		
		request.setAttribute("articles", articles);
		
		return "discussion/discMore";
	}
	
	@RequestMapping("/discContent.do")
	public String discContent(HttpServletRequest request) throws Exception {
		
		int dNum = Integer.parseInt(request.getParameter("dNum"));
		DiscDataBean discDto = discDao.getArticle(dNum);
		request.setAttribute("discDto", discDto);
		
		List<DiscReDataBean> discReDtos = discDao.getReplies(dNum);
		request.setAttribute("discReDtos", discReDtos);
		
		String dReNumStr = request.getParameter("dReNum");
		int dReNum = 0;
		if(dReNumStr != null) {
			dReNum = Integer.parseInt(dReNumStr);
		}
		
		request.setAttribute("dReNum", dReNum);
		
		return "discussion/discContent";
	}
	
	@RequestMapping("/discInsertForm.do")
	public String discInsertForm(HttpServletRequest request) throws Exception {
		
		return "discussion/discInsertForm";
	}

	@RequestMapping("/discInsertPro.do")
	public String discInsertPro(HttpServletRequest request) throws Exception {
		
		request.setCharacterEncoding( "utf-8" ); // 한글처리
		
		DiscDataBean discDto = new DiscDataBean();
		discDto.setNickName(request.getParameter("nickName"));
		discDto.setdTitle(request.getParameter("dTitle"));
		discDto.setdContent(request.getParameter("dContent"));
		discDto.setdField(request.getParameter("dField"));
		
		int result = discDao.insertArticle(discDto);
		
		if(result == 1) {
			int dNum = discDao.getMaxNum();
			request.setAttribute("dNum", dNum);
		}
		
		request.setAttribute("result", result);
		
		return "discussion/discInsertPro";
	}
	
	
	@RequestMapping("/discModifyForm.do")
	public String discModifyForm(HttpServletRequest request) throws Exception {
		
		int dNum = Integer.parseInt(request.getParameter("dNum"));
		DiscDataBean discDto = discDao.getArticle(dNum);
		request.setAttribute("discDto", discDto);
		
		return "discussion/discModifyForm";
	}
	
	@RequestMapping("/discModifyPro.do")
	public String discModifyPro(HttpServletRequest request) throws Exception {
		
		request.setCharacterEncoding( "utf-8" ); // 한글처리
		
		int dNum = Integer.parseInt(request.getParameter("dNum"));
		DiscDataBean discDto = discDao.getArticle(dNum);
		discDto.setdTitle(request.getParameter("dTitle"));
		discDto.setdContent(request.getParameter("dContent"));
		
		int result = discDao.updateArticle(discDto);
		
		request.setAttribute("result", result);
		request.setAttribute("dNum", dNum);
		
		return "discussion/discModifyPro";
	}
	
	@RequestMapping("/discDelete.do")
	public String discDelete(HttpServletRequest request) throws Exception {
		
		int dNum = Integer.parseInt(request.getParameter("dNum"));
		int result = discDao.deleteArticle(dNum);
		request.setAttribute("result", result);
		if(result == 1) {
			//글에 딸린 좋아요를 지웠다
			voteDao.deleteVoteAll(dNum);
			
			//글에 딸린 댓글도 지워야한다
			//글에 딸린 dReNum 배열을 deleteReply로 반복문 돌리면 됨
			List<Integer> dReNums = discDao.getRepliesByBoard(dNum);
			for(int dReNum : dReNums) {
				result = discDao.deleteReply(dReNum);
				if(result == 1) {
					//삭제 성공. man_vote에서 지워주자
					voteDao.deleteVoteAll(dReNum);
				}
			}
		
		}
		
		return "discussion/discDelete";
	}
	

	
///////////////////////////////////@Response Body////////////////////////////////////

	
	
	@RequestMapping(value="/discRePro.do", method={RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	@ResponseBody
	public List<DiscReDataBean> discRePro(HttpServletRequest request) throws Exception {

		int dNum = Integer.parseInt(request.getParameter("dNum"));
		
		//참고로 dReNum은 시퀀스 자동임
		DiscReDataBean discReDto = new DiscReDataBean();
		discReDto.setdNum(dNum);
		
		//부모도 받아야함!
		String dReParent = request.getParameter("dReParent");
		
		if(dReParent != null) {
			//부모가 있는 경우 ★ 아직 안해봄!! -> 시퀀스 넣을 때 나머지 올려야함 !
			Integer dReParentInteger = Integer.parseInt(dReParent);
			discReDto.setdReParent(dReParentInteger);
			Integer dReGroup = discDao.getParentReGroup(dReParentInteger);
			discReDto.setdReGroup(dReGroup); //부모dReNum와 같은 그룹으로
		
			Integer parentReDepth = discDao.getParentReDepth(dReParentInteger);
			Integer myDepth = parentReDepth + 1;
			discReDto.setdReDepth(myDepth); //부모 +1
			
			Map<String, Integer> map = new LinkedHashMap<String, Integer>();
			map.put("dNum", dNum);
			map.put("dReGroup", dReGroup);
			map.put("myDepth", myDepth);
			map.put("dReParent", dReParentInteger);
			Integer targetSeq = discDao.getMaxSeq(map) + 1;
			
			//seq -> 부모 +1 하고 나머지도 +1해서 밀어
			map.put("targetSeq", targetSeq);
			discDao.pushReSeq(map);
			discReDto.setdReSeq(targetSeq);
			
		}else {
			//부모가 없는 경우. 즉 이놈은 그룹의 root 이다
			discReDto.setdReParent(0);
			discReDto.setdReGroup(discDao.getNewReGroup(dNum));
			discReDto.setdReSeq(0);
			discReDto.setdReDepth(0); 
		}
		discReDto.setdReBlind(0);
		discReDto.setNickName(request.getParameter("nickName"));
		discReDto.setdReply(request.getParameter("dReply"));
		
		discDao.insertReply(discReDto);
		
		return discDao.getReplies(dNum);
	}
	
	
	@RequestMapping(value="/discReGetDepth.do", method={RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	@ResponseBody
	public Map<String, Object> discReGetDepth(HttpServletRequest request) throws Exception {
		Integer dReNum = Integer.parseInt((request.getParameter("dReNum")));
		int dReDepth = discDao.getParentReDepth(dReNum);
		
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("dReDepth", dReDepth);
		
		return map;
	}
	@RequestMapping(value="/discReDelete.do", method={RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	@ResponseBody
	public List<DiscReDataBean> discReDelete(HttpServletRequest request) throws Exception {
		int dReNum = Integer.parseInt(request.getParameter("dReNum"));
		int result = discDao.deleteReply(dReNum);
		if(result == 1) {
			//삭제 성공. man_vote에서 지워주자
			voteDao.deleteVoteAll(dReNum);
		}
		return discDao.getReplies(Integer.parseInt(request.getParameter("dNum")));
	}
	
	//이거 이제 무쓸모네
	@RequestMapping(value="/voteLinear.do", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public Map<String, Object> voteLinear(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
				
		int start = Integer.parseInt(request.getParameter("start"));
		int end = Integer.parseInt(request.getParameter("end"));
		
		for(int vCauseNum=start; vCauseNum<=end; vCauseNum++) {
			map.put(String.valueOf(vCauseNum), voteDao.getVoteCount(vCauseNum));
		}
		
		return map;
	}
	@RequestMapping(value="/voteLinearNon.do", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public Map<String, Object> voteLinearNon(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		String[] numArray = request.getParameterValues("numArray");
		
		if(numArray != null) {
			for(String vCauseNum : numArray) {
//				System.out.println("vCauseNum: " + vCauseNum);
				map.put(vCauseNum, voteDao.getVoteCount(Integer.parseInt(vCauseNum)));
			}
		}
		
		return map;
	}
	@RequestMapping(value="/countReply.do", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public Map<String, Object> countReply(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		String[] numArray = request.getParameterValues("numArray");
		
		for(String vCauseNum : numArray) {
			System.out.println("vCauseNum: " + vCauseNum);
			map.put(vCauseNum, discDao.getReCount(Integer.parseInt(vCauseNum)));
		}
		
		return map;
	}

	@RequestMapping(value="/voteUpdate.do", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public Map<String, Object> voteUpdate(HttpServletRequest request) throws Exception {
//		String nickName = request.getParameter("nickName");
		String nickName = (String) request.getSession().getAttribute("nickName");
		System.out.println("nickName: " + nickName);
		int vCauseNum = Integer.parseInt(request.getParameter("vCauseNum"));
		System.out.println("vCauseNum: " + vCauseNum);
		int vote = Integer.parseInt(request.getParameter("vote"));
		System.out.println("vote: " + vote);
		
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("nickName", nickName);
		map.put("vCauseNum", vCauseNum);
		map.put("vote", vote);
		
		//nickName, vCauseNum 으로 기존 vote 셀렉트. int로 -1,1 받기
		//존재하지 않는 경우는 뭘로? 0? ㅇㅇ
		int voteLog = voteDao.getVoteLog(map);
		System.out.println("voteLog: " + voteLog);
		int result = 0;		
		
		if(voteLog == 0) {
			//해당 vCauseNum에 nickName 없는 경우 -> 기존에 안누름
			
			if(vote == 1) {
				//지금 Up -> 결과 Up
				result = voteDao.setVoteCount(map);
				map.put("button", "11"); // 앞 10 업다운, 뒤 10 온오프 ... 적용 전에 일단 다 끄면 되겠네 ★
			}else {
				//지금 Down -> 결과 Down
				result = voteDao.setVoteCount(map);
				map.put("button", "01");
			}
		}else {
			//nickName 존재하는 경우 -> 기존에 누름
			// 기존 것 우선 삭제
			result = voteDao.deleteVoteOne(map); 
			
			if(voteLog == 1) {
				//기존 Up
				
				if(vote == 1) {
					//지금 Up -> 결과 취소
				}else {
					//지금 Down -> 결과 Down
					map.put("vote", -1);
					result = voteDao.setVoteCount(map);
					map.put("button", "01");
				}
			}else {
				//기존 Down
				
				if(vote == 1) {
					//지금 Up -> 결과 Up
					result = voteDao.setVoteCount(map);
					map.put("button", "11");
					
				}else {
					//지금 Down -> 결과 취소
				}
			}
		}
		
		System.out.println("vote삽입 result: " + result);
		if(result == 1) {
			//vote 1 or -1 삽입 성공
			int voteCount = voteDao.getVoteCount(vCauseNum);
			map.put("voteCount", voteCount);
		}else {
			//vote 삽입 실패
			if(map.containsKey("button")) map.remove("button");
		}
		
		return map;
	}
	
	
	@RequestMapping(value="/voteButton.do", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public Map<String, Object> voteButton(HttpServletRequest request) throws Exception {
		
		String nickName = (String) request.getSession().getAttribute("nickName");
		int vCauseNum = Integer.parseInt(request.getParameter("vCauseNum"));
		System.out.println("nickName: " + nickName);
		System.out.println("vCauseNum: " + vCauseNum);
		
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("nickName", nickName);
		map.put("vCauseNum", vCauseNum);
		
		int vote = voteDao.getVoteLog(map);
		map.put("vote", vote);
		
		return map;
	}
	

	
	

	

}












