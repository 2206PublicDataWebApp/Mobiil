package com.kh.mobiil.space.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.host.service.HostService;
import com.kh.mobiil.partner.domain.Page;
import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.space.domain.Heart;
import com.kh.mobiil.space.domain.HostReply;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Search;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;
import com.kh.mobiil.space.service.SpaceService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class SpaceController {
	
	@Autowired
	private SpaceService sService;
	@Autowired
	private HostService hService;
	
	// 공간 리스트 조회
	@RequestMapping(value="/space/spaceList.kh", method=RequestMethod.GET)
	public ModelAndView spaceListView(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
		// 페이징
		Search search = new Search();
		int currentPage = (page != null) ? page : 1;
		int totalCount = sService.getTotalCount(search);
		int naviLimit = 5;
		int boardLimit = 9;
		Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
		RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
		
		List<Space> sList = sService.printSpace(rowBounds);
		if(!sList.isEmpty()) {
			mv.addObject("urlVal", "spaceList");
			mv.addObject("search", search);
			mv.addObject("paging", paging);
			mv.addObject("sList", sList);
		}
		mv.setViewName("space/spaceList");
		return mv;
	}
	
	//찜많은순 조회
	@ResponseBody
	@RequestMapping(value="/space/heartDesc.kh", method=RequestMethod.GET)
	public ModelAndView heartSortView(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
		// 페이징
			Search search = new Search();
			int currentPage = (page != null) ? page : 1;
			int totalCount = sService.getTotalCount(search);
			int naviLimit = 5;
			int boardLimit = 9;
			Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
			RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
			
			List<Space> sList = sService.printHeartDesc(rowBounds);
			if(!sList.isEmpty()) {
				mv.addObject("urlVal", "heartDesc");
				mv.addObject("search", search);
				mv.addObject("paging", paging);
				mv.addObject("sList", sList);
			}
			mv.setViewName("space/spaceList");
			return mv;
	}
	
	//리뷰많은순 조회
	@ResponseBody
	@RequestMapping(value="/space/reviewDesc.kh", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public ModelAndView reviewSortView(
			ModelAndView mv
			,@RequestParam(value="searchArea", required=false) String searchArea
			,@RequestParam(value="searchValue", required=false) String searchValue
			,@RequestParam(value="minNum", required=false) Integer minNum
			,@RequestParam(value="maxNum", required=false) Integer maxNum
			,@RequestParam(value="page", required=false) Integer page) {
		
		if(searchArea == "" && searchValue == "" && minNum == null && maxNum == null) {
			// 페이징
			Search search = new Search();
			int currentPage = (page != null) ? page : 1;
			int totalCount = sService.getTotalCount(search);
			int naviLimit = 5;
			int boardLimit = 9;
			Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
			RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
			
			List<Space> sList = sService.printRivewDesc(rowBounds);
			if(!sList.isEmpty()) {
				mv.addObject("urlVal", "reviewDesc");
				mv.addObject("search", search);
				mv.addObject("paging", paging);
				mv.addObject("sList", sList);
			}
		} else if(searchArea != "" && searchValue == "" && minNum == null && maxNum == null){
			// 페이징
			Search search = new Search(searchArea,"",0,0);
			int currentPage = (page != null) ? page : 1;
			int totalCount = sService.getTotalCountReviewDesc(search);
			int naviLimit = 5;
			int boardLimit = 9;
			Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
			RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
			System.out.println(totalCount);
			List<Space> sList = sService.printRivewDescByArea(search, rowBounds);
			if(!sList.isEmpty()) {
				mv.addObject("urlVal", "reviewDesc");
				mv.addObject("search", search);
				mv.addObject("paging", paging);
				mv.addObject("sList", sList);
			}
		} else if(searchArea != "" && searchValue != "" && minNum == null && maxNum == null) {
			// 페이징
			Search search = new Search(searchArea, searchValue,0,0);
			int currentPage = (page != null) ? page : 1;
			int totalCount = sService.getTotalCountReviewDesc(search);
			int naviLimit = 5;
			int boardLimit = 9;
			Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
			RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
			
			List<Space> sList = sService.printRivewDescByValue(search, rowBounds);
			if(!sList.isEmpty()) {
				mv.addObject("urlVal", "reviewDesc");
				mv.addObject("search", search);
				mv.addObject("paging", paging);
				mv.addObject("sList", sList);
			}
		} else if(minNum != 0 || maxNum != 0){
			if(searchArea == "" && searchValue == "") {
				if(minNum == null) {
					minNum = 0;
				}
				if(maxNum == null) {
					maxNum = 999999999;
				}
				Search search = new Search("","",minNum, maxNum);
				int currentPage = (page != null) ? page : 1;
				int totalCount = sService.getTotalCountReviewDesc(search);
				int naviLimit = 5;
				int boardLimit = 9;
				Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
				RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
			}else if(searchArea != "" && searchValue == "") {
				if(minNum == null) {
					minNum = 0;
				}
				if(maxNum == null) {
					maxNum = 999999999;
				}
				Search search = new Search(searchArea,"", minNum, maxNum);
			}else if(searchArea == "" && searchValue != "") {
				if(minNum == null) {
					minNum = 0;
				}
				if(maxNum == null) {
					maxNum = 999999999;
				}
				Search search = new Search("",searchValue, minNum, maxNum);
			}else if(searchArea != "" && searchValue != ""){
				if(minNum == null) {
					minNum = 0;
				}
				if(maxNum == null) {
					maxNum = 999999999;
				}
				Search search = new Search(searchArea, searchValue, minNum, maxNum);
			}
		}
		mv.setViewName("space/spaceList");
			return mv;
	}
	
	//공간 검색
	@RequestMapping(value="/space/spaceSearch.kh", method=RequestMethod.GET)
	public ModelAndView spaceSearchList(
			ModelAndView mv
			, @RequestParam("searchArea") String searchArea
			, @RequestParam("searchValue") String searchValue
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			//페이징
			Search search = new Search(searchArea, searchValue,0,0);
			int currentPage = (page != null) ? page : 1;
			int totalCount = sService.getTotalCount(search);
			int naviLimit = 5;
			int boardLimit = 9;
			Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
			RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
			
			List<Space> sList = sService.printAllByValue(search, rowBounds);
			if(!sList.isEmpty()) {
				mv.addObject("sList", sList);
			}else {
				mv.addObject("sList", null);
			}
			mv.addObject("urlVal", "spaceSearch");
			mv.addObject("search", search);
			mv.addObject("paging", paging);
			mv.setViewName("space/spaceList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}

	//지역 검색
	@RequestMapping(value="/space/spaceArea.kh", method=RequestMethod.GET)
	public ModelAndView spaceAreaList(
			ModelAndView mv
			, @RequestParam("searchArea") String searchArea
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			// 페이징
			Search search = new Search(searchArea,"",0,0);
			int currentPage = (page != null) ? page : 1;
			int totalCount = sService.getTotalCount(search);
			int naviLimit = 5;
			int boardLimit = 9;
			Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
			RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
			
			List<Space> sList = sService.printByArea(search, rowBounds);
			if(!sList.isEmpty()) {
				mv.addObject("sList", sList);
			}else {
				mv.addObject("sList", null);
			}
			mv.addObject("urlVal", "spaceArea");
			mv.addObject("search", search);
			mv.addObject("paging", paging);
			mv.setViewName("space/spaceList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}

	// 가격 검색
	@RequestMapping(value="/space/spacePrice.kh", method=RequestMethod.GET)
	public ModelAndView spacePriceList(
			ModelAndView mv
			, @RequestParam(value="minNum", required=false) Integer minNum
			, @RequestParam(value="maxNum", required=false) Integer maxNum
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			if(minNum == null) {		//최대금액만 적었을 때
				minNum = 0;				//최소금액 자동으로 0 입력
			}
			if(maxNum == null) {		//최소금액만 적었을 때
				maxNum = 999999999;		//최대금액 자동으로 999999999 입력
			}
			// 페이징
			Search search = new Search("","",minNum, maxNum);
			int currentPage = (page != null) ? page : 1;
			int totalCount = sService.getPriceCount(search);
			int naviLimit = 5;
			int boardLimit = 9;
			Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
			RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
			
			List<Space> sList = sService.printByPrice(search, rowBounds);
			if(!sList.isEmpty()) {
				mv.addObject("sList", sList);
			}else {
				mv.addObject("sList", null);
			}
			mv.addObject("urlVal", "spacePrice");
			mv.addObject("search", search);
			mv.addObject("paging", paging);
			mv.setViewName("space/spaceList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}

	// 공간 상세 조회
	@RequestMapping(value="/space/spaceDetail.kh", method=RequestMethod.GET)
	public ModelAndView spaceDetail(
			ModelAndView mv
			, @RequestParam(value="spaceNo") Integer spaceNo
			, @RequestParam(value="page", required=false) Integer page
			, HttpSession session) {
		try {
			Space space = sService.printOneByNo(spaceNo);
			Host hOne = hService.getHostInfo(space.getHostEmail());
			String memberNick = hOne.getMemberNick();
			List<SpaceImg> iList = sService.printImg(spaceNo);
			session.setAttribute("spaceNo", space.getSpaceNo());
			session.setAttribute("spaceName", space.getSpaceName());
			session.setAttribute("hostEmail", space.getHostEmail());
			mv.addObject("space", space);
			mv.addObject("iList", iList);
			mv.addObject("memberNick", memberNick);
			mv.addObject("page", page);
			mv.setViewName("space/spaceDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	//리뷰 조회
	@ResponseBody
	@RequestMapping(value="/space/reviewList.kh", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public String spaceReviewList(Integer spaceNo) {
		List<Review> rList = sService.printReview(spaceNo);
		if(!rList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			return gson.toJson(rList);
		}
		return null;
	}
	
	//리뷰 이미지 조회
	@ResponseBody
	@RequestMapping(value="/space/imgList.kh", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public String reviewImgList(@RequestParam(value="reviewNo") Integer reviewNo) {
		List<ReviewImg> riList = sService.printReviewImg(reviewNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(riList);
	}
	
	//호스트 댓글 조회
	@ResponseBody
	@RequestMapping(value="/space/replyList.kh", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public String spaceReplyList(@RequestParam(value="reviewNo") Integer reviewNo) {
		List<HostReply> hrList = sService.printReply(reviewNo);
		if(!hrList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			return gson.toJson(hrList);
		}
		return null;
	}
	
	//호스트 댓글 등록
	@ResponseBody
	@RequestMapping(value="/space/insertReply.kh", produces="application/json;charset=utf-8", method=RequestMethod.POST)
	public int insertReply(@RequestParam(value="reviewNo") int reviewNo
			,@RequestParam(value="replyWriter") String replyWriter
			,@RequestParam(value="replyContents") String replyContents
			,@RequestParam(value="hostEmail") String hostEmail
			,HostReply hostReply) {
		hostReply.setReplyWriter(replyWriter);
		hostReply.setReplyContents(replyContents);
		hostReply.setHostEmail(hostEmail);
		hostReply.setReviewNo(reviewNo);
		int result = sService.insertReply(hostReply);
		return result;
	}
	
	//호스트 댓글 수정
	@ResponseBody
	@RequestMapping(value="/space/modifyReply.kh", method=RequestMethod.POST)
	public int modifyReply(@ModelAttribute HostReply hostReply) {
		int result = sService.updateReply(hostReply);
		return result;
	}
	
	//호스트 댓글 삭제
	@ResponseBody
	@RequestMapping(value="/space/deleteReply.kh", method=RequestMethod.GET)
	public String deleteReply(@RequestParam("replyNo") Integer replyNo) {
		int result = sService.deleteReply(replyNo);
		if(result > 0) {
			return "O";
		}else {
			return "X";
		}
	}

	//예약 날짜,시간 유효성 체크
	@ResponseBody
	@RequestMapping(value="/space/checkTime.kh", method=RequestMethod.GET)
	public String checkTime(String start, String end, String reservDate) {
		int result = sService.checkTime(start, end, reservDate);
		return String.valueOf(result);
	}

	//찜 여부 체크
	@ResponseBody
	@RequestMapping(value="/space/checkHeart.kh", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public int checkHeart(@RequestParam(value="memberEmail") String memberEmail
			, @RequestParam(value="spaceNo") Integer spaceNo) {
		int result = sService.checkHeart(spaceNo, memberEmail);
		return result;
	}
	
	//찜 추가
	@ResponseBody
	@RequestMapping(value="/space/heart.kh", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public int insetHeart(@RequestParam(value="memberEmail") String memberEmail
			, @RequestParam(value="spaceNo") Integer spaceNo
			, @RequestParam(value="spaceName") String spaceName
			, @RequestParam(value="spaceFileRename") String spaceFileRename
			, @RequestParam(value="spaceStatus") String spaceStatus
			, Heart heart) {
		heart.setMemberEmail(memberEmail);
		heart.setSpaceNo(spaceNo);
		heart.setSpaceName(spaceName);
		heart.setSpaceFileRename(spaceFileRename);
		heart.setSpaceStatus(spaceStatus);
		int result = sService.insertHeart(heart);
		return result;
	}
	
	//찜 삭제
	@ResponseBody
	@RequestMapping(value="/space/deleteHeart.kh", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public int deleteHeart(@RequestParam(value="memberEmail") String memberEmail
			, @RequestParam(value="spaceNo") Integer spaceNo
			, Heart heart) {
		heart.setMemberEmail(memberEmail);
		heart.setSpaceNo(spaceNo);
		int result = sService.deleteHeart(heart);
		return result;
	}
	
	//결제페이지로 날짜,시간,가격 출력
	@RequestMapping(value="/space/payment.kh", method=RequestMethod.GET)
	public ModelAndView payment( ModelAndView mv
			, @RequestParam(value="sDate") Date sDate
			, @RequestParam(value="start") int start
			, @RequestParam(value="end") int end
			, @RequestParam(value="price") int price
			, HttpSession session) {
		try {
			mv.addObject("sDate",sDate);
			mv.addObject("start",start);
			mv.addObject("end",end);
			mv.addObject("price",price);
			mv.setViewName("space/payment");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	//결제가 완료시 DB 예약 테이블에 정보 저장 및 문자 전송
	@ResponseBody
	@RequestMapping(value="/space/paymentResult.kh", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public String registerReservation(Reservation rsv
			, @RequestParam(value="reservNo") String reservNo , 	 @RequestParam(value="price") Integer price
			, @RequestParam(value="paymentDate") String paymentDate, @RequestParam(value="memberName") String memberName
			, @RequestParam(value="memberPhone") String memberPhone, @RequestParam(value="memberEmail") String memberEmail
			, @RequestParam(value="spaceNo") Integer spaceNo, 		 @RequestParam(value="reservDate") String reservDate
			, @RequestParam(value="revStart") Integer revStart, 	 @RequestParam(value="revEnd") Integer revEnd) {
		JSONObject obj = new JSONObject();
			try {
					SimpleDateFormat format = new SimpleDateFormat("yyyy. MM. dd.");
					SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
					java.util.Date rDate = format.parse(reservDate);
					java.util.Date pDate = format2.parse(paymentDate);
					String rsvD = format2.format(rDate);
					String pmD = format2.format(pDate);
					Date rsvDate = Date.valueOf(rsvD);
					Date pmDate = Date.valueOf(pmD);
					Space space = sService.printOneByNo(spaceNo);
					rsv.setReservationNo(reservNo);
					rsv.setMemberEmail(memberEmail);
					rsv.setHostEmail(space.getHostEmail());
					rsv.setSpaceNo(spaceNo);
					rsv.setSpaceName(space.getSpaceName());
					rsv.setSpaceAddress(space.getAddress2()+" "+space.getAddress3()+" "+space.getAddress4());
					rsv.setPrice(price);
					rsv.setReservationDate(rsvDate);
					rsv.setMemberName(memberName);
					rsv.setMemberPhone(memberPhone);
					rsv.setPaymentDate(pmDate);
					rsv.setRevStart(revStart);
					rsv.setRevEnd(revEnd);
					
					int result = sService.registerReservation(rsv);
					
					if(result > 0) {
						// DB에 저장이 완료되면 문자 전송
						obj.put("reservationNo", rsv.getReservationNo());
						String api_key = "NCSYNTZGVXTRPQ73";
						String api_secret = "3VGV1DFPGXT9VJIVNRAQCLZOKALJDTT6";
						Message coolsms = new Message(api_key, api_secret);
						HashMap<String, String> set = new HashMap<String, String>();
						set.put("to", memberPhone); 				// 받는 번호
						set.put("from", "01067462778"); 			// 보내는 번호
						set.put("text", "[Mobiil]"+rsvDate+" "+revStart+"시~"+revEnd+"시 예약이 완료되었습니다."); // 문자내용
						set.put("type", "SMS"); 					// 문자 타입
						set.put("app_version", "test app 1.2");
						try {
							JSONObject rs = coolsms.send(set); // 보내기&전송결과받기
							System.out.println(rs.toString());
						} catch (CoolsmsException e) {
							System.out.println(e.getMessage());
							System.out.println(e.getCode());
						}
					}else {
					}
			} catch (Exception e) {
			}
		return obj.toString();
	}
	
	//예약완료 정보 조회
	@RequestMapping(value="/space/reservationInfo.kh", method=RequestMethod.GET)
	public ModelAndView reservationInfo(String reservationNo, ModelAndView mv) {
		try {
			Reservation rsv = sService.printRsv(reservationNo);
			mv.addObject("rsv", rsv);
			mv.setViewName("space/reservationInfo");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
}