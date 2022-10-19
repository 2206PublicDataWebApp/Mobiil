package com.kh.mobiil.host.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;

import regervation.Reservation;

@Controller
public class HostController {
	
	@Autowired
	private HostService hService;
	
	/**
	 * 호스트 페이지.jsp
	 * @return
	 */
	@RequestMapping(value="/host/hostPage.mobiil", method = RequestMethod.GET)
	public String hostInfoView() {
		return "host/hostPage";
	}
	
	/**
	 * 호스트 정보 수정.jsp
	 * @return
	 */
	@RequestMapping(value="/host/hostModifyView.mobiil", method = RequestMethod.GET)
	public String hostModifyView() {
		return "host/hostModify";
	}

	/**
	 * 예약확인.jsp
	 * @return
	 */
	@RequestMapping(value="/host/reservationCheckView.mobiil", method = RequestMethod.GET)
	public String reservationCheckView() {
		return "host/reservationCheck";
	}
	
	/**
	 * 예약 리스트.jsp
	 * @return
	 */
	@RequestMapping(value="/host/regervationListView.mobiil", method = RequestMethod.GET)
	public String regervationView() {
		return "host/regervationList";
	}

	/**
	 * 공간 업로드.jsp
	 * @return
	 */
	@RequestMapping(value="/host/spaceInsertView.mobiil", method = RequestMethod.GET)
	public String spaceInsertView() {
		return "host/spaceInsert";
	}

	/**
	 * 공간 리스트.jsp
	 * @return
	 */
	@RequestMapping(value="/host/spaceListView.mobiil", method = RequestMethod.GET)
	public String spaceListView() {
		return "host/spaceInsert";
	}
	
