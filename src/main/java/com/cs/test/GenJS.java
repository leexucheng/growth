package com.cs.test;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class GenJS {

	public void genPlace(){
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("classpath:spring/spring-core.xml");
		DriverManagerDataSource bean = (DriverManagerDataSource)ac.getBean("dataSource");
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		
		try {
			Connection con = bean.getConnection();
			String sql = "select provinceID,province,0 from hat_province";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				String id = rs.getString(1);
				String name = rs.getString(2);
				String parentId = rs.getString(3);
				
				System.out.println(id+"  "+name+"  "+parentId);
				
				Map<String,String> map = new HashMap<String,String>();
				map.put("id", id);
				map.put("name", name);
				map.put("parentId", parentId);
				map.put("lvl", "1");
				
				list.add(map);
			}
			writeDoc(list);
			rs.close();
			ps.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void writeDoc(List<Map<String,String>> list){
		String line = "";
		try {
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("g:/place.js"),"utf8"));
			for(Map<String,String> map: list){
				if(line.length() > 0){
					bw.write(",");
					bw.newLine();
				}
				
				line = "{id:"+map.get("id")+",name:'"+map.get("name")+"',parentId:'"+map.get("parentId")+"',lvl:"+map.get("lvl")+"}";
				
				bw.write(line);
			}
			bw.flush();
			bw.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public static void main(String[] args) {
		new GenJS().genPlace();
	}
}
