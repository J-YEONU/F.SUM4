package com.kh.sum.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sum.member.model.mapper.MemberMapper;
import com.kh.sum.member.model.vo.Member;

@Service
//@Transactional
public class MemberServiceImpl implements MemberService {
//	@Autowired
//	private MemberDao dao;
	
//	@Autowired
//	private SqlSession session;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public Member findMemberById(String id) {
		
		return mapper.selectMemberById(id);
	}
	
	@Override
	public Member findMemberByEmail(String email) {
		
		return mapper.selectMemberByEmail(email);
	}
	
	@Override
	public Member findMemberByPhone(String phone) {
		
		return mapper.selectMemberByPhone(phone);
	}
	
	@Override
	public Member login(String id, String password) {
		Member member = null;
		
//		member = dao.findMemberById(session, id);
		member = this.findMemberById(id);
		
		// 매번 랜덤한 솔트값을 가지고 암호화를 하기 때문에 매번 다른 값으로 암호화 된다.
		System.out.println("encode() : " + passwordEncoder.encode(password));
		
		// matches() 메소드를 사용하면 내부적으로 복호화해서 나온 결과값에 솔트값을 땐 나머지 값과 원문을 비교한다.
		if(member != null && passwordEncoder.matches(password, member.getPassword())) {
			return member;
		} else {
			return null;
		}
	}

	@Override
	@Transactional
	public int save(Member member) {
		int result = 0;
		
		if(member.getNo() != 0) {
			
			if(member.getPassword() == "" || member.getPassword() == null) {
				result = mapper.updateaNotPwdMember(member);
			} else {
				// update
				member.setPassword(passwordEncoder.encode(member.getPassword()));
				
				result = mapper.updateMember(member);				
			}
			
		} else {
			// insert
			member.setPassword(passwordEncoder.encode(member.getPassword()));
			
			result = mapper.insertMember(member);
		}
		
//		if(true) {
//			throw new RuntimeException();
//		}
		
		return result;
	}
	
	@Override
	@Transactional
	public void updatePwd(Member member) {
			CharSequence pwd = "1234";
			member.setPassword(passwordEncoder.encode(pwd));
			mapper.updatePwdMember(member);
			
		}
		
		

	
	
	

	@Override
	public Boolean isDuplicateID(String id) {
		
		return this.findMemberById(id) != null;
	}
	
	@Override
	public Boolean isDuplicateEmail(String email) {
		
		return this.findMemberByEmail(email) != null;
	}
	
	@Override
	public Boolean isDuplicatePhone(String phone) {
		
		return this.findMemberByPhone(phone) != null;
	}

	@Override
	public int delete(int no) {
		int result = 0;
		
		result = mapper.deleteMember(no);
		
		return result;
	}

	@Override
	public Boolean isDuplicateM(String userEmail, Member loginMember) {

		return loginMember.getEmail().equals(userEmail);
	}

	@Override
	public Boolean isDuplicateMP(String userPhone, Member loginMember) {

		return loginMember.getPhone().equals(userPhone);
	}

}