package com.kh.mobiil.partner.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mobiil.mail.controller.MailController;
import com.kh.mobiil.mail.domain.MailInfo;
import com.kh.mobiil.partner.domain.Page;
import com.kh.mobiil.partner.domain.Partner;
import com.kh.mobiil.partner.domain.SearchPartner;
import com.kh.mobiil.partner.service.PartnerService;

@Controller
public class PartnerController {
	
	@Autowired
	private PartnerService pService;
	@Autowired
	private MailController mailSender;
	
	//파트너 리스트(서비스 측)
	@RequestMapping(value = "/partner/list.kh", method = RequestMethod.GET)
	public ModelAndView partnerList(ModelAndView mv
			,@RequestParam(value = "page", required = false) Integer page, HttpServletRequest request) {
		
		//----------------------검색 조건
		SearchPartner sp = new SearchPartner("service"); // 서비스에서 검색하는 걸로 지정
		
		//----------------------페이징
		int currentPage = (page != null) ? page : 1;
		int totalCount = pService.getTotalCount(sp); // 서비스에서 검색할 때는 승인안된 파트너는 출력x
		int naviLimit = 5;
		int boardLimit = 9;
		Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
		RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
		

		//-------------------- 리스트 출력
		List<Partner> pList = pService.printAllPartner(sp,rowBounds); // 검색 조건, rowBounds(끊어서 가져오게)
		
		//-------------------- view세팅
		mv.addObject("pList", pList).addObject("paging", paging).addObject("urlVal", "list");
		mv.setViewName("/partner/partnerList");
		return mv;
	}
	
	//파트너 리스트(관리자 측)
	@RequestMapping(value = "admin/partner/list.kh", method = RequestMethod.GET)
	public ModelAndView partnerApprovalList(ModelAndView mv
			,@RequestParam(value = "page", required = false) Integer page, HttpServletRequest request) {
		
		//----------------------검색 조건
		SearchPartner sp = new SearchPartner("admin"); // 관리자에서 검색하는 걸로 지정
		
		//----------------------페이징
		int currentPage = (page != null) ? page : 1;
		int totalCount = pService.getTotalCount(sp); // 관리자에서 검색할 때는 승인안된 파트너는 출력o
		int naviLimit = 5;
		int boardLimit = 10;
		Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
		RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);

		//-------------------- 리스트 출력
		List<Partner> pList = pService.printAllPartner(sp,rowBounds); // 검색 조건, rowBounds(끊어서 가져오게)
		
