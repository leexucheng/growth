package com.cs.common;

import java.util.Map;

public class PagerUtil {
	
	private int start;
	
	private int size;
	

	public int getStart() {
		return start;
	}



	public void setStart(int start) {
		this.start = start;
	}


	public int getSize() {
		return size;
	}



	public void setSize(int size) {
		this.size = size;
	}



	public static void setResultType(String type,Map<String,Object> map){
		map.put("resultType", type);
		if("count".equals(type)){
			map.remove("start");
			map.remove("size");
			map.remove("orderBy");
		}else if("record".equals(type)){
			
		}
	}
}
