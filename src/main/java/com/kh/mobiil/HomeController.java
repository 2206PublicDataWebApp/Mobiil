package com.kh.mobiil;

import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mobiil.banner.domain.Banner;
import com.kh.mobiil.banner.service.BannerService;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BannerService bService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale
			, ModelAndView mv) {
		
		/**
		 *  실재하는 배너만 출력
		 */
		ArrayList<Banner> bList = new ArrayList<Banner>();
		for(int i = 1; i < 6; i++) {
			Banner oneBanner = bService.printOneBanenr(i);
			if(!oneBanner.toString().contains("null")) {
				bList.add(oneBanner);
			}
		}
		mv.addObject("bList", bList);
		mv.setViewName("home");
		
		return mv;
	}
	
	@RequestMapping(value = "/home/login.kh", method = RequestMethod.GET) // 로그인,회원가입 페이지(개인/기업 선택)
	public String homeLogin(Model model) {
		return "login/choose";
	}
	
}