	/**
	 * 공간 수정.jsp
	 * @param spaceNo
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/host/spaceInsertView.mobiil", method = RequestMethod.GET)
	public ModelAndView spaceModifyView(
			@RequestParam("spaceNo") Integer spaceNo, ModelAndView mv) {
		try {
			Space space = hService.spaceByNo(spaceNo);
			List<SpaceImg> spaceImg = hService.spaceImgByNo(spaceNo);
			if(space != null && !spaceImg.isEmpty()) {
				mv.addObject("sOne", space);
				mv.addObject("sImg", spaceImg);
				mv.setViewName("host/spaceModify");
			}
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	/**
	 * 호스트 정보
	 * @param mv
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/host/hostInfo.mobiil", method = RequestMethod.GET)
	public ModelAndView hostInfo(ModelAndView mv, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			Host host = (Host)request.getAttribute("loginHost");
			String hostEmail = host.getHostEmail();
			Host hOne = hService.getHostInfo(hostEmail);
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
	
	/**
	 * 호스트 정보 수정
	 * @param mv
	 * @param host
	 * @return
	 */
	@RequestMapping(value="/host/hostModify.mobiil", method = RequestMethod.GET)
	public ModelAndView hostModify(ModelAndView mv, @ModelAttribute Host host) {
		try {
			int result = hService.hostModify(host);
			if(result > 0) {
				mv.setViewName("redirect:/host/hostPage");
			}else {
				mv.addObject("msg", "정보수정 실패");
				mv.setViewName("common/errorPage");
				
			}
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 예약확인
	 */
	@RequestMapping(value="/host/reservationCheck.mobiil", method = RequestMethod.GET)
	public ModelAndView checkedRegister(ModelAndView mv) {
		
		return mv;
	}
	
	
	
	
	/**
	 * 예약 상세정보
	 */
	public void registerDetail() {
		
	}
	
	
	/**
	 * 예약 리스트
	 * @param mv
	 * @param page
	 * @return
	 */
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
				mv.addObject("rList",rList);
				mv.setViewName("host/regervationList");
			}
		}catch (Exception e) {
			mv.addObject("msg",e.toString());
			mv.setViewName("/common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 공간 업로드
	 * @param mv
	 * @param space
	 * @param uploadFile
	 * @param mRequest
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/host/spaceInsert.mobiil", method = RequestMethod.GET)
	public ModelAndView Spaceinsert(
			ModelAndView mv,
			@ModelAttribute Space space,
			@RequestParam(value="uploadFile", required=false)  List<MultipartFile> uploadFile,
			MultipartHttpServletRequest mRequest,
			HttpServletRequest request) {
		try {
			int imgNo = 1;
			SpaceImg spaceImg = null;
			
			int result = hService.insertSpace(space);
			
			for(MultipartFile mf : uploadFile) {
				String spaceFileName = mf.getOriginalFilename();	// 파일명
				if(!spaceFileName.equals("")) {
					String root = request.getSession().getServletContext().getRealPath("resources");
					String savePath = root + "\\spaceuploadFiles";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String spaceFileRename = sdf.format(new Date(System.currentTimeMillis())) + "."
							+ spaceFileName.substring(spaceFileName.lastIndexOf(".") + 1);
					File file = new File(savePath);
					if(!file.exists()) {
						file.mkdir();
					}
					mf.transferTo(new File(savePath + "\\" + spaceFileRename));
					String spaceFilepath = savePath + "\\" + spaceFileRename;
					spaceImg = new SpaceImg();
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
	
	/**
	 * 공간 리스트
	 * @param mv
	 * @param request
	 * @param page
	 * @return
	 */
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
		List<Space> sList = hService.spaceList(currentPage, boardLimit);
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
	
	/**
	 * 공간 수정
	 * @param mv
	 * @param space
	 * @param reloadFile
	 * @param spaceNoArr
	 * @param spaceFileRenameArr
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/host/spaceModify.mobiil", method = RequestMethod.POST)
	public ModelAndView spaceModify(
			ModelAndView mv, 
			@ModelAttribute Space space,
			@RequestParam(value="reloadFile") List<MultipartFile> reloadFile,
			@RequestParam("spaceImgNo") int[] spaceNoArr,
			@RequestParam("spaceFileRename") String[] spaceFileRenameArr,
			HttpServletRequest request) {
		int num = 0;
		SpaceImg spaceImg = null;
		int result = hService.spaceModify(space);
		try {
			for(MultipartFile mf : reloadFile ) {
				String spaceFileName = mf.getOriginalFilename();
				if(!spaceFileName.equals("")) {
					String root = request.getSession().getServletContext().getRealPath("resources");
					String savePath = root + "\\spaceuploadFiles";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					
					String sFileRename = spaceFileRenameArr[num];
					File file = new File(savePath + "\\" + sFileRename);
					if(file.exists()) {
						file.delete();
					}
					
					String spaceFileRename = sdf.format(new Date(System.currentTimeMillis()))+ num + "." + spaceFileName.substring(spaceFileName.lastIndexOf(".")+1);
					file = new File(savePath);
					mf.transferTo(new File(savePath+"\\"+spaceFileRename));
					String spaceFilePath = savePath+"\\"+spaceFileRename;
					spaceImg = new SpaceImg();
					spaceImg.setSpaceFileName(spaceFileName);
					spaceImg.setSpaceFileRename(spaceFileRename);
					spaceImg.setSpaceFilePath(spaceFilePath);
					int imgNo = spaceNoArr[num];
					spaceImg.setSpaceImgNo(imgNo);
					num = num + 1;
				}
					int result2 = hService.spaceImgModify(spaceImg);
					mv.setViewName("redirect:/host/spaceList.mobiil");
			}
		}catch (Exception e) {

		}
		return mv;
		
	}
	
	/**
	 * 공간 삭제
	 * @param mv
	 * @param spaceNo
	 * @return
	 */
	@RequestMapping(value="/host/spaceRemove.mobiil", method = RequestMethod.GET)
	public ModelAndView removeSpace(ModelAndView mv, @RequestParam("spaceNo") Integer spaceNo) {
		try {
			int result = hService.spaceRemove(spaceNo);
			if(result>0) {
				mv.setViewName("redirect:/host/spaceList.mobiil");
			}
			return mv;
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common.errorPage");
		}
		return mv;
	}
}



















