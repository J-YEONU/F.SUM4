package com.kh.sum.ticketing.model.service;

import java.util.List;

import com.kh.sum.common.util.PageInfo;
import com.kh.sum.ticketing.model.vo.TicketMovie;

public interface TicketingService {

    int selectCount();

    List<TicketMovie> getTicketMovie(PageInfo pageInfo);



}
