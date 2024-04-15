package egovframework.example.main.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.web.util.FileUtils;
import egovframework.example.cmmn.web.util.Search;
import egovframework.example.main.dao.MainDAO;
import egovframework.example.main.service.MainService;
import egovframework.example.main.vo.MainVO;


@Service("MainService")
@Transactional
public class MainServiceImpl implements MainService{
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	private MainDAO mainDAO;
	
	@Override
	public List<MainVO> selectMain(Search search) throws Exception{
		return mainDAO.selectMain(search);
	}
	
	@Override
	public int getMainListCnt(Search search) throws Exception{
		return mainDAO.getMainListCnt(search);
	}
	
	@Override
	public MainVO selectDetail(int srSeq) throws Exception{
		return mainDAO.selectDetail(srSeq);
	}

	@Override
	public void insertMain(MainVO mainVO, MultipartHttpServletRequest mpRequest) throws Exception{
		 mainDAO.insertMain(mainVO);
		 
		 List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(mainVO, mpRequest);
		 int size = list.size();
			for(int i=0; i<size; i++){ 
				mainDAO.insertFile(list.get(i)); 
			}
	}
	
	@Override
	public void updateMain(MainVO mainVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception{
		mainDAO.updateMain(mainVO);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(mainVO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				mainDAO.insertFile(tempMap);
			}else {
				mainDAO.updateFile(tempMap);
			}
		}
	}
	
	@Override
	public void deleteMain(int srSeq) throws Exception{
		mainDAO.deleteMain(srSeq);
	}
	
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
	    return mainDAO.selectFileList(bno);
	}
	
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
	    return mainDAO.selectFileInfo(map);
	}
	
}