		//-------------------- view세팅
		mv.addObject("pList", pList).addObject("paging", paging).addObject("urlVal", "list");
		mv.setViewName("/admin/managePartner/partnerList");
		return mv;
	}
	
	// 내 파트너 정보 보기
	@RequestMapping(value = "/partner/myPartnerInfo.kh", method = RequestMethod.GET)
	public ModelAndView myPartnerInfo(ModelAndView mv
			,@RequestParam("memberEmail") String memberEmail) {
		
		Partner myPartnerInfo = pService.findByEmail(memberEmail);
		
		// pOne 넘겨주고 정보 없을 시 처리는 jsp에서
		mv.addObject("myPartnerInfo", myPartnerInfo);
		mv.setViewName("/partner/myPartnerInfo");
		return mv;
	}
	
	//다른 파트너 정보 보기
		@RequestMapping(value = "/partner/detail.kh", method = RequestMethod.GET)
		public ModelAndView myPartnerInfo(ModelAndView mv
				,@RequestParam("partnerNo") int partnerNo) {
			
			Partner partner = pService.findByPartnerNo(partnerNo);
			
			// partner 넘겨주고 정보 없을 시 처리는 jsp에서
			mv.addObject("partner", partner);
			mv.setViewName("/partner/partnerDetail");
			return mv;
		}
		
	// 에이잭스로 파트너 승인하기
	@ResponseBody
	@RequestMapping(value="/admin/approvePartner.kh", method = RequestMethod.GET)
	public String approvePartner(@RequestParam("partnerNo") int partnerNo) {
		
		int result = pService.approvePartner(partnerNo);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 에이잭스로 파트너 삭제하기
		@ResponseBody
		@RequestMapping(value="/partner/deletePartner.kh", method = RequestMethod.GET)
		public String deletePartner(@RequestParam("partnerNo") int partnerNo) {
			
			int result = pService.deletePartner(partnerNo);
			
			if(result > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
		
	// 파트너 승인거절 메일 뷰
	@RequestMapping(value = "/admin/rejectMail.kh", method = RequestMethod.GET)
	public ModelAndView rejectMailView(@RequestParam("partnerNo") int partnerNo, ModelAndView mv) {
		Partner rejectedPartner = pService.findByPartnerNo(partnerNo);
		mv.addObject("rejectedPartner", rejectedPartner);
		mv.setViewName("/admin/managePartner/rejectMail");
		return mv;
	}
	
	//파트너 승인거절 메일 보내기
	@ResponseBody
	@RequestMapping(value="/admin/partnerRejectMail.kh", method = RequestMethod.POST)
	public int sendMail(@ModelAttribute MailInfo info, @RequestParam("partnerNo") int partnerNo) {
		int updateResult = 0;
		int mailResult = mailSender.mailSender(info);	// 메일 보내는 메소드 (성공시 1반환)
		if(mailResult > 0) { // 메일 보내기 성공 시 업데이트
			updateResult = pService.sendMail(partnerNo);	// 메일 보내고 메일 발송 여부 업데이트 메소드(성공시 1반환)
		}
		return mailResult+updateResult ; // 둘다 성공해야 2 반환
	}


	// 파트너 수정 뷰
	@RequestMapping(value = "/partner/modify.kh", method = RequestMethod.GET)
	public ModelAndView partnerModifyView(ModelAndView mv, @RequestParam("partnerNo") int partnerNo) {
		Partner myPartnerInfo = pService.findByPartnerNo(partnerNo);

		// pOne 넘겨주고 정보 없을 시 처리는 jsp에서
		mv.addObject("myPartnerInfo", myPartnerInfo);
		mv.setViewName("/partner/partnerModify");
		return mv;
	}

	// 내 파트너정보 수정하기
	@RequestMapping(value="/partner/modifyPartner.kh", method = RequestMethod.POST)
	public ModelAndView modifyPartner(ModelAndView mv
			,@ModelAttribute Partner partner
			,@RequestParam(value = "uploadFile", required = true) MultipartFile uploadFile
			, HttpServletRequest request) {
		
		// 썸네일 업로드
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\images\\partner"; // 저장경로 지정
				String profileFileName = uploadFile.getOriginalFilename();
				try {
					if (!profileFileName.equals("")) {
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
						File file = new File(savePath);
						String profileRename = sdf.format(new Date(System.currentTimeMillis())) + "."
								+ profileFileName.substring(profileFileName.lastIndexOf(".") + 1);// .다음부터 끝까지 잘라서 반환
						if (!file.exists()) {
							file.mkdir(); // 경로 폴더가 없으면 폴더 생성
						}
						uploadFile.transferTo(new File(savePath + "\\" + profileRename));
						String profilePath = savePath + "\\" + profileRename;// 절대경로
						
						partner.setProfileFileName(profileFileName);
						partner.setProfileRename(profileRename);
						partner.setProfilePath(profilePath);
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		int result = pService.modifyPartner(partner);
		if(result > 0) {
			Partner myPartnerInfo = partner;
			mv.addObject("myPartnerInfo", myPartnerInfo);
			mv.setViewName("/partner/myPartnerInfo");
		}else {
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 파트너 등록 뷰
	@RequestMapping(value = "/partner/registerView.kh", method = RequestMethod.GET)
	public String partnerRegisterView() {
		return "partner/partnerRegister";
	}
	
	// 파트너 등록
	@RequestMapping(value="/party/register.kh", method = RequestMethod.POST)
	public ModelAndView partnerRegister(ModelAndView mv
										,@ModelAttribute Partner partner
										,@RequestParam(value = "uploadFile", required = true) MultipartFile uploadFile
										, HttpServletRequest request) {
		
		
		// 썸네일 업로드
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\partner"; // 저장경로 지정
		String profileFileName = uploadFile.getOriginalFilename();
		try {
			if (!profileFileName.equals("")) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				File file = new File(savePath);
				String profileRename = sdf.format(new Date(System.currentTimeMillis())) + "."
						+ profileFileName.substring(profileFileName.lastIndexOf(".") + 1);// .다음부터 끝까지 잘라서 반환
				if (!file.exists()) {
					file.mkdir(); // 경로 폴더가 없으면 폴더 생성
				}
				uploadFile.transferTo(new File(savePath + "\\" + profileRename));
				String profilePath = savePath + "\\" + profileRename;// 절대경로
				
				partner.setProfileFileName(profileFileName);
				partner.setProfileRename(profileRename);
				partner.setProfilePath(profilePath);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 썸네일 업로드
		
		int result = pService.registerPartner(partner);
		if(result > 0) {
			mv.setViewName("/partner/partnerList");
		}else {
			mv.setViewName("/common/error");
		}
		return mv;
	}
	

}
