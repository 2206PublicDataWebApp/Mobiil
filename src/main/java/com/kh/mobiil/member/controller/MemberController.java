package com.kh.mobiil.member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mobiil.chat.domain.ChatRoom;
import com.kh.mobiil.chat.service.ChatService;
import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.member.service.MemberService;
import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.space.domain.Reservation;

@Controller
public class MemberController {
	@Autowired
	private MemberService mService;

	@Autowired
	private ChatService cService;

	@Autowired
	private JavaMailSender mailSender;

	
///// 개인 회원 /////	
	
	/**
	 * 회원가입 화면
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/member/joinView.kh", method = RequestMethod.GET)
	public String memberJoinView(Model model) {
		return "member/join";
	}

	/**
	 * 회원정보 DB 저장
	 * 
	 * @param member
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/member/register.kh", method = RequestMethod.POST)
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
			mv.addObject("msg", "회원가입에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}

	/**
	 * 회원가입 시 이메일 중복 체크(개인+기업)
	 * @param memberEmail
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/member/checkEmail.kh", method = RequestMethod.GET)
	public String checkEmail(@RequestParam("memberEmail") String memberEmail) {
		int result = mService.checkDupEmail(memberEmail);
		return result + "";
	}

	///
	
	/**
	 * 회원가입 시 닉네임 중복 체크
	 * @param memberNick
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/member/checkNick.kh", method = RequestMethod.GET)
	public String checkNick(@RequestParam("memberNick") String memberNick) {
		int result = mService.checkDupNick(memberNick);
		return result + "";
	}

	/**
	 * 회원가입 -> 인증메일 발송
	 * @param memberEmail
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/mailCheck", produces = "text/plain;charset=utf-8", method = RequestMethod.GET)
	public String mailCheck(String memberEmail) throws Exception {
	
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
	
		// 이메일 보내기
		String setFrom = "kh_mobiil@naver.com";
		String toEmail = memberEmail;
		String title = "모빌 회원가입 인증 이메일 입니다.";
		String content = "안녕하세요." + "<br><br>" + "회원님이 사용하는 이메일을 인증하려면,<br>" + "아래 인증번호를 인증번호 확인란에 기입하여 주세요.<br><br>"
				+ "인증 번호: " + "<b>" + checkNum + "</b>" + "<br><br>" + "감사합니다." + "<br>" + "Mobiil팀 드림.";
	
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom, "모빌");
			helper.setTo(toEmail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
	
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		String num = Integer.toString(checkNum);
		return num;
	}

	/**
	 * 로그인 화면
	 * 
	 * @return
	 */
	@RequestMapping(value = "/member/loginView.kh", method = RequestMethod.GET)
	public String memberLoginView() {
		return "member/login";
	}

	/**
	 * 로그인
	 * 
	 * @param member
	 * @param mv
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/member/login.kh", method = RequestMethod.POST)
	public ModelAndView memberLogin(@ModelAttribute Member member, ModelAndView mv, HttpServletRequest request) {
		try {
			Member loginUser = mService.loginMember(member);
			if (loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				mv.setViewName("redirect:/");
			} else {
				request.setAttribute("msg", "회원정보가 없습니다.");
				request.setAttribute("url", "/member/loginView.kh");
				mv.setViewName("/common/alert");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}

	/**
	 * 마이페이지(My 정보 화면)
	 * 
	 * @param mv
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/member/myInfo.kh", method = RequestMethod.GET)
	public ModelAndView showMyPage(ModelAndView mv, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			Member member = (Member) session.getAttribute("loginUser");
			String memberEmail = member.getMemberEmail();
			Member mOne = mService.printOneByEmail(memberEmail);
			mv.addObject("member", mOne);
			mv.setViewName("member/myPage");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}

	/**
	 * 회원 정보 수정
	 * 
	 * @param mv
	 * @param member
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/member/modify.kh", method = RequestMethod.POST)
	public ModelAndView modifyMember(ModelAndView mv, @ModelAttribute Member member, HttpServletRequest request) {
		try {
			int result = mService.modifyMember(member);
			if (result > 0) {
				request.setAttribute("msg", "정보 수정이 완료되었습니다.");
				request.setAttribute("url", "/member/myInfo.kh");
				mv.setViewName("common/alert");
			} else {
				mv.addObject("msg", "정보 수정에 실패하였습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "정보 수정에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}

	/**
	 * 회원 탈퇴
	 * 
	 * @param mv
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/member/remove.kh", method = RequestMethod.GET)
	public ModelAndView removeMember(ModelAndView mv, HttpSession session, HttpServletRequest request) {
		try {
			Member member = (Member) session.getAttribute("loginUser");
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

	/**
	 * 비밀번호 찾기 화면
	 * 
	 * @return
	 */
	@RequestMapping(value = "login/findPwdView.kh", method = RequestMethod.GET)
	public String findPwdView() {
		return "login/findPwd";
	}

