package egovframework.example.main.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.web.util.Search;
import egovframework.example.main.vo.MainVO;





public interface MainService {

	//총 게시글 개수 확인
	public int getMainListCnt(Search search) throws Exception;
	
	public List<MainVO> selectMain(Search search) throws Exception;

	public MainVO selectDetail(int srSeq) throws Exception;

	public void insertMain(MainVO mainVO, MultipartHttpServletRequest mpRequest) throws Exception;
	
	public void updateMain(MainVO mainVO, String[] files, 
										  String[] fileNames,
										  MultipartHttpServletRequest mpRequest) throws Exception;
	
	public void deleteMain(int srSeq) throws Exception;
	
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;

}
