package com.kh.mobiil.chat.controller;

import java.util.List;

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
import com.kh.mobiil.chat.domain.Chat;
import com.kh.mobiil.chat.domain.ChatRoom;
import com.kh.mobiil.chat.domain.ChatSearchResult;
import com.kh.mobiil.chat.service.ChatService;
import com.kh.mobiil.member.service.MemberService;
import com.kh.mobiil.partner.domain.Partner;
import com.kh.mobiil.partner.service.PartnerService;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	@Autowired
	private PartnerService pService;
	
	@Autowired
	private MemberService mService;
	
	 /**채팅방 리스트 띄우기 + 언리드 카운트 띄우기
	  * 
	  * @param memberNick
	  * @param mv
	  * @return
	  */
	@RequestMapping(value="/chat/chatWindow.kh", method = RequestMethod.GET)
	public ModelAndView showChatList(@RequestParam(value = "memberNick") String memberNick, ModelAndView mv) {
		
		//memberNick은 로그인한사람의 memberNick임
		List<ChatRoom> cList = cService.listByMemberNick(memberNick);
		
		// refRoomNo랑 언리드 read_ckh 확인해서 출력
		for(int i = 0; i < cList.size() ; i++) {
			int refRoomNo = cList.get(i).getRoomNo();
			int unReadCount = cService.unReadCount(refRoomNo, memberNick); // sender가 내가 아니고 status가 N인걸 센다..
			cList.get(i).setUnReadCount(unReadCount);
		}
		mv.addObject("cList", cList);
		mv.setViewName("/chat/chatWindow");
		return mv;
	}
	
	/**프사 보여주기
	 * 
	 * @param memberNick
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/chat/getProfile", method = RequestMethod.GET)
	public String getProfile(@RequestParam("memberNick") String memberNick) {
		int memberChk  = mService.checkDupNick(memberNick); 	// 이 사람이 멤버에 있는지
		int hostChk =  mService.getCountHostNick(memberNick);   // 이 사람이 호스트에 있는지
		Partner pOne = pService.printOnePartner(memberNick); 	// 이사람이 파트너인지
		
		if(hostChk > 0) {
			return "noPartner";
		}
		if(memberChk > 0 && pOne != null ) {
			return pOne.getProfileRename();
		}else if(pOne == null) {
			return "noPartner";
		}else {
			return "noPartner";
		}
	}
	
	/** 메뉴바 언리드카운트
	 * 
	 * @param memberNick
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/chat/getTotalUnread.kh", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
	public String getTotalUnread(@RequestParam(value = "memberNick") String memberNick) {
		//memberNick은 로그인한사람의 memberNick임
		List<ChatRoom> cList = cService.listByMemberNick(memberNick);
		int TotalUnread = 0;
		// refRoomNo랑 언리드 read_ckh 확인해서 출력
		for(int i = 0; i < cList.size() ; i++) {
			int refRoomNo = cList.get(i).getRoomNo();
			int unReadCount = cService.unReadCount(refRoomNo, memberNick); // sender가 내가 아니고 status가 N인걸 센다..
			cList.get(i).setUnReadCount(unReadCount);
			TotalUnread  = TotalUnread + unReadCount;
		}
		String result = String.valueOf(TotalUnread);
		return result;
	}

	
	/**
	 *  채팅방 띄우기
	 * @param memberNick
	 * @param roomNo
	 * @param roomStatus
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/chat/chatRoom.kh")
	public ModelAndView showChatRoom(@RequestParam(value = "memberNick", required = false) String memberNick,
									@RequestParam("roomNo") int roomNo,
									@RequestParam(value = "roomStatus", required = false ) String roomStatus,
									ModelAndView mv) {
		mv.addObject("memberNick", memberNick);
		mv.addObject("roomStatus", roomStatus);
		mv.addObject("roomNo", roomNo);
		mv.setViewName("/chat/chatLog");
		return mv;
	}
	
	/**
	 *  채팅방 만들기
	 * @param roomInfo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/chat/createChatRoom.kh", method = RequestMethod.GET, produces = "text/plain;charset=utf-8" )
	public String createChatRoom(@ModelAttribute ChatRoom roomInfo) {
		int memberChk  = mService.checkDupNick(roomInfo.getCreateUser()); 		// 이 사람이 멤버에 있는지
		Partner partner = pService.printOnePartner(roomInfo.getCreateUser()); 	// 이 사람이 파트너에 등록했는지
		int hostChk =  mService.getCountHostNick(roomInfo.getCreateUser());    	// 이 사람이 호스트에 있는지
		int withHost =  mService.getCountHostNick(roomInfo.getWithUser()); 
		
		if(memberChk > 0 || hostChk > 0) {// 내가 멤버혹은 호스트
				if(roomInfo.getWithUser().equals("관리자") || withHost > 0 ) { // 채팅하고싶은 사람이 관리자 혹은 호스트다
					ChatRoom chatRoom = cService.findByUsers(roomInfo);
					if (chatRoom != null) { // user두명으로 조회시 채팅방이 이미 있는 경우
						return "already"; // 존재 하는 방임을 알림
					} else { // user두명으로 조회시 채팅방이 없는 경우
						int result = cService.registerChatRoom(roomInfo); // 채팅방 생성
						if (result > 0) { // 생성 성공시 채팅방 정보 불러오기
							return "success";
						} else {
							return "fail";
						}
					}	
				}else { // 채팅하고싶은사람이 일반유저다
					if(partner == null) { // 근데 내가 파트너 등록을 안했다
						return "needRegist"; // 파트너로 등록해주세요
					}else if(partner.getApproval().equals("N")){ // 파트너 등록은 했는데 승인이 안됏다
						return	"needApproval"; // 파트너 승인이 필요합니다
					}else { // 파트너 등록도 하고 승인도 됏다
						ChatRoom chatRoom = cService.findByUsers(roomInfo);
						if (chatRoom != null) { // user두명으로 조회시 채팅방이 이미 있는 경우
							return "already"; // 존재 하는 방임을 알림
						} else { // user두명으로 조회시 채팅방이 없는 경우
							int result = cService.registerChatRoom(roomInfo); // 채팅방 생성
							if (result > 0) { // 생성 성공시 채팅방 정보 불러오기
								return "success";
							} else {
								return "fail";
							}
						}
					}
				}
		}
		return "noLogin";		
	}
	
	/**
	 *  채팅 보내기
	 * @param chat
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/chat/registerChat.kh", method = RequestMethod.GET)
	public String registerChat(@ModelAttribute Chat chat) {
		int result = cService.registerChat(chat);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	/**
	 * 채팅 로그 조회하기
	 * @param roomNo
	 * @param memberNick
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/chat/chatLog.kh", method = RequestMethod.GET, produces = "application/json;charset=utf-8" )
	public String chatLog(@RequestParam("roomNo") int roomNo, @RequestParam("memberNick") String memberNick) {
		List<Chat> cLog = cService.chatLog(roomNo); 
		int result = cService.updateChatRead(roomNo, memberNick); // 읽은거
		Gson gson = new GsonBuilder().setDateFormat("MM-dd HH:mm:ss").create(); // gson빌더로 gson 만드는데 date 포맷 지정
		return gson.toJson(cLog);
	}

	/**
	 * 최신 하나만 조회하기
	 * @param roomNo
	 * @param memberNick
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/chat/chatNewOne.kh", method = RequestMethod.GET, produces = "application/json;charset=utf-8" )
	public String chatNewOne(@RequestParam("roomNo") int roomNo,
			@RequestParam("memberNick") String memberNick) {
		JSONObject jsonObj = new JSONObject(); // json 객체 생성 ( {} 생성 완료 ) // 비어있는 상태임
		Gson gson = new GsonBuilder().setDateFormat("MM-dd HH:mm:ss").create(); // gson빌더로 gson 만드는데 date 포맷 지정
		Chat cOne = cService.chatNewOne(roomNo);
		int result = cService.updateChatRead(roomNo, memberNick); // 읽은거 // 최신하나 조회할때는 창 켜져있으니까 계속 업데이트하면되지않나
		if(cOne != null) {
			jsonObj.put("chatNo",cOne.getChatNo());
			jsonObj.put("refRoomNo", cOne.getRefRoomNo());
			jsonObj.put("sender", cOne.getSender());
			jsonObj.put("chat", cOne.getChat());
			jsonObj.put("createDate", cOne.getCreateDate());
			jsonObj.put("read_chk",cOne.getRead_chk());
		}else {
			jsonObj.put("chat", "정보가 없습니다");
		}
		return gson.toJson(jsonObj);
	}
	
	/**
	 * 채팅방 비활성화(채팅 나가기) 채팅방은 비활성화 이후 그날 자정 폭파
	 * @param roomNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/chat/disableChatRoom.kh")
	public String disableChatRoom(@RequestParam("roomNo") int roomNo) {
		int result = cService.disableRoom(roomNo);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}

	/**
	 * 공간검색
	 * @param searchValue
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/chat/searchSpace.kh", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String searchSpace(@RequestParam("searchValue") String searchValue) { // gson으로 돌려주기
		Gson gson = new Gson();
		List<ChatSearchResult> sList = cService.searchSpace(searchValue);
		return gson.toJson(sList);
	}
}