package com.kh.sum.admin.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.admin.model.service.AdminService;
import com.kh.sum.admin.model.vo.MovieTime;
import com.kh.sum.admin.model.vo.Notice;
import com.kh.sum.cinema.model.vo.Cinema;
import com.kh.sum.common.util.MultipartFileUtil;
import com.kh.sum.common.util.PageInfo;
import com.kh.sum.member.model.vo.Member;
import com.kh.sum.movie.model.vo.MovieList;
import com.kh.sum.myPage.model.vo.MyQnA;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class adminController {

	// 서비스 객체가 존재하지 않으니 서비스 작성
	// 서비스를 빈으로 만들어서 주입을 시켜준다.
	@Autowired
	private	AdminService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	/* 관리자 메인 대시보드 */
	
	@GetMapping("/main")
	public String main() {
		
		return "/admin/main";
	}
	
	
	/* 회원 목록 리스트 */

	@GetMapping("/memberList")
	public ModelAndView memberList(ModelAndView model, 
			@RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<Member> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getMemberCount(), 10);
		list = service.getMemberList(pageInfo);
		
		System.out.println(pageInfo);
		System.out.println(list);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("admin/memberList");
		
		return model;
		
	}
	
	
	@GetMapping("/memberDelete")
	   public ModelAndView memberDelete(ModelAndView model, @RequestParam int no) {
		   int result = 0;
		   
		   result = service.deleteMember(no);
		   
		   if(result > 0) {
			   model.addObject("msg", "회원이 탈퇴 되었습니다.");
			   model.addObject("location", "/admin/memberList");
		   } else {
			   model.addObject("msg", "회원 탈퇴에 실패하였습니다.");
			   model.addObject("location", "/admin/memberDetail?no=" + no);
		   }
		   
		   model.setViewName("common/msg");
		   
		   return model;
	   }
	
	@GetMapping("/memberDetail")
	public ModelAndView memberDetail(ModelAndView model, @RequestParam int no) {
		Member member = null;
		
		member = service.memberDetail(no);
		
		System.out.println(member);
		
		model.addObject("member", member);
		model.setViewName("/admin/memberDetail");
		
		return model;
	}
	
	
	@GetMapping("/memberUpdate")
	public ModelAndView changeTheAdmin(ModelAndView model, @RequestParam int no) {
		int result = 0;
		
		result = service.save(no);
		
		if(result > 0) {
            model.addObject("msg", "관리자로 변경되었습니다.");
            model.addObject("location", "/admin/memberList");
        } else {
            model.addObject("msg", "관리자 변경에 실패하였습니다.");
            model.addObject("location", "/admin/memberList");
        }
        
        model.setViewName("common/msg");
		
		
		return model;
	}
	
	
	/* 1:1 문의 */
	
	@GetMapping("/inquiry")
	public ModelAndView inquiry(ModelAndView model,
		@RequestParam(value = "page", defaultValue = "1") int page) {
			
			List<MyQnA> list = null;
			PageInfo pageInfo = null;
			
			pageInfo = new PageInfo(page, 10, service.getInquiryCount(), 10);
			list = service.getInquiryList(pageInfo);
			
			System.out.println(pageInfo);
			System.out.println(list);
			
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
			
		
		model.setViewName("/admin/inquiry");
		
		return model;
	}
	
	  /* 1:1 문의 답변 페이지*/
	   
	   @GetMapping("/inquiryDetail") 
	   public ModelAndView inquiryDetail(ModelAndView model, @RequestParam int no) {
	       
	       MyQnA qna = null;
	       
	       qna = service.findQnAByNo(no);
	       
	       model.addObject("qna", qna);
	       model.setViewName("/admin/inquiryDetail");
	       
	      return model;
	   }
	
	   /* 1:1 문의 삭제 */
	   
	   @GetMapping("/inquiryDelete")
	   public ModelAndView inquiryDelete(ModelAndView model, @RequestParam int no) {
		   int result = 0;
		   
		   result = service.delete(no);
		   
		   if(result > 0) {
			   model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
			   model.addObject("location", "/admin/inquiry");
		   } else {
			   model.addObject("msg", "게시글 삭제를 실패하였습니다.");
			   model.addObject("location", "/admin/inquiryDetail?no=" + no);
		   }
		   
		   model.setViewName("common/msg");
		   
		   return model;
	   }
	   
	   /* 1:1 문의 답변 (수정)*/
	   
	   @RequestMapping(value = "/inquiryDetail", method = { RequestMethod.POST })
	   public ModelAndView inquiryUpdate(ModelAndView model,
	           @ModelAttribute MyQnA qna, @RequestParam int no) {
	       int result = 0;
	       
	       result = service.save(qna);
           
	       if(result > 0) {
               model.addObject("msg", "문의 답변이 정상적으로 등록되었습니다.");
               model.addObject("location", "/admin/inquiry");
           } else {
               model.addObject("msg", "문의 답변에 실패하였습니다.");
               model.addObject("location", "/admin/inquiryDetail?no=" + qna.getNo());
           }
           
           model.setViewName("common/msg");
	       
	       return model;
	   }
	   
	/* 영화 (영화관 등록, 영화 등록, 영화 시간 등록 ) */

	   @GetMapping("/movie")
	   public String movie() {
	      log.info("영화 등록 페이지 요청");
	      
	      
	      return "/admin/movie";
	   }
	   
	   /* 영화 등록 */
	   @PostMapping("/movie")
	   public ModelAndView movie(
	           ModelAndView model,
	           @ModelAttribute MovieList movieList,
	           @RequestParam("poster") MultipartFile poster)
	       
