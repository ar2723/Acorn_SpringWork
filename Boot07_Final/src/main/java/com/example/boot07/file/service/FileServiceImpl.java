package com.example.boot07.file.service;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.boot07.exception.NotDeleteException;
import com.example.boot07.file.dao.FileDao;
import com.example.boot07.file.dto.FileDto;

@Service
public class FileServiceImpl implements FileService{

	@Autowired
	private FileDao dao;
	
	@Value("${file.location}")
	private String fileLocation;
	
	@Override
	public void getList(HttpServletRequest request) {
	      //한 페이지에 몇개씩 표시할 것인지
	      final int PAGE_ROW_COUNT=5;
	      //하단 페이지를 몇개씩 표시할 것인지
	      final int PAGE_DISPLAY_COUNT=5;

	      //보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	      int pageNum=1;

	      //페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	      String strPageNum=request.getParameter("pageNum");
	      //만일 페이지 번호가 파라미터로 넘어 온다면
	      if(strPageNum != null){
	         //숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
	         pageNum=Integer.parseInt(strPageNum);
	      }   
	      
	      //보여줄 페이지의 시작 ROWNUM
	      int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	      //보여줄 페이지의 끝 ROWNUM
	      int endRowNum=pageNum*PAGE_ROW_COUNT;
	      
	      /*
	         [ 검색 키워드에 관련된 처리 ]
	         -검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.      
	      */
	      String keyword=request.getParameter("keyword");
	      String condition=request.getParameter("condition");
	      //만일 키워드가 넘어오지 않는다면 
	      if(keyword==null){
	         //키워드와 검색 조건에 빈 문자열을 넣어준다. 
	         //클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
	         keyword="";
	         condition=""; 
	      }

	      //특수기호를 인코딩한 키워드를 미리 준비한다. 
	      String encodedK=URLEncoder.encode(keyword);
	         
	      //FileDto 객체에 startRowNum 과 endRowNum 을 담는다.
	      FileDto dto=new FileDto();
	      dto.setStartRowNum(startRowNum);
	      dto.setEndRowNum(endRowNum);
	   
	      //만일 검색 키워드가 넘어온다면 
	      if(!keyword.equals("")){
	         //검색 조건이 무엇이냐에 따라 분기 하기
	         if(condition.equals("title_filename")){//제목 + 파일명 검색인 경우
	            dto.setTitle(keyword);
	            dto.setOrgFileName(keyword);
	         }else if(condition.equals("title")){ //제목 검색인 경우
	            dto.setTitle(keyword);
	         }else if(condition.equals("writer")){ //작성자 검색인 경우
	            dto.setWriter(keyword);
	         } // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
	      }
	      
	      
	      //파일 목록을 select 해 온다.(검색 키워드가 있는경우 키워드에 부합하는 전체 글) 
	      List<FileDto> list=dao.getList(dto);
	      
	      //전체 글의 갯수(검색 키워드가 있는경우 키워드에 부합하는 전체 글의 갯수)
	      int totalRow=dao.getCount(dto);
	      
	      //하단 시작 페이지 번호 
	      int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	      //하단 끝 페이지 번호
	      int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	      
	      //전체 페이지의 갯수 구하기
	      int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	      //끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	      if(endPageNum > totalPageCount){
	         endPageNum=totalPageCount; //보정해 준다. 
	      }
	      
	      //응답에 필요한 데이터를 view page 에 전달하기 위해  request scope 에 담는다
	      request.setAttribute("list", list);
	      request.setAttribute("pageNum", pageNum);
	      request.setAttribute("startPageNum", startPageNum);
	      request.setAttribute("endPageNum", endPageNum);
	      request.setAttribute("totalPageCount", totalPageCount);
	      request.setAttribute("keyword", keyword);
	      request.setAttribute("encodedK", encodedK);
	      request.setAttribute("totalRow", totalRow); 
	      request.setAttribute("condition", condition);	
	}

	@Override
	public void saveFile(FileDto dto, Model model, HttpServletRequest request) {
		//업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값 얻어오기
		MultipartFile myFile = dto.getMyFile();
		//원본 파일명
	    String orgFileName = myFile.getOriginalFilename();
	    //파일의 크기
	    long fileSize = myFile.getSize();
		//저장할 파일명 구성하기
		String saveFileName=UUID.randomUUID().toString() + orgFileName;
		// 파일을 저장할 폴더까지의 실제경로
		String filePath=fileLocation+File.separator+saveFileName;
		try {
			//원하는 경로에 파일 저장하기
     		myFile.transferTo(new File(filePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
	      //dto 에 업로드된 파일의 정보를 담는다.
	      String id=(String)request.getSession().getAttribute("id");
	      dto.setWriter(id); //세션에서 읽어낸 파일 업로더의 아이디 
	      dto.setOrgFileName(orgFileName);
	      dto.setSaveFileName(saveFileName);
	      dto.setFileSize(fileSize);
	      
	      //fileDao를 이용해서 업로드된 파일의 정보를 DB 에 저장하기 (DB에 파일 자체를 저장하는 것은 아님)
	      dao.insert(dto);
	      //view 페이지에서 사용할 모델 담기 
	      model.addAttribute("dto", dto);
	}
	
	//이 메소드는 파일 다운로드 요청 처리시에 활용되기 위해 만들어둔 것이다.
	@Override
	public FileDto getFileData(int num) {
		//다운로드 할 파일의 정보를 얻어와서
		return dao.getData(num);
	}

	@Override
	public void deleteFile(int num, HttpServletRequest request) {
		//삭제할 파일의 정보 얻어오기
		FileDto dto = dao.getData(num);
		//글 작성자와 로그인된 아이디가 일치하는지 확인해서 일치하면 삭제하고, 일치하지 않으면 예외를 발생시키기
		String id = (String)request.getSession().getAttribute("id");
		if(!dto.getWriter().equals(id)) {
			//예외를 발생시키면 해당 예외를 처리하는 곳으로 실행의 흐름이 넘어간다.
			throw new NotDeleteException("다른 사람의 파일을 지울 수 없습니다.");
		}
		//파일 시스템에서 /WEB-INF/views/resources/upload 폴더에 실제로 저장되어 있는 파일을 삭제
		String saveFileName = dto.getSaveFileName();
		String path = fileLocation + File.separator+saveFileName;
		new File(path).delete();
		//DB에서 파일 정보 삭제
		dao.delete(num);
	}
}
