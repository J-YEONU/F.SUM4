package com.kh.sum.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.member.model.vo.Member;
import com.kh.sum.myPage.model.service.MyPageService;
import com.kh.sum.myPage.model.vo.MyQnA;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qna")
public class QnAController {
   
    @Autowired
    private MyPageService service;
    
    
    @GetMapping("/qna")
    public String qna() {
        log.info("1:1문의 페이지 요청");
        
        return "/qna/qna";
    }
    
    
    @PostMapping("/qna")
    public ModelAndView qnaWrite(ModelAndView model,
            @ModelAttribute MyQnA qna,
            @SessionAttribute("loginMember") Member loginMember) {
        
        int result = 0;
        
        qna.setMemberNo(loginMember.getNo());
        result = service.save(qna);
        
        if(result > 0) {
            model.addObject("msg", "문의가 정상적으로 등록되었습니다.");
            // 등록 성공 시 마이페이지 문의내역으로 리턴되게 수정할 것 
            model.addObject("location", "/qna/qna");
        } else {
            model.addObject("msg", "문의 등록을 실패하였습니다.");
            model.addObject("location", "/qna/qna");
        }
        
        model.addObject("result", result);
        model.setViewName("common/msg");
        
        return model;
    }
   
}
