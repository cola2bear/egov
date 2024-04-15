package egovframework.example.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import egovframework.example.reply.dao.ReplyDAO;
import egovframework.example.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> listPage(int srSeq) throws Exception{
		return dao.listPage(srSeq);
	}
	
	@Override
	public void register(ReplyVO reply) throws Exception{
		dao.create(reply);
	}
	
	@Override
	public void modify(ReplyVO reply) throws Exception {
		dao.update(reply);
		
	}
	@Override
	public void remove(int srSeq) throws Exception {
		dao.delete(srSeq);
	}

}
