package com.kh.mobiil.member.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService mService;

	@RequestMapping(value = "/member/joinView.kh", method=RequestMethod.GET) // 회원가입 페이지
	public String memberJoinView(Model model) {
		return "member/join";
	}

	@RequestMapping(value = "/member/register.kh", method=RequestMethod.POST) // 회원정보 DB 저장
	public ModelAndView memberJoin(@ModelAttribute Member member, ModelAndView mv) {
		try {
			int result = mService.registerMember(member);
			if (result > 0) {
				mv.addObject("msg", "회원가입에 성공했습니다.");
				mv.setViewName("/member/login");
			} else {
				mv.addObject("msg", "회원가입에 실패했습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}

	@RequestMapping(value="/member/loginView.kh", method=RequestMethod.GET) // 로그인 페이지
	public String memberLoginView() {
		return "member/login";
	}
	
	@RequestMapping(value = "/member/login.kh", method=RequestMethod.POST) // 로그인
	public ModelAndView memberLogin(@ModelAttribute Member member, ModelAndView mv, HttpServletRequest request) {
		try {
			Member loginUser = mService.loginMember(member);
			if(loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				mv.setViewName("redirect:/");
			}else {
				request.setAttribute("msg", "회원정보가 없습니다.");
				request.setAttribute("url", "/member/loginView.kh");
				mv.setViewName("/common/alert");
			}
			}catch(Exception e) {
				mv.addObject("msg", e.toString()).setViewName("common/errorPage");
			}
			return mv;
		}
	
	@RequestMapping(value="/member/logout.kh", method=RequestMethod.GET) // 로그아웃
	public ModelAndView memberLogout(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("msg", "로그아웃 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/member/myInfo.kh", method=RequestMethod.GET) // 마이페이지(My 정보화면)
	public ModelAndView showMyPage(ModelAndView mv, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("loginUser");
			String memberEmail = member.getMemberEmail();
			Member mOne = mService.printOneByEmail(memberEmail);
			mv.addObject("member", mOne);
			mv.setViewName("member/myPage");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
			
	@RequestMapping(value="/member/modify.kh", method=RequestMethod.POST) // 회원 정보 수정
	public ModelAndView modifyMember(ModelAndView mv, @ModelAttribute Member member, HttpServletRequest request) {
		try {
			int result = mService.modifyMember(member);
			if(result > 0) {
				request.setAttribute("msg", "정보 수정이 완료되었습니다.");
				request.setAttribute("url", "/member/myInfo.kh");
				mv.setViewName("common/alert");
			} else {
				mv.addObject("msg", "정보 수정에 실패하였습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch(Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
//			mv.addObject("msg", "정보 수정에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/member/remove.kh", method=RequestMethod.GET) // 회원탈퇴
	public ModelAndView removeMember(ModelAndView mv, HttpSession session, HttpServletRequest request) {
		try {	
			Member member = (Member)session.getAttribute("loginUser");
			String memberEmail = member.getMemberEmail();
			int result = mService.removeMember(memberEmail);
			if (result > 0) {
				request.setAttribute("msg", "회원탈퇴가 완료되었습니다.");
				request.setAttribute("url", "/member/logout.kh");
				mv.setViewName("/common/alert");	
			} else {
				request.setAttribute("msg", "회원탈퇴에 실패하였습니다.");
				request.setAttribute("url", "user/myPage.kh");
				mv.setViewName("/common/alert");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}


//////////////////////////////호스트 로그인///////////////////////////////////////
	
	@RequestMapping(value = "/host/joinView.kh", method=RequestMethod.GET) // 회원가입 페이지
	public String hostJoinView(Model model) {
		return "host/join";
	}

	@RequestMapping(value = "/host/register.kh", method=RequestMethod.POST) // 회원정보 DB 저장
	public ModelAndView hostJoin(@ModelAttribute Host host, ModelAndView mv,
			@RequestParam(value = "uploadFile", required = true) MultipartFile uploadFile,
			HttpServletRequest request) {
		try {
			String regPhotoName = uploadFile.getOriginalFilename();
			if(!uploadFile.getOriginalFilename().equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "//hostFiles";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss");
				String regPhotoRename = sdf.format(new Date(System.currentTimeMillis())) + "." + regPhotoName.substring(regPhotoName.lastIndexOf(".") + 1);
				File file = new File(savePath);
				if(!file.exists()) {
					file.mkdir();
				}
				uploadFile.transferTo(new File(savePath + "\\" + regPhotoRename));
				String regPhotoPath = savePath + "\\" + regPhotoRename;
				host.setRegPhotoName(regPhotoName);
				host.setRegPhotoRename(regPhotoRename);
				host.setRegPhotoPath(regPhotoPath);
			}
			int result = mService.registerHost(host);
			if (result > 0) {
				mv.addObject("msg", "회원가입에 성공했습니다.");
				mv.setViewName("/host/login");
			} else {
				mv.addObject("msg", "회원가입에 실패했습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}

	@RequestMapping(value="/host/loginView.kh", method=RequestMethod.GET) // 로그인 페이지
	public String hostLoginView() {
		return "host/login";
	}
	
	@RequestMapping(value = "/host/login.kh", method=RequestMethod.POST) // 로그인
	public ModelAndView hostLogin(@ModelAttribute Host host, ModelAndView mv, HttpServletRequest request) {
		try {
			Host loginUser = mService.loginHost(host);
			if(loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				mv.setViewName("redirect:/");
			}else {
				request.setAttribute("msg", "회원정보가 없습니다.");
				request.setAttribute("url", "/host/loginView.kh");
				mv.setViewName("/common/alert");
			}
			}catch(Exception e) {
				mv.addObject("msg", e.toString()).setViewName("common/errorPage");
			}
			return mv;
		}	
	
	@RequestMapping(value="/host/logout.kh", method=RequestMethod.GET) // 로그아웃
	public ModelAndView hostLogout(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("msg", "로그아웃 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
}
