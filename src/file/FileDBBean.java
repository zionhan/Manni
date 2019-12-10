package file;

import java.util.Map;

import configuration.SqlMapClient;

public class FileDBBean implements FileDao {

	@Override
	public Integer inputFile(Map<String, Object> map) {
		return SqlMapClient.getSession().insert("File.inputFile", map);
	}

	@Override
	public String getFileName(int fCauseNum) {
		return SqlMapClient.getSession().selectOne("File.getFileName", fCauseNum);
	}

	
}
