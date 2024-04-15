package egovframework.example.main.dao;

import java.util.List;
import java.util.Map;

import egovframework.example.cmmn.web.util.Search;
import egovframework.example.main.vo.MainVO;



public interface MainDAO {
	
	public int getMainListCnt(Search search) throws Exception;
	
	public List<MainVO> selectMain(Search search) throws Exception;
	
	public MainVO selectDetail(int srSeq) throws Exception;
	
	public void insertMain(MainVO mainVO) throws Exception;
	
	public void updateMain(MainVO mainVO) throws Exception;
	
	public void deleteMain(int srSeq) throws Exception;
	//파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	//파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	//파일 다운로드
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	//파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
}
