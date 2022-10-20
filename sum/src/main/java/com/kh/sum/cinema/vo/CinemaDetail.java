package com.kh.sum.cinema.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CinemaDetail {
    
    private int cinemaNo;
    
    private String cinemaName;
    
    private String cinemaPhone;
    
    private String cinemaImg;

    private String cinemaLocal;
    
    private String cinemaAddress;
    
    private String cinemaContent;
    
    private int cinemaSeatCount;
    
    private String Status;
    
    private int movieNo;
    
    private int memberNo;

}
