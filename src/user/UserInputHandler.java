package user;

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

@Controller
@EnableWebMvc
public class UserInputHandler {

	@Resource
	private UserDao userDao; 
	
	@RequestMapping("/userAddInputForm.do")		
	public ModelAndView userAddInputForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String page = request.getParameter("page");
		request.setAttribute("page", page);
		
		String id = (String) request.getSession().getAttribute("memId");
		String nickName = (String) request.getSession().getAttribute( "nickName" );
		
		ManUserBasic userDto = userDao.getUser( id );
		request.setAttribute( "userDto", userDto );
		ManUserDetail userDetailDto = userDao.getUserDetail(nickName);
		request.setAttribute( "userDetailDto", userDetailDto);
		
		return new ModelAndView("user/userAddInputForm");
	}
	
	@RequestMapping( "/userAddInputPro.do" )	
	public ModelAndView userAddInputPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding( "utf-8" );
		
		String page = request.getParameter("page");
		request.setAttribute("page", page);
		
		
		String nickName = (String) request.getSession().getAttribute("nickName");
		userDao.deleteUserDetail(nickName);
		
		int userGrade = (Integer) request.getSession().getAttribute("userGrade");
		if( userGrade == 1 ) { // 기본등급일때만 실행
			ManUserBasic userDto = new ManUserBasic();
			userDto.setNickName(nickName);
			userDto.setUserGrade( 2 ); // 컨트리뷰터 계급 달성
			userDto.setUpgradeDate( new Timestamp( System.currentTimeMillis() ) ); // 계급 달성 일짜
			userDao.updateUserGrade( userDto );
			request.getSession().setAttribute( "userGrade", userDto.getUserGrade());
		}
		
		ManUserDetail userDetailDto = new ManUserDetail();
		// 아이디
		userDetailDto.setNickName(nickName);
		// 관심직업
		userDetailDto.setPreferJob(Integer.parseInt(request.getParameter("preferJob")));
		// 관심컨텐츠
		userDetailDto.setPreferContent(Integer.parseInt(request.getParameter("preferContent")));
		// 나이
		userDetailDto.setAge( Integer.parseInt(request.getParameter("age")));
		// 성별
		userDetailDto.setGender(Integer.parseInt(request.getParameter("gender")));
		// 전화번호
		String tel1 = request.getParameter( "tel1" );
		String tel2 = request.getParameter( "tel2" );
		String tel3 = request.getParameter( "tel3" );
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		userDetailDto.setTel(tel);
		// 자기소개
		userDetailDto.setResume(request.getParameter("resume"));
		// 프로젝트가능여부
		userDetailDto.setAblePjt(Integer.parseInt(request.getParameter("ablePjt")));	
		int result = userDao.insertUserDetail(userDetailDto);
		request.setAttribute( "result", result );
		
		String addinputsuccess = "추가정보 입력에 성공하였습니다. ^^";
		request.setAttribute( "addinputsuccess", addinputsuccess );
		
		return new ModelAndView( "user/userAddInputPro" );
	}
	
	@RequestMapping( "/userInputForm.do" )
	public ModelAndView userInputForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return new ModelAndView( "user/userInputForm" );
	}
	
	@RequestMapping(value="/userInputFormConfirmId.do", method={RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	@ResponseBody
	public Map<String, Integer> userInputFormConfirmId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		int result = userDao.checkId(id); // int 값 반환 카운트수만큼
		int search = id.indexOf("@");
		if(  search == -1 ) { // @가 없을경우
			result = -1;
		}
		if( ( id.substring(search+1)).indexOf("@") != -1 ) { //
			result = -2;
		}
		if( id.equals( "" ) ) {
			result = -3;
		}
		
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping(value="/userInputFormConfirmNickName.do", method={RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	@ResponseBody
	public Map<String, Integer> userInputFormConfirmNickName(HttpServletRequest request) throws Exception {
		String nickName = request.getParameter("nickName");
		int result = userDao.checkNickName(nickName);
		
		if( nickName.equals( "" ) ) {
			result = -1;
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);
		
		
		return map;
	}


	
	@RequestMapping( "/userInputPro.do" )	
	public ModelAndView userInputPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding( "utf-8" );

		ManUserBasic userDto = new ManUserBasic();
		userDto.setId( request.getParameter( "id" ) );
		userDto.setPasswd( request.getParameter( "passwd" ) );
		userDto.setNickName( request.getParameter( "nickName" ));
		
		// joinDate
		userDto.setJoinDate( new Timestamp( System.currentTimeMillis() ) );
		// userGrade
		userDto.setUserGrade( 1 ); // 1이 가장 기본등급
		int result = userDao.insertUser( userDto );
		
		String success = "회원가입에 성공하였습니다. ^^";
		request.setAttribute( "success", success );
		request.setAttribute( "result", result );
		
		return new ModelAndView( "user/userInputPro" );
	}
}
