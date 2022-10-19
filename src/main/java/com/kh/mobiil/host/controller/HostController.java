package com.kh.mobiil.host.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.host.service.HostService;

import domain.space;
import domain.spaceImg;
import regervation.Reservation;

@Controller
public class HostController {
	
	@Autowired
	private HostService hService;
	

	// 호스트 페이지.jsp
	@RequestMapping(value="/host/hostPage.mobiil", method = RequestMethod.GET)
	public String hostInfoView() {
		return "host/hostPage";
	}
	
	// 호스트 정보 수정.jsp
	@RequestMapping(value="/host/hostModifyView.mobiil", method = RequestMethod.GET)
	public String hostModifyView() {
		return "host/hostModify";
	}
	
	// 예약 리스트.jsp
	@RequestMapping(value="/host/regervationListView.mobiil", method = RequestMethod.GET)
	public String regervationView() {
		return "host/regervationList";
	}

	// 공간 업로드.jsp
	@RequestMapping(value="/host/spaceInsertView.mobiil", method = RequestMethod.GET)
	public String spaceInsertView() {
		return "host/spaceInsert";
	}
	
	
	// 호스트 정보
	@RequestMapping(value="/host/hostInfo.mobiil", method = RequestMethod.GET)
	public ModelAndView hostInfo(ModelAndView mv, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			Host host = (Host)request.getAttribute("loginHost");
			String hostId = host.getHostId();
			Host hOne = hService.getHostInfo(hostId);
			if(hOne != null) {
				mv.addObject("hOne", hOne);
				mv.setViewName("/host/hostpage");
			}
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 호스트 정보 수정
	@RequestMapping(value="/host/hostModify.mobiil", method = RequestMethod.GET)
	public ModelAndView hostModify(ModelAndView mv, @ModelAttribute Host host) {
		try {
			int result = hService.hostModify(host);
			if(result > 0) {
				mv.setViewName("redirect:/host/hostPage");
			}else {
				mv.addObject("msg", "ȣ��Ʈ ���� ���� ����");
				mv.setViewName("common/errorPage");
				
			}
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 예약 확인
	public void checkedRegister() {
		
	}
	
	// 예약 상세정보
	public void registerDetail() {
		
	}
	
	
	// 예약 리스트
	@RequestMapping(value="/host/registList.mobiil", method = RequestMethod.GET)
	public ModelAndView registeList(
			ModelAndView mv,
			@RequestParam(value="page", required = false) Integer page) {
		///////////////////////////////////////////////////////////
		int currentPage = (page!=null) ? page : 1;
		int totalCount = hService.getRegervationTotalCount();
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		System.out.println(currentPage+","+totalCount);
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		////////////////////////////////////////////////////////////
		List<Reservation> rList = hService.regervationList(currentPage, boardLimit);
		try {
			if(rList.isEmpty()) {
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("startNavi", startNavi);
				mv.addObject("endNavi", endNavi);
				mv.addObject("mList",rList);
				mv.setViewName("host/regervationList");
			}
		}catch (Exception e) {
			mv.addObject("msg",e.toString());
			mv.setViewName("/common/errorPage");
		}
		return mv;
	}
	
	// 공간 업로드
	@RequestMapping(value="/host/spaceInsert.mobiil", method = RequestMethod.GET)
	public ModelAndView Spaceinsert(
			ModelAndView mv,
			@ModelAttribute space space,
			@RequestParam(value="uploadFile", required=false)  List<MultipartFile> uploadFile,
			MultipartHttpServletRequest mRequest,
			HttpServletRequest request) {
		try {
			int imgNo = 1;
			spaceImg spaceImg = null;
			
			int result = hService.insertSpace(space);
			
			for(MultipartFile mf : uploadFile) {
				String spaceFileName = mf.getOriginalFilename();	// 파일명
				if(!spaceFileName.equals("")) {
					String root = request.getSession().getServletContext().getRealPath("resources");
					String savePath = root + "\\suploadFiles";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String spaceFileRename = sdf.format(new Date(System.currentTimeMillis())) + "."
							+ spaceFileName.substring(spaceFileName.lastIndexOf(".") + 1);
					File file = new File(savePath);
					if(!file.exists()) {
						file.mkdir();
					}
					mf.transferTo(new File(savePath + "\\" + spaceFileRename));
					String spaceFilepath = savePath + "\\" + spaceFileRename;
					spaceImg = new spaceImg();
					spaceImg.setSpaceFileName(spaceFileName);
					spaceImg.setSpaceFileRename(spaceFileRename);
					spaceImg.setSpaceFilePath(spaceFilepath);
					imgNo = imgNo + 1;
				}
				int result2 = hService.insertSpaceImg(spaceImg);
				mv.setViewName("host/spaceList.mobiil");
			}
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		
		return mv;
	}
	
	// 공간 리스트
	@RequestMapping(value="/host/spaceList.mobiil", method = RequestMethod.GET)
	public ModelAndView spaceList(
			ModelAndView mv, 
			HttpServletRequest request,
			@RequestParam(value="page", required = false) Integer page) {
		///////////////////////////////////////////////////////////
		int currentPage = (page!=null) ? page : 1;
		int totalCount = hService.getSpaceTotalCount();
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		System.out.println(currentPage+","+totalCount);
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
		endNavi = maxPage;
		}
		////////////////////////////////////////////////////////////
		List<space> sList = hService.spaceList(currentPage, boardLimit);
		try {
			if(!sList.isEmpty()) {
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("startNavi", startNavi);
				mv.addObject("endNavi", endNavi);
				mv.addObject("sList",sList);
				mv.setViewName("host/spaceList");
			}
		}catch (Exception e) {
			mv.addObject("msg",e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}




















