package com.kh.sum.myPage.model.service;

import java.util.List;

import com.kh.sum.common.util.PageInfo;
import com.kh.sum.myPage.model.vo.MyQnA;

public interface MyPageService {

	int selectCount();

	int getQnACount();
	
	List<MyQnA> getQnAList(PageInfo pageInfo);

	int getBookingCount();

	List<MyQnA> getBookingList(PageInfo pageInfo);

    int save(MyQnA qna);

    MyQnA findQnAByNo(int no);

}
