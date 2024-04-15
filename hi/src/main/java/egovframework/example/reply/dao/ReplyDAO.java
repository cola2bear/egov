package egovframework.example.reply.dao;

import java.util.List;

import egovframework.example.reply.vo.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> listPage(int srSeq) throws Exception; 

	void create(ReplyVO reply) throws Exception;
	
	void update(ReplyVO reply) throws Exception;
	
	void delete(Integer rno) throws Exception;
}
