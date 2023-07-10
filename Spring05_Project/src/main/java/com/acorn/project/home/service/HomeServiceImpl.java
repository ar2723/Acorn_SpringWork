package com.acorn.project.home.service;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.project.cafe.dao.CafeDao;
import com.acorn.project.cafe.dao.ClassCafeDao;
import com.acorn.project.cafe.dto.CafeDto;
import com.acorn.project.cafe.dto.ClassCafeDto;
import com.acorn.project.gallery.dao.GalleryDao;
import com.acorn.project.gallery.dto.GalleryDto;

@Service
public class HomeServiceImpl implements HomeService{
	
	@Autowired
	private CafeDao cafeDao;
	@Autowired
	private ClassCafeDao classCafeDao;
	@Autowired
	private GalleryDao galleryDao;
	
	@Override
	public List<CafeDto> getCafeList(HttpServletRequest request) {
		  //한 페이지에 몇개씩 표시할 것인지
	      final int PAGE_ROW_COUNT=5;

	      //보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	      int pageNum=1;

	      //페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	      String strPageNum=request.getParameter("pageNum");
	      //만일 페이지 번호가 파라미터로 넘어 온다면
	      if(strPageNum != null){
	         //strPageNum이 String type이기 때문에 정수 타입 데이터로 바꿔서 보여줄 페이지 번호로 지정한다.
	         pageNum=Integer.parseInt(strPageNum);
	      }   
	      
	      //보여줄 페이지의 시작 ROWNUM
	      int startRowNum = 1 + (pageNum-1)*PAGE_ROW_COUNT;
	      //보여줄 페이지의 끝 ROWNUM
	      int endRowNum = pageNum*PAGE_ROW_COUNT;
	      
	      CafeDto dto=new CafeDto();
	      dto.setStartRowNum(startRowNum);
	      dto.setEndRowNum(endRowNum);
		   
	      return cafeDao.getList(dto);
	     
	      
	}

	@Override
	public List<ClassCafeDto> getClassCafeList(HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
	      final int PAGE_ROW_COUNT = 5;
	      //하단 페이지를 몇개씩 표시할 것인지
	      final int PAGE_DISPLAY_COUNT=5;

	      //보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	      int pageNum=1;

	      //페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	      String strPageNum=request.getParameter("pageNum");
	      //만일 페이지 번호가 파라미터로 넘어 온다면
	      if(strPageNum != null){
	         //strPageNum이 String type이기 때문에 정수 타입 데이터로 바꿔서 보여줄 페이지 번호로 지정한다.
	         pageNum=Integer.parseInt(strPageNum);
	      }   
	      
	      //보여줄 페이지의 시작 ROWNUM
	      int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	      //보여줄 페이지의 끝 ROWNUM
	      int endRowNum=pageNum*PAGE_ROW_COUNT;
	      
		      ClassCafeDto dto=new ClassCafeDto();
		      dto.setStartRowNum(startRowNum);
		      dto.setEndRowNum(endRowNum);
		
	      //게시글 목록을 select 해 온다.(검색 키워드가 있는경우 키워드에 부합하는 전체 글) 
	      return classCafeDao.getList(dto);

	}

	@Override
	public List<GalleryDto> getGalleryList(HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
	      final int PAGE_ROW_COUNT = 3;

	      //보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	      int pageNum=1;

	      //페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	      String strPageNum=request.getParameter("pageNum");
	      //만일 페이지 번호가 파라미터로 넘어 온다면
	      if(strPageNum != null){
	         //strPageNum이 String type이기 때문에 정수 타입 데이터로 바꿔서 보여줄 페이지 번호로 지정한다.
	         pageNum=Integer.parseInt(strPageNum);
	      }   
	      
	      //보여줄 페이지의 시작 ROWNUM
	      int startRowNum = 1 + (pageNum-1)*PAGE_ROW_COUNT;
	      //보여줄 페이지의 끝 ROWNUM
	      int endRowNum = pageNum*PAGE_ROW_COUNT;
		
	      //GalleryDto 객체에 startRowNum과 endRowNum을 담는다.
	      GalleryDto galleryDto = new GalleryDto();
	      galleryDto.setStartRowNum(startRowNum);
	      galleryDto.setEndRowNum(endRowNum);

	      //파일 목록을 select 해 온다.(검색 키워드가 있는경우 키워드에 부합하는 전체 글) 
	      return galleryDao.getList(galleryDto);
	      

	}
}
