package com.kh.sum.ticketing.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sum.common.util.PageInfo;
import com.kh.sum.ticketing.model.mapper.TicketingMapper;
import com.kh.sum.ticketing.model.vo.TicketMovie;

@Service
public class TicketingServiceImpl implements TicketingService {
    
    @Autowired
    private TicketingMapper mapper;
    
    @Override
    public int selectCount() {
        
        return mapper.selectCount();
    }

    @Override
    public List<TicketMovie> getTicketMovie(PageInfo pageInfo) {
        int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit); 
        
        return mapper.selectAll(rowBounds);
    }


}
