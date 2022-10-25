package com.kh.sum.myPage.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.sum.myPage.model.vo.MyQnA;

@Mapper
public interface MyQnAMapper {

	int selectMyQnACount();

	List<MyQnA> selectAll(RowBounds rowBounds);

    int insertQnA(MyQnA qna);

    MyQnA findQnAByNo(@Param("no")int no);

	MyQnA selectQnAByNo(int no);

}
