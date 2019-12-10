package configuration;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapClient {
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader( "configuration/sqlMapConfig.xml" );
			SqlSessionFactory factory =  new SqlSessionFactoryBuilder().build( reader );
//			session = factory.openSession( false );	// 오토커밋 X. 트랜잭션 O
			session = factory.openSession( true );	// 오토커밋 O. 트랜잭션 X
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	public static SqlSession getSession() {
		return session;
	}
}








