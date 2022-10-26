package com.kh.sum.myPage.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sum.common.util.PageInfo;
import com.kh.sum.member.model.vo.Member;
import com.kh.sum.movie.model.mapper.MovieDetailMapper;
import com.kh.sum.movie.model.vo.Comments;
import com.kh.sum.myPage.model.mapper.MyBookingMapper;
import com.kh.sum.myPage.model.mapper.MyPageMapper;
import com.kh.sum.myPage.model.mapper.MyQnAMapper;
import com.kh.sum.myPage.model.vo.MyQnA;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	
	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private MyQnAMapper qnaMapper;
	
	@Autowired
	private MyBookingMapper bookingMapper;
	
	@Autowired
	private MovieDetailMapper movieDetailMapper;
	

	@Override
	public int selectCount() {
		
		return mapper.selectCount();
	}

	
	// 예매
	@Override
	public int getBookingCount(int loginMemberNo) {

		return bookingMapper.selectMyBookingCount(loginMemberNo);
	}

	@Override
	public List<MyQnA> getBookingList(PageInfo pageInfo, int loginMemberNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);			
		
		return bookingMapper.selectAll(rowBounds, loginMemberNo);
	}
	
	
	
	// 문의내역
	@Override
	public int getQnACount(int loginMemberNo) {
		
		return qnaMapper.selectMyQnACount(loginMemberNo);
	}

	@Override
	public List<MyQnA> getQnAList(PageInfo pageInfo, int loginMemberNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);			
		
		return qnaMapper.selectAll(rowBounds, loginMemberNo);
	}
	
	

    @Override
    @Transactional
    public int save(MyQnA qna) {
     int result = 0;
        
        if(qna.getNo() != 0) {

        } else {
            // insert
            result = qnaMapper.insertQnA(qna);
        }
        
        return result;
    }

    @Override
    public MyQnA findQnAByNo(int no) {
        
        return qnaMapper.selectQnAByNo(no);
    }

	@Override
	public Member findMemberById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	// 한줄평
	@Override
	public int getCommentsCount(String loginMemberId) {

		return movieDetailMapper.selectCommentsCount(loginMemberId);
	}


	@Override
	public List<Comments> getCommentsList(PageInfo pageInfo, String loginMemberId) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);			
		
		return movieDetailMapper.selectAll(rowBounds, loginMemberId);
	}


    
}
