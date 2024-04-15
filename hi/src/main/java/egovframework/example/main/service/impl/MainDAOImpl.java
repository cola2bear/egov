package egovframework.example.main.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.cmmn.web.util.Search;
import egovframework.example.main.dao.MainDAO;
import egovframework.example.main.mapper.MainMapper;
import egovframework.example.main.vo.MainVO;

@Repository
public class MainDAOImpl implements MainDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MainVO> selectMain(Search search) throws Exception{
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.selectMain(search);
	}
	
	@Override
	public int getMainListCnt(Search search) throws Exception{
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.getMainListCnt(search);
	}

	@Override
	public MainVO selectDetail(int srSeq) throws Exception{
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.selectDetail(srSeq);
	}

	@Override
	public void insertMain(MainVO mainVO) throws Exception{
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		mapper.insertMain(mainVO);
	}

	@Override
	public void updateMain(MainVO mainVO) throws Exception{
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		mapper.updateMain(mainVO);
	}
	
	@Override
	public void deleteMain(int srSeq) throws Exception{
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		mapper.deleteMain(srSeq);
	}
	
    @Override
    public void insertFile(Map<String, Object> map) throws Exception {
        MainMapper mapper = sqlSession.getMapper(MainMapper.class);
        mapper.insertFile(map);
    }
    
    @Override
    public List<Map<String, Object>> selectFileList(int bno) throws Exception {
        MainMapper mapper = sqlSession.getMapper(MainMapper.class);
        return mapper.selectFileList(bno);
    }
    
    @Override
    public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
        MainMapper mapper = sqlSession.getMapper(MainMapper.class);
        return mapper.selectFileInfo(map);
    }
    
    @Override
    public void updateFile(Map<String, Object> map) throws Exception {
        MainMapper mapper = sqlSession.getMapper(MainMapper.class);
        mapper.updateFile(map);
    }
    
    
}
