package com.kh.sum.myPage.model.service;

import java.util.List;

import com.kh.sum.common.util.PageInfo;
import com.kh.sum.member.model.vo.Member;
import com.kh.sum.movie.model.vo.Comments;
import com.kh.sum.myPage.model.vo.MyQnA;

public interface MyPageService {

	int selectCount();

	// 예매
	int getBookingCount(int loginMemberNo);
	
	List<MyQnA> getBookingList(PageInfo pageInfo, int loginMemberNo);
	
	
	// 문의내역
	int getQnACount(int loginMemberNo);
	
	List<MyQnA> getQnAList(PageInfo pageInfo, int loginMemberNo);


    int save(MyQnA qna);

    MyQnA findQnAByNo(int no);

	Member findMemberById(String id);

	// 한줄평
	int getCommentsCount(String loginMemberId);

	List<Comments> getCommentsList(PageInfo pageInfo, String loginMemberId);

}
