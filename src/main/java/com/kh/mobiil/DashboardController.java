package com.kh.mobiil;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.mobiil.chat.service.ChatService;
import com.kh.mobiil.host.service.HostService;
import com.kh.mobiil.member.service.MemberService;
import com.kh.mobiil.partner.service.PartnerService;
import com.kh.mobiil.review.service.ReviewService;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.service.SpaceService;

@Controller
public class DashboardController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private HostService hService;
	
	@Autowired
	private ChatService cService;
	
	@Autowired
	private PartnerService pService;
	
	@Autowired
	private ReviewService rService;
	
	@Autowired
	private SpaceService sService;
	
	
	/** 관리자페이지
	 * 
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/admin/dashboard.kh")
	public ModelAndView showDashboard(ModelAndView mv) {
		mv.setViewName("/admin/dashBoard");
		return mv;
	}
	
	/** 공간 전체 지도
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/admin/dashboard/spaceMap.kh", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String drawSpaceMap() {
		Gson gson = new Gson();
		List<Space> sList = sService.printAllSpace();
		return gson.toJson(sList);
	}
	
	/** AREA 지역 분포
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/admin/dashboard/area.kh", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String drawAreaChart() {
		// 동서남북
		int east = sService.getAreaCount("강동");
		int west = sService.getAreaCount("강서");
		int south = sService.getAreaCount("강남");
		int north = sService.getAreaCount("강북");

		JSONObject obj = new JSONObject();
		// 파이차트 그리기
		obj.put("east", east);
		obj.put("west", west);
		obj.put("south", south);
		obj.put("north", north);
		return obj.toJSONString();
	}
	
	/** 기업회원+개인회원
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/admin/dashboard/member.kh", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String drawMemberChart() {
		// 개인 회원수
		int individual = mService.getMemberCount();
		// 기업 회원수
		int company = hService.getHostCount();
		// 총 멤버 수 = 개인회원 +  기업회원
		int total = individual + company;
		
		JSONObject obj = new JSONObject();
		// 파이차트 그리기
		obj.put("individual", individual);
		obj.put("company", company);
		obj.put("total", total);
		return obj.toJSONString();
	}
	
	/** 일반회원 수 + 파트너 수 
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/admin/dashboard/partner.kh", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String drawPartnerChart() {
		
		// 개인 회원수
		int individual = mService.getMemberCount();
		// 승인 파트너 회원수
		int approved = pService.getApprovedPartnerCount();
		// 미승인 파트너 수
		int notApproved = pService.getNotApprovedPartnerCount();

		// 파트너 등록도 안한사람
		int notPartner = individual - approved - notApproved;
		
		JSONObject obj = new JSONObject();
		// 파이차트 그리기
		obj.put("individual", individual); // 개인회원
		obj.put("approved", approved); // 파트너 승인 회원
		obj.put("notApproved", notApproved); // 파트너 미승인 회원
		obj.put("notPartner", notPartner); // 파트너 미등록 회원 

		return obj.toJSONString();
	}
	

	/** 일주일간 채팅방 신규 룸 생성량 + 신규 가입자수
	 * 
	 * @return
	 */
		@ResponseBody
		@RequestMapping(value="/admin/dashboard/weekly.kh", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
		public String drawWeekly() {
			Gson gson = new Gson();
			JSONObject roomAmount = new JSONObject();
			JSONObject individualAmount = new JSONObject();
			JSONObject hostAmount = new JSONObject();

			
			// 하루에 생긴 챗룸 수, 일반 가입자, 호스트 수
			for(int dayBefore = 6; dayBefore > -1; dayBefore--) { // 6일전 5일전 4일전 3일전 2일전 1일전 0일전
				int room =  cService.getDailyNewRoom(dayBefore);
				int individual = mService.getDailyNewMember(dayBefore);
				int host = mService.getDailyNewHost(dayBefore);
				
				// 해당 obj에 넣기
				roomAmount.put("before"+dayBefore, room);
				individualAmount.put("before"+dayBefore, individual);
				hostAmount.put("before"+dayBefore, host);
			}
			JSONArray arr = new JSONArray();
			arr.add(roomAmount);
			arr.add(individualAmount);
			arr.add(hostAmount);
			
			// 막대차트 그리러가기
			return gson.toJson(arr);
		}
}
