package com.kh.mobiil.host.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.host.service.HostService;
import com.kh.mobiil.partner.domain.Page;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;


@Controller
public class HostController {
	
	@Autowired
	private HostService hService;
	
	
	/**
	 * 호스트 정보 수정.jsp
	 * @return
	 */
	@RequestMapping(value="/host/hostModifyView.mobiil", method = RequestMethod.GET)
	public String hostModifyView() {
		return "host/hostModify";
	}

	/**
	 * 예약 확인.jsp
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
		return "host/reservationList";
	}
	
	/**
	 * 예약수정.jsp
	 * @return
	 */
	@RequestMapping(value="/host/reservationModifyView.mobiil", method = RequestMethod.GET)
	public ModelAndView reservationModifyView(@RequestParam("reservationNo") String reservationNo, ModelAndView mv) {
		try {
			Reservation reservation = hService.regervationByNo(reservationNo);
			System.out.println(reservationNo);
			System.out.println(reservation);
			if(reservation != null) {
				mv.addObject("rOne", reservation);
				mv.setViewName("host/reservationModify");
			}
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common.errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 정산 확인 
	 * @return
	 */
	@RequestMapping(value="/host/profitsCheckView.kh", method = RequestMethod.GET)
	public String profitsCheckView() {
		return "host/profitsCheck";
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
	 * 공간 수정.jsp
	 * @param spaceNo
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/host/spaceModifyView.mobiil", method = RequestMethod.GET)
	public ModelAndView spaceModifyView(@RequestParam("spaceNo") Integer spaceNo, ModelAndView mv) {
		try {
			Space space = hService.spaceByNo(spaceNo);
			List<SpaceImg> spaceImg = hService.spaceImgByNo(spaceNo);
			System.out.println(space);
			System.out.println(spaceImg);
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
			HttpSession session = request.getSession();
			Host host = (Host)session.getAttribute("loginHost");
			String hostEmail = host.getHostEmail();
			Host hOne = hService.getHostInfo(hostEmail);
			// 오늘날짜 구하기
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			Calendar c1 = Calendar.getInstance();
//			String today = sdf.format(c1.getTime());
//			System.out.println(today);
//			// 오늘날짜 기준으로 7일전 날짜구하기
//			c1.add(c1.DATE, -7);
//			String today7 = sdf.format(c1.getTime());
//			System.out.println(today7);
			if(hOne != null) {
				// addObject * 2 -> 오늘날짜, 7일전 날짜
//				mv.addObject("today", today);
//				mv.addObject("today7", today7);
				mv.addObject("hOne", hOne);
				mv.setViewName("/host/hostPage");
			} else {
			mv.addObject("msg", "페이지를 열 수 없습니다.");
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
	@RequestMapping(value="/host/hostModify.mobiil", method = RequestMethod.POST)
	public ModelAndView hostModify(
			ModelAndView mv, 
			@ModelAttribute Host host,
			@RequestParam(value="reloadFile") MultipartFile reloadFile,
			@RequestParam("regPhotoRename") String hostFile,
			HttpServletRequest request) {
		try {
			String hostFileName = reloadFile.getOriginalFilename();
			if(!hostFileName.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\hostFiles";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				//기존 파일 삭제
				String hFileRename = hostFile;
				File file = new File(savePath + "\\" + hFileRename);
				if(file.exists()) {
					file.delete();
			}
				//새로운 파일 등록
				String hostFileRename = sdf.format(new Date(System.currentTimeMillis()))+"."+hostFileName.substring(hostFileName.lastIndexOf(".")+1);
				file = new File(savePath);
				reloadFile.transferTo(new File(savePath+"\\"+hostFileRename));
				String hostFilePath = savePath+"\\"+hostFileRename;
				host.setRegPhotoName(hostFileName);
				host.setRegPhotoRename(hostFileRename);
				host.setRegPhotoPath(hostFilePath);
			}
			int result = hService.hostModify(host);
			if(result > 0) {
				mv.setViewName("redirect:/host/hostInfo.mobiil");
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
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/host/reservationCheck.mobiil", method = RequestMethod.GET)
	public ModelAndView checkedRegister(ModelAndView mv) {
		// 예약 리스트 필요함
		// 일자에 맞춰 달력 id에 넣어줘야됨
		List<Reservation> rList = hService.regervationList();
		try {
			if(!rList.isEmpty()) {
				mv.addObject("rList", rList);
				mv.setViewName("host/reservationCheck");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("commom/errorPage");
		}
		return mv;
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
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		////////////////////////////////////////////////////////////
		List<Reservation> rList = hService.regervationList(currentPage, boardLimit);
		try {
			if(!rList.isEmpty()) {
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("startNavi", startNavi);
				mv.addObject("endNavi", endNavi);
				mv.addObject("rList",rList);
				mv.setViewName("host/reservationList");
			}
		}catch (Exception e) {
			mv.addObject("msg",e.toString());
			mv.setViewName("/common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 예약 수정
	 * @param mv
	 * @param reservation
	 * @param reservationDateStr
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/host/reservationModify.mobiil", method = RequestMethod.POST)
	public ModelAndView reservationModify(
			ModelAndView mv
			,@ModelAttribute Reservation reservation
			,@RequestParam("reservationDateStr") String reservationDateStr
			, HttpServletRequest request) {
		try {
			reservation.setReservationDate(java.sql.Date.valueOf(reservationDateStr));	// String -> Date
			int result = hService.reservationModify(reservation);
			if(result > 0) {
				mv.setViewName("redirect:/host/registList.mobiil");
			}
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 예약 삭제
	 * @param reservationNo
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/host/reservationRemove.mobiil", method = RequestMethod.GET)
	public ModelAndView reservationRemove(@RequestParam("reservationNo") String reservationNo, ModelAndView mv) {
		try {
			int result = hService.reservationRemove(reservationNo);
			if (result > 0) {
				mv.setViewName("redirect:/host/registList.mobiil");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common.errorPage");
		}
		return mv;
	}
	
	/**
	 * 정산확인 - > 조회기간내 예약 리스트 출력 후 금액 합산 보여주기
	 * @param mv
	 * @param d1
	 * @param d2
	 * @return
	 */			
	@RequestMapping(value="/host/profitsCheck.kh", method = RequestMethod.GET)
	public ModelAndView profitsCheck(
			ModelAndView mv,
			@RequestParam("date1") String d1,
			@RequestParam("date2") String d2) {
		try {
			// http://127.0.0.1:1111/host/profitsCheck.kh?date1=20221019&date2=20221024
			java.sql.Date date1 = java.sql.Date.valueOf(d1);	// String -> Date
			java.sql.Date date2 = java.sql.Date.valueOf(d2);	// String -> Date
			List<Reservation> rList = hService.rListByDate(date1, date2);
			System.out.println(rList);
			if(!rList.isEmpty()) {
				mv.addObject("rList", rList);
				mv.setViewName("host/profitsCheck"); // redirect ??
			}
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
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
	@RequestMapping(value="/host/spaceInsert.mobiil", method = RequestMethod.POST)
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
				mv.setViewName("redirect:/host/spaceList.mobiil");
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
	public ModelAndView spaceList(ModelAndView mv, HttpServletRequest request, @RequestParam(value="page", required = false) Integer page) {
		
		//----------------------페이징
		int currentPage = (page != null) ? page : 1;
		int totalCount = hService.getSpaceTotalCount(); 
		int naviLimit = 5;
		int boardLimit = 9;
		Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
		RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
		
		//-------------------- 리스트 출력
		List<Space> sList = hService.spaceList(rowBounds);
		
		//-------------------- view세팅
				mv.addObject("paging", paging);
				mv.addObject("sList",sList);
				mv.setViewName("host/spaceList_host");
				
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
			} catch (Exception e) {

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
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}



















