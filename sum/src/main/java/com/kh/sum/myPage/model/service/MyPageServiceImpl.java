package com.kh.sum.myPage.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sum.common.util.PageInfo;
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

	@Override
	public int selectCount() {
		
		return mapper.selectCount();
	}

	@Override
	public int getQnACount() {
		
		return qnaMapper.selectMyQnACount();
	}

	@Override
	public List<MyQnA> getQnAList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);			
		
		return qnaMapper.selectAll(rowBounds);
	}

	@Override
	public int getBookingCount() {

		return bookingMapper.selectMyBookingCount();
	}

	@Override
	public List<MyQnA> getBookingList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);			
		
		return bookingMapper.selectAll(rowBounds);
	}

    @Override
    public int save(MyQnA qna) {
     int result = 0;
        
        if(qna.getNo() != 0) {

        } else {
            // insert
            result = qnaMapper.insertQnA(qna);
        }
        
        return result;
    }

}
