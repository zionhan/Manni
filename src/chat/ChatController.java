package chat;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChatController {

	@Resource
	private ChatDao chatDao;
	
	@RequestMapping(value="/insertChat.do", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public Integer insertChat(HttpServletRequest request, @ModelAttribute ChatDataBean chatDataBean) throws Exception {
		return chatDao.insertChat(chatDataBean);
	}

	@RequestMapping(value="/getChat.do", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public List<ChatDataBean> getChat(HttpServletRequest request, int chCauseNum) throws Exception {
		List<ChatDataBean> list = chatDao.getChat(chCauseNum);
		for(int i=0; i<list.size(); i++) {
			Timestamp ts = list.get(i).getChDate();
			Date date = new Date();
			date.setTime(ts.getTime());
			String formattedDate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(date);
			list.get(i).setChDateStr(formattedDate);
		}
		
		return list;
	}
	
}
