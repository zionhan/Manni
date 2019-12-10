package chat;

import java.util.List;

public interface ChatDao {

	public Integer insertChat(ChatDataBean chatDataBean); // 챗DTO
	public List<ChatDataBean> getChat(int chCauseNum); // 프로젝트넘버
	
}
