package alarm;

import java.util.List;
import java.util.Map;

import configuration.SqlMapClient;

public class AlarmDBBean implements AlarmDao {


	//디스커션 전용기능이었음
	@Override
	public Integer dNumAlarm(String nickName) {
		Integer dNum = SqlMapClient.getSession().selectOne("Alarm.dNumAlarm", nickName);
		if(dNum == null) {
			dNum = 0;
		}
		return dNum;
	}
	@Override
	public Integer dReNumAlarm(String nickName) {
		Integer dReNum = SqlMapClient.getSession().selectOne("Alarm.dReNumAlarm", nickName);
		if(dReNum == null) {
			dReNum = 0;
		}
		return dReNum;
	}
	@Override
	public int getMaxNumRe() {
		return SqlMapClient.getSession().selectOne("Alarm.getMaxNumRe");
	}
	@Override
	public String getReceiver(int dReNum) {
		return SqlMapClient.getSession().selectOne("Alarm.getReceiver", dReNum);
	}
	
	
	////////////////////////////////////////////////////////////////////////////
	
	
	
	@Override
	public Integer insertAlarm(Map<String, Object> map) {
		return SqlMapClient.getSession().insert("Alarm.insertAlarm", map);
	}
	@Override
	public Integer deleteAlarm(int aNum) {
		return SqlMapClient.getSession().delete("Alarm.deleteAlarm", aNum);
	}
	@Override
	public List<AlarmDataBean> getAlarm(String nickName) {
		return SqlMapClient.getSession().selectList("Alarm.getAlarm", nickName);
	}
	@Override
	public Integer countAlarm(String nickName) {
		return SqlMapClient.getSession().selectOne("Alarm.countAlarm", nickName);
	}

	
	
	
	
	
	
	
	
	
	
	
}
