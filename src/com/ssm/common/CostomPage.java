package com.ssm.common;

import java.util.List;

/**
 *  原生分页实体对象。 -》 Page
 * */
public class CostomPage<T> {
	// 当前页码
	private Integer currentPage = 1;
	// 一页容量
	private Integer pageSize = 4;
	// 数据表总容量
	private Long totalCount;  
	// 总页数
	private Integer totalPage;
	// 分页结果集
	private List<T> resultList;
	
	
	public Integer getTotalPage() {
		if(this.totalCount % this.pageSize == 0 ) {
			return (int) (this.totalCount / this.pageSize); 
		}
		return (int) ((this.totalCount / this.pageSize) +1) ;
	}
	public Integer startPage(){
		return (this.currentPage-1)*this.pageSize;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
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
	public Long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}
	
	public List<T> getResultList() {
		return resultList;
	}
	public void setResultList(List<T> resultList) {
		this.resultList = resultList;
	}
	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", resultList=" + resultList + "]";
	}
	
}	
