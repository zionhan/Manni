package user;

import configuration.SqlMapClient;
import user.ManUserBasic;

public class UserDBBean implements UserDao {
	
	public int insertUser( ManUserBasic userDto ) {
		return SqlMapClient.getSession().insert( "User.insertUser", userDto );
	}
	
	public int checkId( String id ) {		
		return SqlMapClient.getSession().selectOne( "User.checkId", id );
	}
	
	public int checkNickName( String nickName ) {
		return SqlMapClient.getSession().selectOne( "User.checkNickName", nickName );
	}
	
	public int check( String id, String passwd ) {
		int result = checkId( id );
		if( result == 1 ) {
			ManUserBasic userDto = getUser( id );
			if( ! passwd.equals( userDto.getPasswd() ) ) {
				result = -1;
			}
		} 		
		return result;
	}
	
	public int deleteUser( String id ) {
		return SqlMapClient.getSession().delete( "User.deleteUser", id );
	}

	public ManUserBasic getUser( String id ) {
		return SqlMapClient.getSession().selectOne( "User.getUser", id );		
	}
	public ManUserDetail getUserDetail( String nickName ) {
		return SqlMapClient.getSession().selectOne( "User.getUserDetail", nickName );		
	}
	
	public String getUserNickName( String id ) {
		return SqlMapClient.getSession().selectOne("User.getUserNickName", id );
	}
	public int updateUser( ManUserBasic userDto ) {
		return SqlMapClient.getSession().update( "User.updateUser", userDto );		
	}
	public void deleteUserDetail( String nickName ) {
		SqlMapClient.getSession().delete( "User.deleteUserDetail", nickName);
	}
	
	public int insertUserDetail( ManUserDetail userDetailDto) {
		return SqlMapClient.getSession().update( "User.insertUserDetail", userDetailDto);
	}
	public int updateUserGrade ( ManUserBasic userDto ) {
		return SqlMapClient.getSession().update( "User.updateUserGrade", userDto);
	}


	@Override
	public Integer getUserJob(String nickName) {
		Integer num = SqlMapClient.getSession().selectOne( "User.getUserJob", nickName );
		if(num == null) {
			num = -1;
		}
		return num;
	}

	
}
