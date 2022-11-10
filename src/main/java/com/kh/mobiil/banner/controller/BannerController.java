package com.kh.mobiil.banner.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mobiil.banner.domain.Banner;
import com.kh.mobiil.banner.service.BannerService;
import com.kh.mobiil.mail.controller.MailController;
import com.kh.mobiil.mail.domain.MailInfo;

@Controller
public class BannerController {

	@Autowired
	private BannerService bService;
	@Autowired
	private MailController mailSender;

	/**
	 * 배너 삭제
	 */
	@ResponseBody
	@RequestMapping("/admin/banner/remove.kh")
	public String removeBanner(@ModelAttribute Banner banner) {
		banner.setBannerFileName(null);
		banner.setBannerPath(null);
		banner.setBannerRename(null);
		banner.setBannerMsg(null);
		banner.setBannerLink(null);
		int result = bService.renewBanner(banner);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	/**
	 *  배너 내용 수정
	 * @param banner
	 * @return
	 */
	@RequestMapping("/admin/banner/updateContents.kh")
	public String modifyBanner(@ModelAttribute Banner banner) {
		int result = bService.updateContents(banner);
		if(result > 0) {
			return "redirect:/admin/banner/list.kh";
		}else {
			return "common/errorPage";
		}
	}
	
	
	/**
	 * 배너 이미지 수정 뷰
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/admin/banner/imageRegister.kh", method = RequestMethod.GET)
	public ModelAndView  showChangeBanner(
			@RequestParam("bannerNo") int bannerNo
			,ModelAndView mv) {
		Banner banner = bService.printOneBanenr(bannerNo);
		mv.addObject("banner", banner);
		mv.setViewName("admin/banner/bannerImageRegister");
		return mv;
	}
	
	
	/** 배너 이미지 업데이트
	 * 
	 * @param mv
	 * @param banner
	 * @param uploadFile
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/admin/banner/updateImage.kh", method = RequestMethod.POST)
	public String modifyBannerImage(ModelAndView mv
			,@ModelAttribute Banner banner
			,@RequestParam(value = "uploadFile", required = false) 
							MultipartFile uploadFile
			, HttpServletRequest request) { // resources 경로 가져오려고
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\images\\slider"; // 저장경로 지정
			String bannerFileName = uploadFile.getOriginalFilename();
			
			try {
				if (!bannerFileName.equals("")) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					File file = new File(savePath);
					String bannerRename = sdf.format(new Date(System.currentTimeMillis())) + "."
							+ bannerFileName.substring(bannerFileName.lastIndexOf(".") + 1);// .다음부터 끝까지 잘라서 반환
					if (!file.exists()) {
						file.mkdir(); // 경로 폴더가 없으면 폴더 생성
					}
					uploadFile.transferTo(new File(savePath + "\\" + bannerRename));
					String bannerpath = savePath + "\\" + bannerRename;// 절대경로

					banner.setBannerFileName(bannerFileName);
					banner.setBannerRename(bannerRename);
					banner.setBannerPath(bannerpath);
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		int result = bService.updateImage(banner);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	/**
	 *  배너 리스트 뷰
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="admin/banner/list.kh", method=RequestMethod.GET)
	public ModelAndView showBannerWriteAndList(ModelAndView mv) {
		
		List<Banner> bList = bService.printAllBanner();
		if (!bList.isEmpty()) {
			mv.addObject("bList", bList);
			mv.setViewName("/admin/banner/list");
		} else if (bList.isEmpty()) {
			mv.setViewName("/admin/banner/list");
		} else {
			mv.addObject("msg", "실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	/**
	 *  배너 등록
	 * @param mv
	 * @param banner
	 * @param uploadFile
	 * @param request
	 * @return
	 */
	@RequestMapping(value="admin/banner/register.kh", method=RequestMethod.POST)
	public ModelAndView registerBanner(ModelAndView mv
									,@ModelAttribute Banner banner
									,@RequestParam(value = "uploadFile", required = false) 
													MultipartFile uploadFile
									, HttpServletRequest request) { // resources 경로 가져오려고
		
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\slider"; // 저장경로 지정
		String bannerFileName = uploadFile.getOriginalFilename();
		
		try {
			if (!bannerFileName.equals("")) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				File file = new File(savePath);
				String bannerRename = sdf.format(new Date(System.currentTimeMillis())) + "."
						+ bannerFileName.substring(bannerFileName.lastIndexOf(".") + 1);// .다음부터 끝까지 잘라서 반환
				if (!file.exists()) {
					file.mkdir(); // 경로 폴더가 없으면 폴더 생성
				}
				uploadFile.transferTo(new File(savePath + "\\" + bannerRename));
				String bannerpath = savePath + "\\" + bannerRename;// 절대경로

				banner.setBannerFileName(bannerFileName);
				banner.setBannerRename(bannerRename);
				banner.setBannerPath(bannerpath);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		int chkBanner = bService.chkBanner(banner.getBannerNo());
			if (chkBanner > 0) { // 기존 배너 있으면 업데이트
				int result = bService.renewBanner(banner);
			} else { // 기존 배너 없으면 인서트
				int result = bService.registerBanner(banner);
			}
		mv.setViewName("redirect:/admin/banner/list.kh");
		return mv;
	}
	
	/**
	 * 배너 광고 메일 뷰
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="admin/bannerMail.kh", method = RequestMethod.GET)
	public ModelAndView  showBannerMail(ModelAndView mv) {
		mv.setViewName("admin/banner/bannerMail");
		return mv;
	}
	
	/**
	 * 배너 광고 메일 보내기
	 * @param mv
	 * @param info
	 * @return
	 */
	@RequestMapping(value="admin/bannerMailSend.kh", method = RequestMethod.POST)
	public ModelAndView sendMail(ModelAndView mv, @ModelAttribute MailInfo info) {
		
		try {
			mailSender.mailSender(info);
			mv.setViewName("home");
		} catch (Exception e) {
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}