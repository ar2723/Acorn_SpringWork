package com.example.boot07.gallery.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.boot07.gallery.dao.GalleryDao;
import com.example.boot07.gallery.dto.GalleryDto;

@Service
public class GalleryServiceImpl implements GalleryService{
	
	@Value("${file.location}")
	private String fileLocation;
	
	@Autowired
	private GalleryDao dao;

	@Override
	public void getList(HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
	      final int PAGE_ROW_COUNT=4;
	      //하단 페이지를 몇개씩 표시할 것인지
	      final int PAGE_DISPLAY_COUNT=5;

	      //보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	      int pageNum = 1;

	      //페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	      String strPageNum = request.getParameter("pageNum");
	      //만일 페이지 번호가 파라미터로 넘어 온다면
	      if(strPageNum != null){
	         //숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
	         pageNum=Integer.parseInt(strPageNum);
	      }   
	      
	      //보여줄 페이지의 시작 ROWNUM
	      int startRowNum = 1 + (pageNum-1)*PAGE_ROW_COUNT;
	      //보여줄 페이지의 끝 ROWNUM
	      int endRowNum = pageNum * PAGE_ROW_COUNT;
	      
	      //GalleryDto 객체에 startRowNum과 endRowNum을 담는다.
	      GalleryDto dto = new GalleryDto();
	      dto.setStartRowNum(startRowNum);
	      dto.setEndRowNum(endRowNum);

	      //파일 목록을 select 해 온다.(검색 키워드가 있는경우 키워드에 부합하는 전체 글) 
	      List<GalleryDto> list = dao.getList(dto);
	      
	      //하단 시작 페이지 번호 
	      int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	      //하단 끝 페이지 번호
	      int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	      
	      //전체 글의 갯수
	      int totalRow = dao.getCount();
	      
	      //전체 페이지의 갯수 구하기
	      int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	      //끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	      if(endPageNum > totalPageCount){
	         endPageNum = totalPageCount; //보정해 준다. 
	      }
	      
	      //응답에 필요한 데이터를 view page 에 전달하기 위해  request scope 에 담는다
	      request.setAttribute("list", list);
	      request.setAttribute("pageNum", pageNum);
	      request.setAttribute("startPageNum", startPageNum);
	      request.setAttribute("endPageNum", endPageNum);
	      request.setAttribute("totalPageCount", totalPageCount);
	      request.setAttribute("totalRow", totalRow);
	}

	@Override
	public void saveImage(GalleryDto dto, HttpServletRequest request) {
		  //업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값 얻어오기 
	      MultipartFile myFile = dto.getMyFile();
	      //원본 파일명 -> 저장할 파일 이름 만들기위해서 사용됨
	      String orgFileName = myFile.getOriginalFilename();

	      //저장할 파일명 uuid 문자열 + 원본 파일명
	      String saveFileName=UUID.randomUUID().toString()+orgFileName;
	      try {
	         //파일을 저장할 전체 경로를 구성한다.  
	         String savePath = fileLocation+File.separator+saveFileName;
	         //임시폴더에 업로드된 파일을 원하는 파일을 저장할 경로에 전송한다.
	         myFile.transferTo(new File(savePath));
	      } catch(Exception e) {
	    	  e.printStackTrace();
	      }
	      String id=(String)request.getSession().getAttribute("id");
	      dto.setWriter(id); //세션에서 읽어낸 파일 업로더의 아이디
	      //gallery 는 사진 다운 기능이 없다. -> orgFileName, saveFileName, fileSize 저장할 필요X
	      //DB에는 saveFileName만 저장하고 출력할 때 자세한 경로를 출력해준다.
	      dto.setImagePath(saveFileName);
	      
	      //GalleryDao를 이용해서 업로드된 이미지의 정보를 DB 에 저장하기
	      dao.insert(dto);
	}

	@Override
	public void getData(int num, Model model) {
		GalleryDto dto = dao.getData(num);
		model.addAttribute("dto", dto);
	}
}
