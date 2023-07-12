package com.example.hello2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import com.example.hello2.pc.Computer;
import com.example.hello2.util.Remocon;

@SpringBootApplication
public class Boot01Hello2Application {
	
	public static void main(String[] args) {
		//run() 메소드가 리턴해주는 ApplicationContext 객체의 참조값을 변수에 담고
		ApplicationContext ctx = SpringApplication.run(Boot01Hello2Application.class, args);
		//해당 객체로부터 Car type 객체 얻어내기 (객체는 하나만 생성된다)
		Car car1 = ctx.getBean(Car.class);
		car1.drive();
		
		Car car2 = ctx.getBean(Car.class);
		car1.drive();
		
		if(car1 == car2) {
			System.out.println("car1과 car2는 같은 객체를 가리키는 동일한 참조값입니다.");
		}
		//스프링이 관리하는 객체 중에서 Remocon type의 참조값 찾아오기
		//Remocon remocon1 = ctx.getBean(Remocon.class);
		
		//같은 타입의 bean이 여러개 존재하는 경우 아래와 같이 직접 bean의 이름을 얻어와서 사용하게 된다.
		//스프링이 관리하는 객체 중에서 myRemocon이라는 이름의 객체를 얻어와서 원래 type으로 casting 해서 사용하기
		Remocon remocon2 = (Remocon)ctx.getBean("myRemocon");
		remocon2.up();
		remocon2.down();
		
		//스프링이 관리하는 객체 중에서 tvRemocon이라는 이름의 객체를 얻어와서 원래 type으로 casting 해서 사용하기
		Remocon remocon3 = (Remocon)ctx.getBean("tvRemocon");
		remocon3.up();
		remocon3.down();
		
		Computer com1 = ctx.getBean(Computer.class);
		com1.action();
	}
}
