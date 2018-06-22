package com.cs.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class EasyPager<T> {

	private String total;
	
	private List<T> rows;
	
	private Integer currentPage;
	
	private Integer pageSize;
	
	private List<T> footer;

	public List<T> getFooter() {
		return footer;
	}

	public void setFooter(List<T> footer) {
		this.footer = footer;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
	/**
	 * easyui 分页请求信息为：page 当前页，rows 一页多少行{page:,rows:10}
	 * @param req
	 */
	public void wrapPageinfoFromRequest(HttpServletRequest req){
		String page = req.getParameter("page") == null?"0":req.getParameter("page");
		String rows = req.getParameter("rows") == null?"0":req.getParameter("rows");
		
		this.setCurrentPage(Integer.valueOf(page));
		this.setPageSize(Integer.valueOf(rows));
	}
	
	public Integer calcStart(){
		return (this.getCurrentPage()-1) * this.getPageSize();
	}
}
