package com.cs.common;

import java.io.File;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.DigestUtils;

import com.cs.dao.DbsUserMapper;

public class AppUtil {

	public static <T> T getDao(String name,Class<T> t){
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("classpath:spring/spring-core.xml");
		
		T dao = ac.getBean(name,t);
		
		return dao;
	}
	
	public static String encodeMD5(String source){
		try {
			return DigestUtils.md5DigestAsHex(source.getBytes("utf8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String uuid(){
		return UUID.randomUUID().toString();
	}
	
	public static String getLongTimeString(){
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return df.format(new Date());
	}
	
	public static boolean isBlank(String str){
		return str == null || "".equals(str);
	}
	
	public static boolean isNotBlank(String str){
		return str != null && !"".equals(str);
	}
	
	public static BigDecimal getBigDecimal(String str){
		if(isNotBlank(str)){
			return new BigDecimal(str);
		}else{
			return new BigDecimal("0");
		}
	}
	
	public static boolean isNotBlank(Integer str){
		return str != null;
	}
	
	public static void createDirs(File f){
		if(!f.exists()){
			f.mkdirs();
		}
	}
	
	public static Map<String, Object> wrapParam(HttpServletRequest req){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Enumeration<String> enu = req.getParameterNames();
		
		while(enu.hasMoreElements()){
			String name = enu.nextElement();
			
			String[] vals = req.getParameterValues(name);
			
			if(name.endsWith("[]")){
				List<String> list = new ArrayList<String>();
				for(String val:vals){
					list.add(val);
				}
				map.put(name.replace("[]", ""), list);		
			}else{
				map.put(name, vals[0]);
			}
		}
		
		return map;
	}
	
	public static String getCurrentUser(){
		UserDetails userDetails = 
				(UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return userDetails.getUsername();
	}
	
	public static void info(String str){
		System.out.println(str);
	}
	
	public static Double toFixed(Double d,int i){
		Double a = d * Math.pow(10, i);
		return Math.round(a) / Math.pow(10, i);
	}
	
	public static void main(String[] args) {
//		System.out.println(getLongTimeString());
//		System.out.println(toFixed(36.8D,1));
		
		/*DbsUserMapper dao = AppUtil.getDao("dbsUserMapper", DbsUserMapper.class);
		System.out.println(dao);*/
		
		System.out.println(new Date().getTime()/1000);
		
	}
}
