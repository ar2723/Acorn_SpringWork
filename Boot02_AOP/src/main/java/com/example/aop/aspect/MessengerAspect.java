package com.example.aop.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class MessengerAspect {
	@Around("execution(void send*(..))")
	public void checkGreeting(ProceedingJoinPoint joinPoint) throws Throwable {
		//메소드에 전달된 인자들 목록을 얻어내기
		Object[] args = joinPoint.getArgs();
		for(Object tmp:args) {
			//만일 String type이면
			if(tmp instanceof String) {
				//원래 type으로 casting
				String msg = (String) tmp;
				System.out.println("aspect에서 읽어낸 내용: "+msg);
				if(msg.contains("친구")) {
					System.out.println("친구는 금지된 단어입니다.");
					return; //메소드를 끝내기
				}
			}
		}
		
		//aspect가 적용된 메소드가 호출되기 이전에 할 작업은 proceed() 호출 전에 한다.
		
		//proceed()를 호출해야 aspect가 적용된 메소드가 실행이 된다.
		//만약에 이 메소드가 위에서 특정 조건에 의해 리턴되어 호출이 되지 않는다면, sendGreeting() 내부의 코드가 실행되지 않는다.
		//이러한 joinPoint 객체는 around 어노테이션에서만 사용할 수 있다.
		joinPoint.proceed();
		
		//aspect가 적용된 메소드가 호출되기 직전에 할 작업은 proceed() 호출 이후에 한다.
		System.out.println("aspect가 적용된 메소드가 리턴 했습니다.");
	}
	/*
	 * return type은 String이며 get으로 시작하는 메소드이고 메소드에 전달하는 인자는 없다.
	 * java.lang 패키지에 있는 type은 패키지명 생략가능하다. 다시 말하면, 사용자가 별도로 선언한 클래스 데이터 타입은
	 * 타입을 명시할 경우에 패키지 명을 반드시 입력해주어야 한다.
	 * around 어노테이션이 붙은 aspect는 호출전부터 호출 후에 리턴되는 후까지 모두 개입할 수 있다.
	 */
	@Around("execution(String com.example.aop.util.*.get*())")
	public Object checkReturn(ProceedingJoinPoint joinPoint) throws Throwable {
		
		//aspect가 적용된 메소드를 수행하고 리턴되는 데이터 받아오기
		Object obj = joinPoint.proceed();
		
		//원래 type으로 casting 해서 조사해볼수가 있다.
		String a = (String)obj;
		
		// 조사 후 아예 다른 값을 리턴해줄 수도 있다.
		// 만약에 조사 후에 정상적으로 리턴을 해주고 싶은 경우에는 return obj;라고 작성해주면 된다.
		return "놀자 놀자";
	}
}	
