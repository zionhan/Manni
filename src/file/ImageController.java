package file;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImageController {
	
	private final String uploadPath = "C:/ManniUpload/";
	
	@RequestMapping("/getImage.do")
	public void getImage(HttpServletResponse response, String fileName) throws Exception {

		
		String fileNm = fileName;
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String realFile = uploadPath + fileName;

		BufferedOutputStream out = null;
		InputStream in = null;

		try {
			response.setContentType("image/" + ext);
			response.setHeader("Content-Disposition", "inline;filename=" + fileNm);
			File file = new File(realFile);
			if(file.exists()){
				in = new FileInputStream(file);
				out = new BufferedOutputStream(response.getOutputStream());
				int len;
				byte[] buf = new byte[1024];
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
			}
		} catch (Exception e) {
		
		} finally {
			if(out != null){ out.flush(); }
			if(out != null){ out.close(); }
			if(in != null){ in.close(); }
		}
	}
}
