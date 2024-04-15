package egovframework.example.main.controller;


import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.cmmn.web.util.Search;
import egovframework.example.main.service.MainService;
import egovframework.example.main.vo.MainVO;
import egovframework.example.reply.service.ReplyService;

@Controller
public class MainController {
	
	private static final Logger Logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MainService mainService; //service 의존성 주입
	
	@Inject
	ReplyService replyService;

	 @RequestMapping(value = "/main.do") public String mainPage() {
	 
	  return "main";
	  
	  }

	
	@RequestMapping(value = "/testList.do")
	public String mainListDo(Model model
				,@RequestParam(required = false, defaultValue = "1") int page
				,@RequestParam(required = false, defaultValue = "1") int range
				,@RequestParam(required = false, defaultValue = "titl") String searchType
				,@RequestParam(required = false) String keyword,
				@ModelAttribute("search") Search search) throws Exception{
		
		//검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int listCnt = mainService.getMainListCnt(search);
		//검색
		search.pageInfo(page, range, listCnt);
		//페이징
		model.addAttribute("pagination",search);
		//게시글 화면 출력
		model.addAttribute("list", mainService.selectMain(search));
		
		return "main";
		
		
	}
	//상세 접속
	@RequestMapping(value = "/testDetail.do")
	public String viewForm(Model model, HttpServletRequest request) throws Exception{
		int srSeq = Integer.parseInt(request.getParameter("srSeq"));
		
		
		MainVO mainVO = mainService.selectDetail(srSeq);
		model.addAttribute("vo",mainVO);
		
	    List<Map<String, Object>> fileList = mainService.selectFileList(srSeq);
	    model.addAttribute("fileList", fileList);
		
		return "mainDetail";
	}
	
	@RequestMapping(value = "/testRegister.do")
	public String mainRegister() {
		return "mainRegister";
	}
	//게시글 작성페이지 이동
	@RequestMapping(value = "/insertTest.do", method = RequestMethod.GET)
	public void writeView() throws Exception{
		Logger.info("writeView");
	}
	
	//게시글 작성
	@RequestMapping(value = "/insertTest.do", method = RequestMethod.POST)
	public String write(MainVO vo, MultipartHttpServletRequest mpRequest) throws Exception{
		Logger.info("write");
		mainService.insertMain(vo, mpRequest);
		
		return "redirect:/testList.do";
	}

	
	//게시글 수정
	@RequestMapping(value = "/testEdit.do", method = RequestMethod.GET)
	public String mainEdit(Model model, HttpServletRequest request) throws Exception{
		int srSeq = Integer.parseInt(request.getParameter("srSeq"));
		
		MainVO mainVO = mainService.selectDetail(srSeq);
		model.addAttribute("vo",mainVO);
		
		return "mainEdit";
	}
	
	@RequestMapping(value = "/updateTest.do")
	public String updateMain(@ModelAttribute("mainVO") MainVO mainVO) throws Exception{
		
		int srSeq = mainVO.getSrSeq();
		
		mainService.updateMain(mainVO);
		return "redirect:testDetail.do?srSeq="+ srSeq;
	}
	
	@RequestMapping(value="/deleteTest.do")
	public String deleteTest(HttpServletRequest request) throws Exception{
		int srSeq= Integer.parseInt(request.getParameter("srSeq"));
		mainService.deleteMain(srSeq);
		return "redirect:testList.do";
	}
	
	@RequestMapping(value="/fileDown.do")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = mainService.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\mp\\file\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	
}