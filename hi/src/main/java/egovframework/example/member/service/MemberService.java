package egovframework.example.member.service;

import java.util.List;

import egovframework.example.member.vo.MemberVO;

public interface MemberService {
	
	public void register(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;

	public void modify(MemberVO vo) throws Exception;
	
	public void remove(MemberVO vo) throws Exception;
}
