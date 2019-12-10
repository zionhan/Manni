package alarm;

import java.util.List;
import java.util.Map;

public interface AlarmDao {

	public Integer dNumAlarm(String nickName);
	public Integer dReNumAlarm(String nickName);
	public int getMaxNumRe();
	public String getReceiver(int dReNum);
	
	
	
	public Integer insertAlarm(Map<String, Object> map);
	public Integer deleteAlarm(int aNum);
	public List<AlarmDataBean> getAlarm(String nickName);
	public Integer countAlarm(String nickName);
	
}
