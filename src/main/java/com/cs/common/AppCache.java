package com.cs.common;

import java.util.HashMap;
import java.util.Map;

public class AppCache {

	public static Map<String,String> cache = new HashMap<String,String>();
	
	/**
	 * ��Ϣ ����
	 * {23@32:List<DbsTaskReplay>}
	 */
	public static Map<String,Object> replyMap = new HashMap<String,Object>();	
	
	/**
	 * {23@32:1/0}
	 */
	public static Map<String,Integer> stateMap = new HashMap<String,Integer>();	
	
	/**
	 * {13305630001:8888-14983777384882}
	 * {�ֻ���:�����-ʱ���}
	 */
	public static Map<String,String> randCodeMap = new HashMap<String,String>();	
	
	public static void addToken(String key,String value){
		cache.put(key, value);
	}
	
	public static String getToken(String key){
		return cache.get(key);
	}
}
