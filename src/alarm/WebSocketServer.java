package alarm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

@ServerEndpoint( "/websocketserver.do" )
public class WebSocketServer {
	private static List<WebSocketServer> CLIENTS = new ArrayList<WebSocketServer>();
	private Session session;
	private String nickName;
	
	
	@OnOpen
	public void start( Session session ) {
//		System.out.println( "클라이언트 접속 : " + session );
		this.session = session;
		CLIENTS.add(this);
		
	}
	
	@OnClose
	public void end() {
		CLIENTS.remove(this);
	}
	
	@OnMessage
	public void incoming( String jsonS ) {
		Gson gson = new Gson();
		Packet packet = gson.fromJson(jsonS, Packet.class);
		
		String nickName = packet.getNickName();
		String receiver = packet.getReceiver();
			
		if(nickName != null) {
			setNickName(nickName);
		}
		
		if(receiver != null) {
			
			Integer aCauseNum = packet.getaCauseNum();
			String aMsg = packet.getaMsg();
			
			if(aMsg == null) {
				sendJsonS(jsonS, receiver);
			}else {
				Map<String, Object> map = new LinkedHashMap<String, Object>();
				map.put("aCauseNum", aCauseNum);
				map.put("receiver", receiver);
				map.put("aMsg", aMsg);
				
				AlarmDao alarmDao = new AlarmDBBean();
				
				int result = alarmDao.insertAlarm(map);
				
				if(result == 1) {
					sendJsonS(jsonS, receiver);
				}
				
			}
			
		}
		
	}
	
	@OnError
	public void error( Throwable t ) throws Throwable {
		t.printStackTrace();
	}
	
	
	//보내기 메서드
	public void sendJsonS( String jsonS, String receiver ) { 
		for( int i=0; i<CLIENTS.size(); i++ ) {
			WebSocketServer client = CLIENTS.get( i );

			if(client.getNickName().equals(receiver)) { 

				try {
					synchronized( client ) {				
						client.session.getBasicRemote().sendText( jsonS );
					}
				} catch( IllegalStateException e ) {
					if( e.getMessage().indexOf( "[TEXT_FULL_WRITING]" ) != -1 ) {
						new Thread() {
							public void run() {
								while( true ) {
									try {
										client.session.getBasicRemote().sendText( jsonS );
										break;
									} catch( IllegalStateException ee ) {
										try {
											Thread.sleep( 1000 );
										} catch( InterruptedException ie ) {
											ie.printStackTrace();
										}
									} catch( IOException ie ) {
										ie.printStackTrace();
									}
								}
							}						
						}.start();
					}			

				} catch ( Exception e ) {
					CLIENTS.remove(this);

					try {
						client.session.close();
					} catch (IOException e1) {
						e1.printStackTrace();
					}

				}

			}
		}
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	
	
	
}








