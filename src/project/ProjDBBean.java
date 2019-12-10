package project;

import java.util.List;

import configuration.SqlMapClient;

public class ProjDBBean implements ProjDao {
	
	@Override
	public int getMaxPNum() {
		return SqlMapClient.getSession().selectOne( "Proj.getMaxPNum" );
	}
	
		
	@Override
	public ProjDataBean getProjDto( int pNum ) {	
		return SqlMapClient.getSession().selectOne( "Proj.getProjDto", pNum );
	}
	
	@Override
	public ProjEvalDataBean getProjEvalList(String nickName) {
		// TODO Auto-generated method stub
		return null;
	}	
	
	
	
	@Override
	public List<ProjDataBean> getProjListByEdNickName(String nickName) {
		return SqlMapClient.getSession().selectList( "Proj.getProjListByEdNickName", nickName );
	}
	
	@Override
	public List<ProjDataBean> getProjListByStNickName(String nickName) {
		return SqlMapClient.getSession().selectList( "Proj.getProjListByStNickName", nickName );
	}
	
	
	
	
	@Override
	public int insertProj( ProjDataBean projDto ) {
		return SqlMapClient.getSession().update( "Proj.insertProj", projDto );
	}
	
	
	
	@Override
	public int updatePCode(ProjDataBean projDto) {		
		return SqlMapClient.getSession().update( "Proj.updatePCode", projDto );
	}
	
	@Override
	public int updateProjRe(ProjDataBean projDto) {		
		return SqlMapClient.getSession().update( "Proj.updateProjRe", projDto );
	}
	
	
	
	
	@Override
	public int deleteProj(int pNum) {		
		return SqlMapClient.getSession().update( "Proj.deleteProj", pNum );
	}
	
	@Override
	public Integer getMaxProjNum() {
		Integer maxProjNum = SqlMapClient.getSession().selectOne("Proj.getMaxProjNum");
		if(maxProjNum == null) {
			maxProjNum = 40000000; // 시퀀스 시작은 40000001 로 해야함!
		}
		return maxProjNum;
	}

}
