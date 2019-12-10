package project;

import java.util.List;

public interface ProjDao {
	// selectOne
	public int getMaxPNum();
		
	public ProjDataBean getProjDto( int pNum );
	public ProjEvalDataBean getProjEvalList( String nickName );
	
	
	// selectList
	public List<ProjDataBean> getProjListByStNickName( String nickName );
	public List<ProjDataBean> getProjListByEdNickName( String nickName );
	
	
	// insert
	public int insertProj( ProjDataBean projDto );
	
	// update
	public int updatePCode( ProjDataBean projDto );
	public int updateProjRe( ProjDataBean projDto );
	
	// delete
	public int deleteProj( int pNum );
	
	public Integer getMaxProjNum();
}
