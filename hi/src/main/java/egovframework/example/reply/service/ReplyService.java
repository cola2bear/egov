package egovframework.example.reply.service;

import java.util.List;

import egovframework.example.reply.vo.ReplyVO;

public interface ReplyService {

	List<ReplyVO> listPage(int srSeq) throws Exception;
	
	void register(ReplyVO reply) throws Exception;
	
	void modify(ReplyVO reply) throws Exception;
	
	void remove(int srSeq) throws Exception;
	
}
