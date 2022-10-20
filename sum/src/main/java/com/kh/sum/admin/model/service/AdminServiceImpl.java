package com.kh.sum.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sum.admin.model.mapper.AdminMapper;
import com.kh.sum.admin.model.vo.Notice;
import com.kh.sum.common.util.PageInfo;
import com.kh.sum.member.model.vo.Member;
import com.kh.sum.movie.model.vo.MovieList;
import com.kh.sum.myPage.model.vo.MyQnA;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public int getMemberCount() {

		return mapper.selectMemberCount();
	}

	@Override
	public List<Member> getMemberList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectMemberAll(rowBounds);
	}

	@Override
	public Member findMemberByNo(int no) {

		
		return mapper.selectMemberAll(no);
	}

	@Override
	public int getInquiryCount() {

		return mapper.selectInquiryCount();
	}

	@Override
	public List<MyQnA> getInquiryList(PageInfo pageInfo) {

		return mapper.selectInquiryAll();
	}

	@Override
	public MyQnA findQnAByNo(int no) {
		
		return mapper.selectQnAByNo(no);
	}
	
	@Override
	@Transactional
	public int delete(int no) {
		int result = 0;
		
		result = mapper.qnaUpdateStatus(no, "N");
		
		return result;
	}

	@Override
	@Transactional
    public int save(MovieList movieList) {
        int result = 0;
        
        if(movieList.getMovieNo() != 0) {
            // update
        } else {
            // insert
            result = mapper.insertMovie(movieList);
        }
        
        return result;
    }

	
	// =============== 공지사항 =================
	
	@Override
	@Transactional
	public int save(Notice notice) {
		int result = 0;
		
		if (notice.getNoticeNo() != 0) {
			// update
			result = mapper.updateNotice(notice);
			
		} else {
			// insert * 추상메소드의 아이디와 동일한 메소드를 만들어 줘야한다. (쿼리문)
			result = mapper.insertNotice(notice);
		}
		return result;
	}

	@Override
	public List<Notice> getNoticeList(PageInfo pageInfo) {

		return mapper.selectNoticeList();
	}

	@Override
	public int getNoticeCount() {

		return mapper.selectNoticeCount();
	}

	@Override
	public Notice findNoticeByNo(int no) {

		return mapper.selectNoticeByNo(no);
	}

    @Override
    @Transactional
    public int save(MyQnA qna) {
        int result = 0;
        
        if (qna.getNo() != 0) {
            // update
            result = mapper.inquiryUpdate(qna);
            
        } else {
            // insert 필요 시 추가
        }
        return result;
    }


}
