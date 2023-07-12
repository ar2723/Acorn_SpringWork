package com.example.aop.aspect;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

/*
 *    -Aspectj Expression
 *    1. execution(* *(..)) 
 *    	 => 리턴 type과 상관없이 접근 가능한 모든 메소드가 point cut
 *    	 두번째 * 표시는 메소드의 모양을 가리키는 데 
 *    	 (package name.class name.method name) 이렇게 모두 작성할 수 있다.
 *    
 *    2. execution(* test.service.*.*(..)) 
 *       => 리턴 type과 상관없이 test.service 패키지에 있는 모든 클래스의 모든 메소드가 point cut이 된다.
 *       
 *    3. execution(void insert*(..))
 *       => 리턴 type이 void이고 메소드명이 insert로 시작하는 모든 메소드가 point cut
 *       
 *    4. execution(* delete*(*))
 *       => 리턴 type과 상관없이 메소드 명이 delete로 시작하고 
 *       	인자로 1개 전달받는 메소드가 point cut (AOP 가 적용되는 위치)
 *       
 *    5. execution(* delete*(*, *))
 *       => 리턴 type과 상관없이 메소드 명이 delete로 시작하고 
 *       	인자로 2개 전달받는 메소드가 point cut (AOP 가 적용되는 위치)
 *       
 *    6. execution(String update*(Integer, *))
 *       => 리턴 type이 String이며 메소드 명이 update로 시작하고 메소드의 첫번째 인자는 Integer type, 
 *       	두번째 인자는 아무 type으로 받는 메소드가 point cut (AOP 가 적용되는 위치)
 */

@Aspect
@Component // bean으로 만들기 위한 어노테이션
public class WritingAspect {
	/*
	 * spring이 관리하는 bean의 메소드가 수행되기 이전에(Before) 적용되는 Aspect
	 * [ 메소드의 pattern ]
	 * 리턴 type => void
	 * 메소드명 => write로 시작하는 메소드
	 * 메소드의 매개변수 => 없음
	 * 
	 * Aspect가 적용되는 위치를 "point cut"이라고 부른다.
	 * 
	 * 아래와 같이 비즈니스 로직이 아닌 반복되는 메소드를 횡단 관심사라고 하며, 따로 작성해두고 활용할 수 있다.
	 */
	@Before("execution(void write*())")
	public void prepare() {
		System.out.println("파란색 Pen을 준비해요!");
	}
	
	@After("execution(void write*())")
	public void end() {
		System.out.println("Pen을 닫고 마무리 해요!");
	}
}
