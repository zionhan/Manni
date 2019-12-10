package competition;

import java.util.List;
import java.util.Map;

public interface CompDao {
	public int getCompParCount( int cNum );
	public int getCompReCount( int cNum );
	public int getCReNum( int cNum, String nickName );
	public int isCReDate( int cReNum );	
	
	public String getCompStNickName( int cNum );
	
	
	public int insertComp( CompDataBean comDto );
	public int insertCompPar( CompParDataBean compParDto );
	
	public CompDataBean getComp( int cNum );
	public CompParDataBean getCompPar( int cReNum );
	
	public List<CompDataBean> getCompList( int sort );	
	public List<CompParDataBean> getCompParList( int cNum );
	public List<CompParDataBean> getCompReList( int cNum );
	
	
	public int updateCompRe ( CompParDataBean compParDto );
	public int updateCompEdNickName ( CompParDataBean compParDto );
		
	
	
	public int deleteCompPar( int cReNum );
	
	
	public Integer getMaxCompNum();
	
}
