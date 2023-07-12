package com.example.aop.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.example.aop.util.MemberDto;

@Aspect
@Component
public class MemberAspect {
			//리턴 타입 + 인자의 개수나 종류에 상관없이 get으로 시작하는 모든 메소드에 대해 aspect를 적용
	@Around("execution(com.example.aop.util.MemberDto get*(..))")
	public Object checkReturn(ProceedingJoinPoint joinPoint) throws Throwable {
		//aspect가 적용된 메소드를 수행하고 리턴되는 값을(참조값) 받아온다.
		Object obj = joinPoint.proceed();
		//원래 type으로 casting
		MemberDto dto = (MemberDto)obj;
		//필드에 값을 넣어준다.
		dto.setNum(1);
		dto.setName("김구라");
		dto.setAddr("노량진");
		//joinPoint.proceed() 메소드가 리턴한 참조값을 그래도 리턴해준다.
		return dto;
	}
}
