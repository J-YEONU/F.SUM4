package com.kh.sum.myPage.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.sum.myPage.model.vo.MyQnA;

@Mapper
public interface MyBookingMapper {

	int selectMyQnACount();

	List<MyQnA> selectAll(RowBounds rowBounds, int loginMemberNo);

	int selectMyBookingCount(int loginMemberNo);

}
