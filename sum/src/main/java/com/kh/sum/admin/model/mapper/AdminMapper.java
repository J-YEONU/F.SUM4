package com.kh.sum.admin.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.sum.admin.model.vo.MovieTime;
import com.kh.sum.admin.model.vo.Notice;
import com.kh.sum.cinema.model.vo.Cinema;
import com.kh.sum.member.model.vo.Member;
import com.kh.sum.movie.model.vo.MovieList;
import com.kh.sum.myPage.model.vo.MyQnA;

@Mapper
public interface AdminMapper {

	// 회원 관련 맵퍼
	
	int selectMemberCount();

	List<Member> selectMemberAll(RowBounds rowBounds);

	Member selectMemberAll(int no);
	
	int deleteMember(int no);
	
	Member selectMemberChange(int no);
	
	int changeTheAdmin(int no);

	// 1:1 문의 사항 맵퍼
	
	int selectInquiryCount();

	List<MyQnA> selectInquiryAll();

	int insertMovie(MovieList movieList);

	int inquiryUpdate(@Param("no")int no, MyQnA qna);
	
	int qnaUpdateStatus(@Param("no")int no, @Param("status") String string);
	
	// 공지 사항 관련 맵퍼
	
	int updateNotice(Notice notice);

	int insertNotice(Notice notice);

	List<Notice> selectNoticeList();

	int selectNoticeCount();

	Notice selectNoticeByNo(@Param("no") int no);

	MyQnA selectQnAByNo(@Param("no")int no);

    int inquiryUpdate(MyQnA qna);
    
    int save(Notice notice);

	int noticeDeleteStatus(@Param("no")int no, @Param("status")String string);

	int updateReadCount(int no);
	
	// 영화관
	
    int insertCinema(Cinema cinema);
    
    int save(Cinema cinema);

	int insertMovieTime(MovieTime movieTime);



    
    
    



}
