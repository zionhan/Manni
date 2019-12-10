package file;

import java.util.Map;

public interface FileDao {
	public Integer inputFile(Map<String, Object> map);
	public String getFileName(int fCauseNum);
}
