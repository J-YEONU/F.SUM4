package com.kh.sum.cinema.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.sum.cinema.model.vo.Cinema;

@Mapper
public interface CinemaMapper {
	List<Cinema> selectCinemaS();
	List<Cinema> selectCinemaGG();
	List<Cinema> selectCinemaIC();
	List<Cinema> selectCinemaGW();
	List<Cinema> selectCinemaD();
}