//	           @SessionAttribute("loginMember") Member loginMember) 
	           {
	       int result = 0;
	       
//	       파일을 업로드하지 않으면 true, 파일을 업로드하면 false
	       log.info("Upfile is Empty : {}", poster.isEmpty());
//	       파일을 업로드하지 않으면 "", 파일을 업로드하면 "파일명"
	       log.info("Upfile Name : {}", poster.getOriginalFilename());
	       
	       // 파일을 업로드 했는지 확인 후 파일을 저장
	       if(poster != null && !poster.isEmpty()) {
	           // 파일을 저장하는 로직 작성
	           String location = null;
	           String renamedPoster = null;
	           
	           try {
	               // 포스터 업로드 시 저장할 경로 지정
	                location = resourceLoader.getResource("resources/post/9_10").getFile().getPath();
	                renamedPoster = MultipartFileUtil.save(poster, location);
	                
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	           if(renamedPoster != null) {
	               movieList.setMoviePoster(poster.getOriginalFilename());
	               movieList.setRenamedPoster(renamedPoster);
	           }
	       }
	       
	       // 작성한 게시글 데이터베이스에 저장
	       //movieList.setMemberNo(loginMember.getNo());
	       result = service.save(movieList);
	       
	       if(result > 0) {
	           model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
	            model.addObject("location", "/movie/movieList");
	       } else {
	           model.addObject("msg", "게시글 등록을 실패하였습니다.");
	            model.addObject("location", "/admin/movie");
	       }
	       
	       model.setViewName("common/msg");
	       
	       return model;
	   }
	
	   
   /* 영화관 등록 */
	   
	@GetMapping("/cinema")
	public String cinema() {
	    log.info("영화 등록 페이지 요청");
	    
		return "/admin/cinema";
	}

    @PostMapping("/cinema")
    public ModelAndView cinema(
            ModelAndView model,
            @ModelAttribute Cinema cinema,
            @RequestParam("upfile") MultipartFile upfile) {
        int result = 0;
        System.out.println(cinema);
        
//      파일을 업로드하지 않으면 true, 파일을 업로드하면 false
        log.info("Upfile is Empty : {}", upfile.isEmpty());
//      파일을 업로드하지 않으면 "", 파일을 업로드하면 "파일명"
        log.info("Upfile Name : {}", upfile.getOriginalFilename());
        
        // 파일을 업로드 했는지 확인 후 파일을 저장
        if(cinema != null && !upfile.isEmpty()) {
            // 파일을 저장하는 로직 작성
            String location = null;
            String cinemaImg = null;
            
            try {
                // 포스터 업로드 시 저장할 경로 지정
                 location = resourceLoader.getResource("resources/image/cinema").getFile().getPath();
                 cinemaImg = MultipartFileUtil.save(upfile, location);
                 
             } catch (IOException e) {
                 e.printStackTrace();
             }
            if(cinemaImg != null) {
                cinema.setCinemaImg(upfile.getOriginalFilename());
            }
        }
        
        // 작성한 게시글 데이터베이스에 저장
        //movieList.setMemberNo(loginMember.getNo());
        result = service.save(cinema);
        
        if(result > 0) {
            model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
             model.addObject("location", "/cinema/cinema");
        } else {
            model.addObject("msg", "게시글 등록을 실패하였습니다.");
             model.addObject("location", "/admin/cinema");
        }
        
        model.setViewName("common/msg");
        
        return model;
    }
    
	
	@GetMapping("/movieTime")
	public String movieTime() {
		
		return "/admin/movieTime";
	}
	
	@PostMapping("/movieTime")
	public ModelAndView movieTime(ModelAndView model, @ModelAttribute MovieTime movieTime   ) {
		
		 int result = 0;
	        
	        result = service.save(movieTime);
	        
	        if(result > 0) {
	            model.addObject("msg", "상영시간이 정상적으로 등록되었습니다.");
	            // 시간저장 
	            model.addObject("location", "/admin/memberList");
	        } else {
	            model.addObject("msg", "상영시간 등록을 실패하였습니다.");
	            model.addObject("location", "/admin/movieTime");
	        }
	        
	        model.addObject("result", result);
	        model.setViewName("common/msg");
	        
	        return model;
		
	}

	/* 공지사항 (등록하기, 목록보기) */
	
	@GetMapping("/noticeList")
	public ModelAndView noticeList(ModelAndView model,
			@RequestParam(value = "page", defaultValue = "1") int page) {
			
		List<Notice> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getNoticeCount(), 10);
		System.out.println(pageInfo);

		list = service.getNoticeList(pageInfo);
		
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/admin/noticeList");
		
		return model;
	}

	@GetMapping("/noticeDetail")
	public ModelAndView noticeDetail(ModelAndView model, @RequestParam int no) {
		Notice notice = null;
		
		notice = service.findNoticeByNo(no);
		
		model.addObject("notice", notice);
		model.setViewName("/admin/noticeDetail");
		
		return model;
	}
	
	
	@GetMapping("/noticeWrite")
	public String noticeWrite() {
	
		return "/admin/noticeWrite";
	}
	
	@PostMapping("/noticeWrite")
	public ModelAndView noticeWrite(ModelAndView model, @ModelAttribute Notice notice,
			@RequestParam("upfile") MultipartFile upfile
			  ) {
		int result = 0;
        
        // 파일을 업로드 했는지 확인 후 파일을 저장
        if(notice != null && !upfile.isEmpty()) {
            // 파일을 저장하는 로직 작성
            String location = null;
            String renamedImg = null;
            
            try {
                // 포스터 업로드 시 저장할 경로 지정
                 location = resourceLoader.getResource("resources/image/notice").getFile().getPath();
                 renamedImg = MultipartFileUtil.save(upfile, location);
                 
             } catch (IOException e) {
                 e.printStackTrace();
             }
            if(renamedImg != null) {
            	notice.setNoticeImg(upfile.getOriginalFilename());
            	notice.setRenamedImg(renamedImg);
            }
        }
        
        result = service.save(notice);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/admin/noticeList");
		} else {
			model.addObject("msg", "게시글이 등록을 실패하였습니다.");
			model.addObject("location", "/admin/noticeList");
		}
		
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	
	
	
	
	@GetMapping("/noticeUpdate")
	public ModelAndView noticeUpdate(
	        ModelAndView model,
	        @RequestParam int no) {
		
	    Notice notice = null;
		
		notice = service.findNoticeByNo(no);
		
		System.out.println(notice);
		
        model.addObject("notice", notice);
        model.setViewName("admin/noticeUpdate");
		
		return model;
		
	}
	
    @RequestMapping(value = "/noticeUpdate", method = { RequestMethod.POST })
    public ModelAndView noticeUpdate(ModelAndView model, @ModelAttribute Notice notice) {
        int result = 0;
        
        result = service.save(notice);
        
        if(result > 0) {
            model.addObject("msg", "문의 답변이 정상적으로 등록되었습니다.");
            model.addObject("location", "/admin/noticeDetail?no=" + notice.getNoticeNo());
        } else {
            model.addObject("msg", "문의 답변에 실패하였습니다.");
            model.addObject("location", "/admin/noticeUpdate?no=" + notice.getNoticeNo());
        }
        
        model.setViewName("common/msg");
        
        return model;
    }
    
    @GetMapping("/noticeDelete")
	   public ModelAndView noticeDelete(ModelAndView model, @RequestParam int no) {
		   int result = 0;
		   
		   result = service.NoticeDelete(no);
		   
		   if(result > 0) {
			   model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
			   model.addObject("location", "/admin/noticeList");
		   } else {
			   model.addObject("msg", "게시글 삭제를 실패하였습니다.");
			   model.addObject("location", "/admin/noticeDetail?no=" + no);
		   }
		   
		   model.setViewName("common/msg");
		   
		   return model;
	   }
	
	

	
}