	/**
	 * 비밀번호 변경 시 이메일 존재 체크
	 * @param memberEmail
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/member/checkMemberEmail.kh", method = RequestMethod.GET)
	public String checkMemberEmail(@RequestParam("memberEmail") String memberEmail) {
		int result = mService.checkMemDupEmail(memberEmail);
		return result + "";
	}

	/**
	 * 비밀번호 찾기 -> 인증메일 발송
	 * @param memberEmail
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/findPwd", produces = "text/plain;charset=utf-8", method = RequestMethod.GET)
	public String findPwd(String memberEmail) throws Exception {
	
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
	
		// 이메일 보내기
		String setFrom = "kh_mobiil@naver.com";
		String toEmail = memberEmail;
		String title = "모빌 비밀번호 변경을 위한 인증번호 이메일 입니다.";
		String content = "안녕하세요." + "<br><br>" + "비밀번호 변경을 위해,<br>" + "아래 인증번호를 인증번호 확인란에 기입하여 주세요.<br><br>" + "인증 번호: "
				+ "<b>" + checkNum + "</b>" + "<br><br>" + "감사합니다." + "<br>" + "Mobiil팀 드림.";
	
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom, "모빌");
			helper.setTo(toEmail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		return num;
	
	}

	/**
	 * 비밀번호 변경 화면
	 * 
	 * @param memberEmail
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "login/modifyPwdView.kh", method = RequestMethod.GET)
	public String modifyPwd(String memberEmail, Model model) {
		model.addAttribute("memberEmail", memberEmail);
		return "login/modifyPwd";
	}

	/**
	 * 비밀번호 DB 업데이트
	 * @param member
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/login/modifyPwd.kh", method = RequestMethod.POST)
	public String pwdUpdate(Member member, HttpSession session) throws IOException {
		int result = mService.modifyPwd(member);
		if (result == 1) {
			return "login/choose";
		} else {
			return "login/modifyPwd";
		}
	}

	/**
	 * 결제내역 목록조회
	 * @param mv
	 * @param page
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/payment/list.kh", method = RequestMethod.GET)
	public ModelAndView paymentListView(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		String memberEmail = member.getMemberEmail();
		int currentPage = (page != null) ? page : 1;
		int totalCount = mService.getTotalCount();
		int reserveLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int) ((double) totalCount / reserveLimit + 0.9);
		startNavi = ((int) ((double) currentPage / naviLimit + 0.9) - 1) * naviLimit + 1;
		endNavi = startNavi + naviLimit - 1;
		if (maxPage < endNavi) {
			endNavi = maxPage;
		}
		List<Reservation> rList = mService.printAllReserve(memberEmail, currentPage, reserveLimit);
		if (!rList.isEmpty()) {
			mv.addObject("memberEmail", memberEmail);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("rList", rList);
		}
		mv.setViewName("member/paymentHistory");

		return mv;
	}

	/**
	 * 결제내역 상세조회
	 * @param mv
	 * @param reservationNo
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/payment/detail.kh", method = RequestMethod.GET)
	public ModelAndView paymentDetailView(ModelAndView mv, @RequestParam("reservationNo") String reservationNo,
			@RequestParam("page") Integer page) {
		try {
			Reservation reservation = mService.printOneByNo(reservationNo);
			mv.addObject("reservation", reservation);
			mv.addObject("page", page);
			mv.setViewName("member/paymentDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

///
	
	/**
	 * 로그아웃
	 * 
	 * @param mv
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/member/logout.kh", method = RequestMethod.GET)
	public ModelAndView Logout(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session != null) {
			session.invalidate();
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("msg", "로그아웃 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}	
	
///	
	
///// 기업 회원 /////

	/**
	 * 회원가입 화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/host/joinView.kh", method = RequestMethod.GET)
	public String hostJoinView(Model model) {
		return "host/join";
	}

	/**
	 * 회원정보 DB 저장
	 * @param host
	 * @param mv
	 * @param uploadFile
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/host/register.kh", method = RequestMethod.POST)
	public ModelAndView hostJoin(@ModelAttribute Host host, ModelAndView mv,
			@RequestParam(value = "uploadFile", required = true) MultipartFile uploadFile, HttpServletRequest request) {
		try {
			String regPhotoName = uploadFile.getOriginalFilename();
			if (!uploadFile.getOriginalFilename().equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "//hostFiles";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss");
				String regPhotoRename = sdf.format(new Date(System.currentTimeMillis())) + "."
						+ regPhotoName.substring(regPhotoName.lastIndexOf(".") + 1);
				File file = new File(savePath);
				if (!file.exists()) {
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

	/**
	 * 회원가입 -> 인증메일 발송
	 * @param hostEmail
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/hostMailCheck", produces = "text/plain;charset=utf-8", method = RequestMethod.GET)
	public String hostMailCheck(String hostEmail) throws Exception {
	
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
	
		// 이메일 보내기
		String setFrom = "kh_mobiil@naver.com";
		String toEmail = hostEmail;
		String title = "모빌 회원가입 인증 이메일 입니다.";
		String content = "안녕하세요." + "<br><br>" + "회원님이 사용하는 이메일을 인증하려면,<br>" + "아래 인증번호를 인증번호 확인란에 기입하여 주세요.<br><br>"
				+ "인증 번호: " + "<b>" + checkNum + "</b>" + "<br><br>" + "감사합니다." + "<br>" + "Mobiil팀 드림.";
	
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom, "모빌");
			helper.setTo(toEmail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
	
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		String num = Integer.toString(checkNum);
		return num;
	}

	/**
	 * 회원가입 시 이메일 중복 체크(개인+기업)
	 * @param hostEmail
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/host/checkEmail.kh", method = RequestMethod.GET)
	public String checkhostEmail(@RequestParam("hostEmail") String hostEmail) {
		int result = mService.checkDupHostEmail(hostEmail);
		return result + "";
	}

	/**
	 * 로그인 화면
	 * @return
	 */
	@RequestMapping(value = "/host/loginView.kh", method = RequestMethod.GET)
	public String hostLoginView() {
		return "host/login";
	}

