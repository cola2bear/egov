package egovframework.example.reply.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import egovframework.example.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	SqlSession sql;
	
	@Override
	public List<ReplyVO> listPage(int srSeq) throws Exception {
		return sql.selectList("replyMapper.listPage", srSeq);
	}

	@Override
	public void create(ReplyVO reply) throws Exception {
		sql.insert("replyMapper.create", reply);
		
	}
	@Override
	public void update(ReplyVO reply) throws Exception {
		sql.update("replyMapper.update", reply);
		
	}
	@Override
	public void delete(Integer rno) throws Exception {
		sql.delete("replyMapper.delete", rno);
		
	}
}
