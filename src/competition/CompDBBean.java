package competition;

import java.util.List;
import java.util.Map;

import configuration.SqlMapClient;

public class CompDBBean implements CompDao {		
	@Override
	public int getCompParCount(int cNum) {
		return SqlMapClient.getSession().selectOne( "Comp.getCompParCount", cNum );
	}
	@Override
	public int getCompReCount(int cNum) {
		return SqlMapClient.getSession().selectOne( "Comp.getCompReCount", cNum );
	}
	@Override
	public int getCReNum( int cNum, String nickName ) {
		int result = 0;
		List <CompParDataBean> compParList = getCompParList( cNum );		
		for ( CompParDataBean compParDto : compParList ) {			
			if( nickName.equals( compParDto.getNickName() ) ) {				
				result = compParDto.getcReNum();
			}			
		}	
		return result;		
	}	
	@Override
	public int isCReDate(int cReNum) {		
		return SqlMapClient.getSession().selectOne( "Comp.isCReDate", cReNum );
	}	
	
	@Override
	public String getCompStNickName(int cNum) {		
		return SqlMapClient.getSession().selectOne( "Comp.getCompStNickName", cNum );
	}
	
		
	
	
	
	@Override
	public CompDataBean getComp(int cNum) {
		return SqlMapClient.getSession().selectOne( "Comp.getComp", cNum );
	}
	@Override
	public CompParDataBean getCompPar(int cReNum) {
		return SqlMapClient.getSession().selectOne( "Comp.getCompPar", cReNum );
	}
	
	
	
	@Override
	public List<CompDataBean> getCompList( int sort ) {
		List<CompDataBean> compList;
		
		if ( sort == 0 ) {
			compList = SqlMapClient.getSession().selectList( "Comp.getCompListBasic");
		} else if ( sort == 1 ) {
			compList = SqlMapClient.getSession().selectList( "Comp.getCompListIng");
		} else {
			compList = SqlMapClient.getSession().selectList( "Comp.getCompListEnd");
		}		
		return compList;
	}
	@Override
	public List<CompParDataBean> getCompParList( int cNum ) {		
		return SqlMapClient.getSession().selectList( "Comp.getCompParList", cNum );
	}
	@Override
	public List<CompParDataBean> getCompReList(int cNum) {
		return SqlMapClient.getSession().selectList( "Comp.getCompReList", cNum );
	}
	
	
	
	
	
	
	
		
	@Override
	public int insertComp( CompDataBean compDto ) {		
		return SqlMapClient.getSession().update( "Comp.insertComp", compDto );
	}	
	@Override
	public int insertCompPar(CompParDataBean compParDto) {
		return SqlMapClient.getSession().update( "Comp.insertCompPar", compParDto );
	}
	
	
	
	@Override
	public int updateCompRe( CompParDataBean compParDto ) {		
		return SqlMapClient.getSession().update( "Comp.updateCompRe", compParDto );
	}
	@Override
	public int updateCompEdNickName(CompParDataBean compParDto) {
		return SqlMapClient.getSession().update( "Comp.updateCompEdNickName", compParDto );
	}
		
		
	@Override
	public int deleteCompPar(int cReNum) {		
		return SqlMapClient.getSession().update( "Comp.deleteCompPar", cReNum );
	}
	@Override
	public Integer getMaxCompNum() {
		Integer maxCompNum = SqlMapClient.getSession().selectOne("Comp.getMaxCompNum");
		if(maxCompNum == null) {
			maxCompNum = 30000000; // 시퀀스 시작은 30000001 로 해야함!
		}
		return maxCompNum;
	}
	
}
