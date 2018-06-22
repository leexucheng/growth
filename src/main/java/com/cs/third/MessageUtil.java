package com.cs.third;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.jiguang.common.ClientConfig;
import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jpush.api.JPushClient;
import cn.jpush.api.push.PushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.Notification;

public class MessageUtil {

	public static String MASTER_SECRET = "20606219ba1f6676361758a5";
	public static String APP_KEY = "c2fdf2fa611e3c348374630d";
	public static int maxRetryTimes = 3;
	
	JPushClient client = null;
	
	Logger LOG = LoggerFactory.getLogger(MessageUtil.class); 
	public MessageUtil() {
		ClientConfig config = ClientConfig.getInstance();
        config.setMaxRetryTimes(5);
        config.setConnectionTimeout(10 * 1000);
		client = new JPushClient(MASTER_SECRET, APP_KEY, null,config);
	}

	public static void sendMsg(){
		
	}
	
	public static void pushMsg(Object o){
		System.out.println("----------Here should implement push message code-----------");
		
	}
	
	public static void pushMsg(Object o1,Object o2){
		System.out.println("----------Here should implement push message code-----------"+o1);
		
	}
	
	/**
	 * 0:list-aliases ,1:string=alert,2:list-tags
	 * @param obs
	 */
	public void pushMsgExtra(Object ... obs){
		List<String> aliases = (List<String>)obs[0];
		String alert = obs[1].toString();
		PushResult result = null;
		try {
			result = client.sendPush(MessageUtil.buildPushObjectAllAliasAlert(aliases,alert,obs[2].toString()));
			System.out.println("result--> " + result); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 public static PushPayload buildPushObjectAllAliasAlert(List<String> aliases,String alert,String msgType) {
		 	return PushPayload.newBuilder()
	                .setPlatform(Platform.all())
	                .setAudience(Audience.alias(aliases))
	                .setNotification(Notification.alert(alert))
	                //.setMessage(Message.newBuilder().setMsgContent(alert).addExtra("msgType", msgType).build())
	                .build();
	    }
	 
	 public static void main(String[] args) {
		 MessageUtil util = new MessageUtil();
		 
		 List<String> aliases = new ArrayList<String>();
		 //aliases.add("dbs_39");
		 //aliases.add("dbs_34");
		 //aliases.add("dbs_10005");
		 aliases.add("dbs_45");
		 String alert = "美国刚刚又背后狠捅一刀把韩国推进火坑";
		 
		 util.pushMsgExtra(aliases,alert,"2");
	}
}
