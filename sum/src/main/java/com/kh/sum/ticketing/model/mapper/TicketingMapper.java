package com.kh.sum.ticketing.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.sum.ticketing.model.vo.TicketMovie;

@Mapper
public interface TicketingMapper {
    int selectCount();

    List<TicketMovie> selectAll(RowBounds rowBounds);



}
