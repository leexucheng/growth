package com.cs.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cs.common.PagerUtil;

public class DataTest {

	public void selectData(){
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("classpath:spring/spring-core.xml");
		
		SqlSessionTemplate t = ac.getBean("sqlSessionTemplate",SqlSessionTemplate.class);
		
		Map<String,Object> map = new HashMap<String,Object>();
		List<String> status = new ArrayList<String>();
		List<String> infoTypes = new ArrayList<String>();
		status.add("0");
		status.add("1");
		infoTypes.add("WD");
		infoTypes.add("JJ");
		map.put("orderBy", "create_time desc");
		map.put("status", status);
		map.put("infoTypes", infoTypes);
		
		//map.put("keyWord", "Œ“");
		
		map.put("start", 0);
		map.put("size", 10);
		
		PagerUtil.setResultType("record", map);
		
		List<Map<String,Object>> list = t.selectList("selectTaskListByPager", map);
		
		
		System.out.println(list.get(0).get("recordSize") + "    "+list.get(0).get("headImg")+ "    "+list.get(0).get("isCorp"));
	}
	
	public static void main(String[] args) {
		new DataTest().selectData();
	}
}
