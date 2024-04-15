package egovframework.example.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.member.dao.MemberDAO;
import egovframework.example.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO DAO;

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return DAO.login(vo);
	}

	@Override
	public void register(MemberVO vo) throws Exception {
		DAO.register(vo);
	}

	@Override
	public void modify(MemberVO vo) throws Exception{
		DAO.modify(vo);
	}
	
	@Override
	public void remove(MemberVO vo) throws Exception{
		DAO.remove(vo);
	}
}
