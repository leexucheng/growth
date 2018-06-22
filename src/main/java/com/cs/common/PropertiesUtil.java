package com.cs.common;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class PropertiesUtil {

	public static Properties getProperties(String cfg){
		Properties p = new Properties();
		InputStream is = PropertiesUtil.class.getClassLoader().getResourceAsStream(cfg);
		try {
			p.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return p;
	}
	
	/**
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static String getKey(String cfg,String key,String defaultValue){
		return getProperties(cfg).getProperty(key,defaultValue);
	}
	
	public static void main(String[] args) {
		String a = getProperties("appcfg.properties").getProperty("PROMOTION.SUMMARY","0");
		try {
			System.out.println(new String(a.getBytes("iso-8859-1"),"utf8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
