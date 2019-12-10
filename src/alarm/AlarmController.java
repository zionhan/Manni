package alarm;

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


@Controller
@EnableWebMvc
public class AlarmController {

	@Resource
	private AlarmDao alarmDao;
	
//	@Resource
//	private DiscDao discDao;
	

	@RequestMapping(value="/deleteAlarm.do", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public Map<String, Object> deleteAlarm(HttpServletRequest request, int aNum, String nickName) throws Exception {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		int result = alarmDao.deleteAlarm(aNum);
		int count = alarmDao.countAlarm(nickName);
		map.put("result", result);
		map.put("count", count);

		return map;
	}
	
	
	@RequestMapping(value="/setRealTimeAlarm.do", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public List<AlarmDataBean> setRealTimeAlarm(HttpServletRequest request, String nickName) throws Exception {
		return alarmDao.getAlarm(nickName);
	}

	
	//디스커션 전용기능들이었음
//	@RequestMapping(value="/setRealTimeAlarm.do", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
//	@ResponseBody
//	public Map<String, Object> setRealTimeAlarm(HttpServletRequest request) throws Exception {
//		Map<String, Object> map = new LinkedHashMap<String, Object>();
//		
//		String nickName = request.getParameter("nickName");
//		System.out.println("받은 nickName: " + nickName);
//		
//		//nickName으로 alarm 테이블 조회해서 dNum과 dReNum을 map으로 보내준다!
//		int dNum = alarmDao.dNumAlarm(nickName);
//		int dReNum = alarmDao.dReNumAlarm(nickName);
//		
//		map.put("dNum", dNum);
//		map.put("dReNum", dReNum);
//		
//		return map;
//	}
//	@RequestMapping(value="/alarmReRe.do", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
//	@ResponseBody
//	public void alarmReRe(HttpServletRequest request) throws Exception {
//		//해당 글번호와 최신댓글(내가위에달은댓글), 그리고 그 부모댓글의 닉네임을 보내주면 된다.
//		//ajax 받은 쪽에서 최신댓글 검색 후 그 부모댓글 닉네임 검색해서 alarm db에 넣어줘야함
//		int dNum = Integer.parseInt(request.getParameter("dNum"));
//		int dReNum = alarmDao.getMaxNumRe();
//		
//		int dReParent = discDao.getReParent(dReNum);
//		String receiver = alarmDao.getReceiver(dReParent);
//		
//		Map<String, Object> map = new LinkedHashMap<String, Object>();
//		map.put("dNum", dNum);
//		map.put("dReNum", dReNum);
//		map.put("receiver", receiver);
//		
//		alarmDao.insertAlarm(map);
//	
//	}

	
}
