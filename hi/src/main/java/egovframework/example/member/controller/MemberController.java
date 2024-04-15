package egovframework.example.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.member.service.MemberService;
import egovframework.example.member.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService service;

	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginPOST(MemberVO vo, HttpServletRequest req, RedirectAttributes ra) throws Exception {
		Logger.info("post login");

		HttpSession session = req.getSession();

		MemberVO login = service.login(vo);
		System.out.println("login=" + login);
		if (login == null) {
			session.setAttribute("member", null);
			ra.addFlashAttribute("result", "loginFalse");
			return "redirect:/testList.do";
		} else {
			session.setAttribute("member", login);
			String id = req.getParameter("id");
			ra.addFlashAttribute("result", "loginOK");
			return "redirect:/testList.do";
		}
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/testList.do";
	}

	// 수정
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public void modifyGET() throws Exception {
		Logger.info("modifyGET");
	}

	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public String modifyPOST(HttpSession session, MemberVO vo, RedirectAttributes ra) throws Exception {
		Logger.info("modifyPOST");
		service.modify(vo);
		session.invalidate();
		ra.addFlashAttribute("result", "updateOK");
		return "redirect:/";
	}

	// 회원탈퇴

	@RequestMapping(value = "/remove.do", method = RequestMethod.GET)
	public void removeGET() throws Exception {
		Logger.info("removeGET");
	}

	@RequestMapping(value = "/remove.do", method = RequestMethod.POST)
	public String removePOST(MemberVO vo, HttpSession session, RedirectAttributes ra) throws Exception {
		Logger.info("removePOST");

		MemberVO user = (MemberVO) session.getAttribute("member"); //세션에서 member값 받아옴

		String oldPass = user.getPassword();
		String newPass = vo.getPassword();

		if (oldPass.equals(newPass)) {
			service.remove(vo);
			ra.addFlashAttribute("result", "removeOK");
			session.invalidate();
			return "redirect:/testList.do";
		} else {
			ra.addFlashAttribute("result", "removeFalse");
			return "redirect:/member/remove.do";
		}
	}

	// 회원가입 get
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		Logger.info("회원가입 페이지 이동");
	}

	// 회원가입 post
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		Logger.info("post register");

		service.register(vo);

		return "redirect:/";
	}

}