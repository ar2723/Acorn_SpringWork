package com.gura.spring04.file.view;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import com.gura.spring04.file.dto.FileDto;

/*
 * [ View를 만들어서 동작시키는 방법 ]
 * - AbsctractView 추상 클래스를 상속받아서 클래스를 정의한다.
 * - @Component("bean의 이름 지정") 어노테이션을 붙여서 이름이 있는 bean이 되게 한다.
 * - servlet-context.xml 에 BeanNameViewResolver 설정을 추가한다.
 * 
 */
// component scan을 통해서 bean이 될 수 있도록
@Component("fileDownView")
public class FileDownView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
		  HttpServletResponse response) throws Exception {
	      /*
	       *   ModelAndView 객체에  addObject( ) 해서 담아서 전달한 정보는
	       *   Map 객체를 통해서 아래와 같이 다운로드 하려는 파일의 정보를 추출할 수 있다. 
	       */
	      FileDto dto=(FileDto)model.get("dto");

	      //파일의 정보를 dto로부터 추출해서 다운로드 하는 작업을 진행한다.
	      long fileSize=dto.getFileSize();
	      String orgFileName=dto.getOrgFileName();
	      String saveFileName=dto.getSaveFileName();
	      
	      //다운로드를 진행할 파일이 존재하는 실제 경로 구성하기(업로드와 동일) 
	      // File.separator 는 window 에서는 \ , linux 에서는 /  를 얻어오게 된다. 
	      String path=request.getServletContext().getRealPath("/resources/upload")+
	                  File.separator+saveFileName;
	      //다운로드할 파일에서 읽어들일 스트림 객체 생성하기
	      FileInputStream fis=new FileInputStream(path);
	      //다운로드 시켜주는 작업을 한다. (실제 파일 데이터와 원본파일명을 보내줘야한다.)
	      
	      //한글 파일명 세부처리 
	      String encodedName=URLEncoder.encode(orgFileName, "utf-8");
	      // 파일명에 공백이있는 경우 처리 
	      encodedName=encodedName.replaceAll("\\+"," ");
	      
	      
	      // 응답 헤더 정보 설정
	      response.setHeader("Content-Disposition","attachment;filename="+encodedName);
	      response.setHeader("Content-Transfer-Encoding", "binary");
	      
	      // 다운로드할 파일의 크기 읽어와서 다운로드할 파일의 크기 설정
	      response.setContentLengthLong(fileSize);
	      
	      // 클라이언트에게 출력할수 있는 스트림 객체 얻어오기
	      // response.getOutputStream() 메소드는 클라이언트에게 출력할수 있는 OutputStream 객체를 반환한다.
	      BufferedOutputStream bos=
	         new BufferedOutputStream(response.getOutputStream());
	      //한번에 최대 1M byte 씩 읽어올수 있는 버퍼
	      byte[] buffer=new byte[1024*1024];
	      int readedByte=0;
	      //반복문 돌면서 출력해주기
	      while(true){
	         //byte[] 객체를 이용해서 파일에서 byte 알갱이 읽어오기
	         readedByte = fis.read(buffer);
	         if(readedByte == -1) break; //더이상 읽을 데이터가 없다면 반복문 빠져 나오기
	         //읽은 만큼 출력하기
	         bos.write(buffer, 0, readedByte);
	         bos.flush(); //출력
	      }
	      //FileInputStream 닫아주기 
	      fis.close();   
	}
	
}