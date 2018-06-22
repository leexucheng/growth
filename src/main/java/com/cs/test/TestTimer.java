package com.cs.test;

import java.util.Timer;
import java.util.TimerTask;


public class TestTimer {

	Timer t = null;
	TimerTask tt = null;
	
	public void test1(){
		t = new Timer();
		final Integer c = 1000;
		
		TimerTask t1 = new TimerTask() {
			Integer b = c;
			@Override
			public void run() {
				b--;
				synchronized(b){
					System.out.println(b);
				}
				if(b < 995){
					t.cancel();
				}
			}
		};
		
		t.schedule(t1, 5000,2000);
		
	}
	
	public void executeTask(){
		new TimerTask() {
			@Override
			public void run() {
				
			}
		};
	}
	
	
	public static void main(String[] args) {
		new TestTimer().test1();
	}
	
}
