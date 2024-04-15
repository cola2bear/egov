package egovframework.example.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import egovframework.example.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject 
	SqlSession sql;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("register", vo);
	}
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return sql.selectOne("login", vo);
	}
	
	@Override
	public void modify(MemberVO vo) throws Exception{
		sql.update("modify", vo);
	}
	
	@Override
	public void remove(MemberVO vo) throws Exception{
		sql.delete("remove", vo);
	}

}
