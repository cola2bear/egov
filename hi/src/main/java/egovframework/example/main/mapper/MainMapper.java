package egovframework.example.main.mapper;

import java.util.List;
import java.util.Map;

import egovframework.example.cmmn.web.util.Search;
import egovframework.example.main.vo.MainVO;



public interface MainMapper {

	public List<MainVO> selectMain(Search search) throws Exception;
	
	public MainVO selectDetail(int srSeq) throws Exception;
	
	public void insertMain(MainVO mainVO) throws Exception;
	
	public void updateMain(MainVO mainVO) throws Exception;
	
	public void deleteMain(int srSeq) throws Exception;

	public int getMainListCnt(Search search) throws Exception;
	
	public void insertFile(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	public void updateFile(Map<String, Object> map) throws Exception;
}
