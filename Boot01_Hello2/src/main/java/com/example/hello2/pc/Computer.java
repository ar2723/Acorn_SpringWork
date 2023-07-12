package com.example.hello2.pc;

public class Computer {
	private Cpu cpu;
	
	//생성자
	public Computer(Cpu cpu) {
		this.cpu = cpu;
	}
	
	public void action() {
		System.out.println("Computer가 동작합니다.");
	}
}
