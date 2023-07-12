package com.example.aop;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import com.example.aop.aspect.MessengerAspect;
import com.example.aop.util.MemberService;
import com.example.aop.util.Messenger;

@Configuration
@EnableAspectJAutoProxy
public class JavaConfig {
	
	//Messenger 객체를 bean으로 만들기
	@Bean
	public Messenger myMessenger() {
		return new Messenger();
	}
	
	//MessengerAspect 객체를 bean으로 만들기
	//MessengerAspect에서 @Component 어노테이션을 선언하는 것 대신에 해주는 작업이다.
	@Bean
	public MessengerAspect msa() {
		return new MessengerAspect();
	}
	
	@Bean
	public MemberService memberService() {
		return new MemberService();
	}
}
