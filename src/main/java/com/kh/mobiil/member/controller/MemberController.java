package com.kh.mobiil.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
			
}
