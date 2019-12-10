package profile;

import java.util.List;

import configuration.SqlMapClient;
import user.ManUserDetail;

public class ProfDBBean implements ProfDao {
	public int checkUserDetail() {
		return SqlMapClient.getSession().selectOne( "Prof.checkUserDetail" );
	}
	public List<ManUserDetail> getArticles() {		
		return SqlMapClient.getSession().selectList( "Prof.getArticles" );
	}
	public ManUserDetail getUserDetail( String nickName ) {
		return SqlMapClient.getSession().selectOne( "Prof.getUserDetail", nickName );
	}
}
