package egovframework.example.member.mapper;

import egovframework.example.member.vo.MemberVO;


public interface MemberMapper {
	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
}
