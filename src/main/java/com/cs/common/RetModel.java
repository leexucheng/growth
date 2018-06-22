package com.cs.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RetModel<T> {

	private String code;	//error code ,
	
	private String msg;		//	ok or exception description
	
	private List<T> datas;	//result is a list 
	
	private T model;	//result is a object
	
	private Map<String,Object> attr = new HashMap<String,Object>();
	

	public RetModel() {
		this.code = "0";
		this.msg = "ok";
	}
	
	public Map<String, Object> getAttr() {
		return attr;
	}

	public void setAttr(Map<String, Object> attr) {
		this.attr = attr;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

	public T getModel() {
		return model;
	}

	public void setModel(T model) {
		this.model = model;
	}
	
	public RetModel<T> setException(RetModel<T> t,String code,String msg){
		t.setCode(code);
		t.setMsg(msg);
		return t;
	}
}
