package com.kh.sum.cinema.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cinema {
    
    private int cinemaNo;
    
    private String cinemaName;
    
    private int cinemaPhone;
    
    private String cinemaImg;

    private String cinemaLocal;
    
    private String cinemaAddress;
    
    private String cinemaContent;
    
    private int cinemaSeatCount;
    
    private String Status;
    
    private int movieNo;
    
    private int memberNo;
    
    private Date createDate;
    
    private double mapX;
    
    private double mapY;

}
