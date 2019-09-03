package kr.co.journalista.upload;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class uploadController {
	private static final Logger logger = LoggerFactory.getLogger(uploadController.class);
	@GetMapping("/uploadForm")
	public void uploadForm() {
		logger.info("upload form");
	}

	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		logger.info("upload ajax");
	}
	@PostMapping(value="wrboard/upload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<String>uploadAjaxPost(@RequestParam("file") MultipartFile multipartFile){
		logger.info("update ajax post");
		String uploadFolder = "/home/hosting_users/ydkhaha/tomcat/webapps/ROOT/resources/images"; //업로드되는 폴더 설정
		String uploadFolderPath = getFolder();
		//폴더 만들기
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		logger.info("upload path:"+uploadPath);
		logger.info("폴더패스:"+uploadFolderPath);
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}//년월날 같은 폴더가 존재하지 않으면 폴더 만들기
			
			logger.info("upload File Name:"+multipartFile.getOriginalFilename());
			logger.info("upload File Size:"+multipartFile.getSize());
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			logger.info("only file name:" + uploadFileName);
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
//			MultipartRequest multi = new MultipartRequest();
			long fileSize = multipartFile.getSize();
			logger.info("파일 사이즈:"+fileSize);
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				//이미지 타입인지 체크
				if(checkImageType(saveFile)) {
					if(fileSize <= 3145728) {
						
						multipartFile.transferTo(saveFile); //이미지 파일이면 서버에 이미지 저장
						return ResponseEntity.ok().body(uploadFolderPath+"/"+uploadFileName);
					} else {
						return ResponseEntity.ok().body("2");//이미지파일이면서 용량이 3메가를 넘어가면 2를 리턴
					}
				}else {
					return ResponseEntity.ok().body("1");//이미지 파일이 아닐때 1을 리턴
				}
			}catch(Exception e) {
				logger.error(e.getMessage());
			}
			return ResponseEntity.badRequest().build();
		//for문 끝
		
	}
	
	@ResponseBody
	@PostMapping("member/upload")
	public String uploadProfile(MultipartFile uploadFile, HttpSession session){
		logger.info("프로필 업로드");
		String uploadFolder = "/home/hosting_users/ydkhaha/tomcat/webapps/ROOT/resources/images/profile";
		String profileNo = (String)session.getAttribute("login_member_no");
	
		String rename = profileNo;
		String uploadFileName = uploadFile.getOriginalFilename();
		uploadFileName = rename+".jpg";
		File saveFile = new File(uploadFolder, uploadFileName);
		long fileSize = uploadFile.getSize();
		try {
			if(checkImageType(saveFile)) {
				if(fileSize <= 2097152) {
					logger.info("2메가 이하네");
					uploadFile.transferTo(saveFile); //이미지 파일이면 서버에 이미지 저장
					return "3"; //성공데스네
				} else {
					return "2";//이미지파일이면서 용량이 2메가를 넘어가면 2를 리턴
				}
			}else {
				return "1";//이미지 파일이 아닐때 1을 리턴
			}

		}catch (Exception e) {
			logger.error(e.getMessage());
			return "error";
		}
		
	}

	//폴더 년월날로 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	//이미지 파일인지 아닌지 검사
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}
}
