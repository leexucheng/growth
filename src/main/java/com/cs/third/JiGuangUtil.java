package com.cs.third;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cs.common.AppCnst;

import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jmessage.api.JMessageClient;
import cn.jmessage.api.common.model.RegisterInfo;

public class JiGuangUtil {
	JMessageClient client = null;
	
	Logger log = LoggerFactory.getLogger(JiGuangUtil.class); 
	
	public JiGuangUtil() {
		this.client = new JMessageClient(MessageUtil.APP_KEY, MessageUtil.MASTER_SECRET);
	}

	public int register(String username,String password){
		
		RegisterInfo user = RegisterInfo.newBuilder()
										.setUsername(username)
										.setPassword(password)
										.build();
		try {
			String response = client.registerUsers(new RegisterInfo[]{user});
			System.out.println("jiguang register resposne :"+response);
			this.updateUserNickname(username);
			return 1;
		} catch (APIRequestException e) {
			log.warn(e.getStatus() + "--jiguang register-- "+e.getMessage());
		} catch(APIConnectionException e ){
			log.warn("jiguang register --- " + e.getMessage());
		}
		return 0;
	}
	
	public void updateUserInfo(){
		try {
			client.updateUserInfo("dbs_user_34", "YH34", null, null, 0, null, null);
		} catch (APIConnectionException e) {
			e.printStackTrace();
		} catch (APIRequestException e) {
			e.printStackTrace();
		}
	}
	
	public void updateUserNickname(String username){
		String nickName = "YH" + username.replace(AppCnst.JIGUNAG_USERNAME_PREX, "");
		try {
			client.updateUserInfo(username, nickName, null, null, 0, null, null);
		} catch (APIConnectionException e) {
			e.printStackTrace();
		} catch (APIRequestException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		new JiGuangUtil().register("dbs_user_35", "dbs_pass_35");
	}
}
