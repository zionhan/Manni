package chat;

import java.util.List;

import configuration.SqlMapClient;

public class ChatDBBean implements ChatDao {

	@Override
	public Integer insertChat(ChatDataBean chatDataBean) {
		return SqlMapClient.getSession().insert("Chat.insertChat", chatDataBean);
	}

	@Override
	public List<ChatDataBean> getChat(int chCauseNum) {
		return SqlMapClient.getSession().selectList("Chat.getChat", chCauseNum);
	}

}
