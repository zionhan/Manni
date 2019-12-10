package user;

import user.ManUserBasic;

public interface UserDao {
	public int insertUser( ManUserBasic userDto );
	public int checkId( String id );
	public int checkNickName( String nickName );
	public int check( String id, String passwd );
	public int deleteUser( String id );
	public ManUserBasic getUser( String id );
	public ManUserDetail getUserDetail( String nickName );
	public String getUserNickName( String id );
	public int updateUser( ManUserBasic userDto );
	public int insertUserDetail( ManUserDetail userDetailDto);
	public void deleteUserDetail(String nickName);
	public int updateUserGrade( ManUserBasic userDto );
	public Integer getUserJob( String nickName );
	
}