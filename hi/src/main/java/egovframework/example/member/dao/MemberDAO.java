package egovframework.example.member.dao;

import java.util.List;

import egovframework.example.member.vo.MemberVO;

public interface MemberDAO {
	// 회원가입
	public void register(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//정보수정
	public void modify(MemberVO vo) throws Exception;
	
	//삭제
	public void remove(MemberVO vo) throws Exception;
	
}

