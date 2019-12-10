package profile;

import java.util.List;
import user.*;

public interface ProfDao {
	public int checkUserDetail();
	public List<ManUserDetail> getArticles();
	public ManUserDetail getUserDetail( String nickName );
}

