package com.kh.sum.admin.model.service;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import com.kh.sum.admin.model.vo.MovieTime;
import com.kh.sum.admin.model.vo.Notice;
import com.kh.sum.cinema.model.vo.Cinema;
import com.kh.sum.common.util.PageInfo;
import com.kh.sum.member.model.vo.Member;
import com.kh.sum.movie.model.vo.MovieList;
import com.kh.sum.myPage.model.vo.MyQnA;

public interface AdminService {

	// 회원 관련 서비스
	
	int getMemberCount();
	
	List<Member> getMemberList(PageInfo pageInfo);
	
	Member findMemberByNo(int no);
	
	int deleteMember(int no);
	
	Member memberDetail(int no);
	
	int save(int no);
	
	// 1:1 문의 사항 서비스
	
	int getInquiryCount();
	
	List<MyQnA> getInquiryList(PageInfo pageInfo);
	
	int save(MyQnA qna);

	// 영화 관련 서비스
	
	int save(MovieList movieList);

	// 공지사항 관련 서비스 
	
	int save(Notice notice);

	List<Notice> getNoticeList(PageInfo pageInfo);

	int getNoticeCount();

	Notice findNoticeByNo(int no);
	
	MyQnA findQnAByNo(int no);

	int delete(int no);

	int NoticeDelete(int no);

	int updateReadCount(int no);
	
	// 영화관 
	
    int save(Cinema cinema);

	int save(MovieTime movieTime);



	


}
