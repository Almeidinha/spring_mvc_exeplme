package br.com.codehouse.store.infra;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {

	@Autowired
	private HttpServletRequest request;
	
	public String write(String baseFolder, MultipartFile file) {
		
		try {
		 	String fullPath =	request.getServletContext().getRealPath("/" + baseFolder);
		 	
		 	if (!Files.exists(Paths.get(fullPath))) {
		 		Files.createDirectory(Paths.get(fullPath));
		 	}
		 	
			String path = fullPath + "/" + file.getOriginalFilename();
			file.transferTo(new File(path));
			
			return baseFolder + "/" + file.getOriginalFilename();
		} catch (IllegalStateException | IOException e) {
			throw new RuntimeException(e);
		}

	}
	
}
