package file;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {

	private final String uploadPath = "C:/ManniUpload/";

	@Resource
	private FileDao fileDao;

	@GetMapping("/file.do")
	public String fileUploadForm(Model model) {
		return "views/fileUploadForm";
	}

	@PostMapping("/fileUpload")
	public ResponseEntity<Object> fileUpload(@RequestParam("file") MultipartFile file, String fCauseNum) throws IOException {
		
		if (!file.getOriginalFilename().isEmpty()) {
			BufferedOutputStream outputStream = new BufferedOutputStream(
					new FileOutputStream(
							new File(uploadPath, file.getOriginalFilename())));
			outputStream.write(file.getBytes());
			outputStream.flush();
			outputStream.close();

			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("fCauseNum", fCauseNum);
			map.put("fileName", file.getOriginalFilename());
			
			
			int result = fileDao.inputFile(map);
			if(result == 1) ;
			
		}else{
			return new ResponseEntity<>("Invalid file.",HttpStatus.BAD_REQUEST);
		}

		return new ResponseEntity<>("File Uploaded Successfully.",HttpStatus.OK);
	}

	

	@GetMapping("/down.do")
	public String fileUploadForm() {
		return "views/fileDownloadView";
	}

	@GetMapping("/download.do")
	public ResponseEntity<ByteArrayResource> downloadFile(String fileName) throws IOException {

		String filePath = uploadPath + fileName;

		Path path = Paths.get(filePath);
		byte[] data = Files.readAllBytes(path);
		ByteArrayResource resource = new ByteArrayResource(data);

		String fileNameEnco = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application", "octet-stream"));
		headers.set("Content-Disposition", String.format("filename=\"%s\"", fileNameEnco));

		return new ResponseEntity<ByteArrayResource>(resource, headers, HttpStatus.OK);
	}
	
	
	
	
}
