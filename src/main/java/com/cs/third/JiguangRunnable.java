package com.cs.third;

public class JiguangRunnable implements Runnable {

	private String username;
	private String password;
	
	public JiguangRunnable(String username, String password) {
		this.username = username;
		this.password = password;
	}

	@Override
	public void run() {
		new JiGuangUtil().register(this.username,this.password);
	}

}
