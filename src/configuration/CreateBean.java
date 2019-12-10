package configuration;

//import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import alarm.AlarmDBBean;
import alarm.AlarmDao;
import chat.ChatDBBean;
import chat.ChatDao;
import competition.CompDBBean;
import competition.CompDao;
import discussion.DiscDBBean;
import discussion.DiscDao;
import file.FileDBBean;
import file.FileDao;
import market.MarketDBBean;
import market.MarketDao;
import profile.ProfDBBean;
import profile.ProfDao;
import project.ProjDBBean;
import project.ProjDao;
import rank.RankDBBean;
import rank.RankDao;
import user.UserDBBean;
import user.UserDao;
import vote.VoteDBBean;
import vote.VoteDao;

@Configuration
public class CreateBean {

	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass( JstlView.class );
		viewResolver.setPrefix( "/" );
		viewResolver.setSuffix( ".jsp" );	
		return viewResolver;
	}		
	
	
	@Bean
	public CompDao compDao() {
		CompDBBean compDao = new CompDBBean();
		return compDao;
	}
	
	@Bean
	public DiscDao discDao() {
		DiscDBBean discDao = new DiscDBBean();
		return discDao;
	}
	
	@Bean
	public ProfDao profDao() {
		ProfDBBean profDao = new ProfDBBean();
		return profDao;
	}
	
	@Bean
	public ProjDao projDao() {
		ProjDBBean projDao = new ProjDBBean();
		return projDao;
	}
	
	@Bean
	public UserDao userDao() {
		UserDBBean userDao = new UserDBBean();
		return userDao;
	}
	
	@Bean
	public VoteDao voteDao() {
		VoteDBBean voteDao = new VoteDBBean();
		return voteDao;
	}

	@Bean
	public FileDao fileDao() {
		FileDBBean fileDao = new FileDBBean();
		return fileDao;
	}
	
	@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(1048576000 * 899 ); 
		multipartResolver.setMaxUploadSizePerFile(1048576000 * 899 ); 
		return multipartResolver;
	}
	
	
	@Bean
	public MarketDao marketDao() {
		MarketDBBean marketDao = new MarketDBBean();
		return marketDao;
	}
	
	@Bean
	public ChatDao chatDao() {
		ChatDBBean chatDao = new ChatDBBean();
		return chatDao;
	}
	
	@Bean
	public RankDao rankDao() {
		RankDBBean rankDao = new RankDBBean();
		return rankDao;
	}
	
	@Bean
	public AlarmDao alarmDao() {
		AlarmDBBean alarmDao = new AlarmDBBean();
		return alarmDao;
	}
	
}










	