	/**
	 * 로그인
	 * @param host
	 * @param mv
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/host/login.kh", method = RequestMethod.POST)
	public ModelAndView hostLogin(@ModelAttribute Host host, ModelAndView mv, HttpServletRequest request) {
		try {
			Host loginHost = mService.loginHost(host);
			if (loginHost != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginHost", loginHost);
				mv.setViewName("redirect:/");
			} else {
				request.setAttribute("msg", "회원정보가 없습니다.");
				request.setAttribute("url", "/host/loginView.kh");
				mv.setViewName("/common/alert");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}

	/**
	 * 비밀번호 찾기 화면
	 * 
	 * @return
	 */
	@RequestMapping(value = "login/findHostPwdView.kh", method = RequestMethod.GET)
	public String findHostPwdView() {
		return "login/findHostPwd";
	}

	/**
	 * 비밀번호 변경 시 이메일 존재 체크
	 * @param hostEmail
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/member/checkHostEmail.kh", method = RequestMethod.GET)
	public String checkHostEmail(@RequestParam("hostEmail") String hostEmail) {
		int result = mService.checkHostDupEmail(hostEmail);
		return result + "";
	}

	/**
	 * 비밀번호 찾기 -> 인증메일 발송
	 * @param hostEmail
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/findHostPwd", produces = "text/plain;charset=utf-8", method = RequestMethod.GET)
	public String findHostPwd(String hostEmail) throws Exception {
	
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
	
		// 이메일 보내기
		String setFrom = "kh_mobiil@naver.com";
		String toEmail = hostEmail;
		String title = "모빌 비밀번호 변경을 위한 인증번호 이메일 입니다.";
		String content = "안녕하세요." + "<br><br>" + "비밀번호 변경을 위해,<br>" + "아래 인증번호를 인증번호 확인란에 기입하여 주세요.<br><br>" + "인증 번호: "
				+ "<b>" + checkNum + "</b>" + "<br><br>" + "감사합니다." + "<br>" + "Mobiil팀 드림.";
	
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom, "모빌");
			helper.setTo(toEmail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		return num;
	
	}

	/**
	 * 비밀번호 변경 화면
	 * 
	 * @param hostEmail
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "login/modifyHostPwdView.kh", method = RequestMethod.GET)
	public String modifyHostPwd(String hostEmail, Model model) {
		model.addAttribute("hostEmail", hostEmail);
		return "login/modifyHostPwd";
	}

	/**
	 * 비밀번호 DB 업데이트
	 * @param host
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/login/modifyHostPwd.kh", method = RequestMethod.POST)
	public String hostPwdUpdate(Host host, HttpSession session) throws IOException {
		int result = mService.modifyHostPwd(host);
		if (result == 1) {
			return "login/choose";
		} else {
			return "login/modifyPwd";
		}
	}

}
