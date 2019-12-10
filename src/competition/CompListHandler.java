package competition;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.UserDao;

@Controller
public class CompListHandler {
   @Resource
   private CompDao compDao;
   
   @Resource
   private UserDao userDao;
   
   @RequestMapping( "/compList.do" )
   public ModelAndView compList( HttpServletRequest request ) throws Exception {
      
      String sortStr = request.getParameter( "sort" );
      int sort = 0;
      if( ! (sortStr == null || sortStr.equals("")) ) {
         //sort媛� 鍮꾩뼱�엳吏� �븡�� 寃쎌슦
         sort = Integer.parseInt(sortStr);
      }

      
      String nickName = (String) request.getSession().getAttribute( "nickName" );
      
      
      
      List<CompDataBean> compList = compDao.getCompList( sort );
      
      int userJob = -1;
      if( !( nickName == null || nickName.equals("") ) ) {
         userJob = userDao.getUserJob( nickName );
      } 
      
//      Object userJobObj = 
//      int userJob = -1;
//      if(userJobObj == null) {
//         int userJob = userDao.getUserJob( nickName );
//      }else {
//         userJob = Integer.parseInt(String.valueOf(userJobObj));
//      }
      
      
//      try {
//         userJob = userDao.getUserJob( nickName );
//      } catch ( Exception e ) {
//         userJob = -1;
//         e.printStackTrace();
//      }
       
      
      request.setAttribute( "userJob", userJob );
      request.setAttribute( "compList", compList );
      return new ModelAndView( "competition/compList" );
   }
   


}