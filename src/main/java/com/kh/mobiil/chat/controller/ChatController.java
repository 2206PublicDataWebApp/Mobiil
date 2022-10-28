package com.kh.mobiil.chat.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
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
import com.kh.mobiil.chat.service.ChatService;
import com.kh.mobiil.mail.controller.MailController;
import com.kh.mobiil.mail.domain.MailInfo;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	// 채팅방 리스트 띄우기 + 언리드 카운트 띄우기 + 채팅방 비활성화 이후 3일 지나면 채팅방 안보이게 함
	@RequestMapping(value="/chat/chatWindow.kh", method = RequestMethod.GET)
	public ModelAndView showChatList(@RequestParam(value = "memberNick") String memberNick, ModelAndView mv) {
		
		//memberNick은 로그인한사람의 memberNick임
		List<ChatRoom> cList = cService.listByMemberNick(memberNick);
		// refRoomNo랑 언리드 read_ckh 확인해서 출력해야함
		
		for(int i = 0; i < cList.size() ; i++) {
			int refRoomNo = cList.get(i).getRoomNo();
			// 상대방의 닉네임을 넣어줘야함
			String other = "";
			if(memberNick != cList.get(i).getCreateUser()) { // 만든사람이 로그인한사람이랑 다르면
				other = cList.get(i).getCreateUser();
			}else { // 만든사람이 로그인한사람이랑 같으면
				other = cList.get(i).getWithUser();
			}
			int unReadCount = cService.unReadCount(refRoomNo, other);
			cList.get(i).setUnReadCount(unReadCount);
		}
		Date timeNow = new Date(System.currentTimeMillis());
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd"); 
		String today = simpleDateFormat.format(timeNow); 
		mv.addObject("today", today);
		mv.addObject("cList", cList);
		mv.setViewName("/chat/chatWindow");
		return mv;
	}
	
	// 채팅방 띄우기
	@RequestMapping(value="/chat/chatRoom.kh")
	public ModelAndView showChatRoom(@RequestParam(value = "memberNick", required = false) String memberNick,
									@RequestParam(value = "hostEmail", required = false) String hostEmail,
									@RequestParam("roomNo") int roomNo,
									ModelAndView mv) {
		mv.addObject("memberNick", memberNick);
		mv.addObject("hostEmail", hostEmail);
		mv.addObject("roomNo", roomNo);
		mv.setViewName("/chat/chatLog");
		return mv;
		
	}
	
	
	
	// 채팅방 만들기
	@ResponseBody
	@RequestMapping(value="/chat/createChatRoom.kh", method = RequestMethod.GET)
	public String createChatRoom(@ModelAttribute ChatRoom roomInfo) {
		
		ChatRoom chatRoom = cService.findByUsers(roomInfo);
		if(chatRoom != null) { // user두명으로 조회시 채팅방이 이미 있는 경우
			return "already"; // 존재 하는 방임을 알림
		}else { // user두명으로 조회시 채팅방이 없는 경우
			int result = cService.registerChatRoom(roomInfo); // 채팅방 생성
			if(result > 0) { //생성 성공시 채팅방 정보 불러오기
				return "success";
			}else {
				return "fail";
			}
		}
	}
	
	// 채팅 보내기
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
	
	// 채팅 로그 조회하기
	@ResponseBody
	@RequestMapping(value="/chat/chatLog.kh", method = RequestMethod.GET, produces = "application/json;charset=utf-8" )
	public String chatLog(@RequestParam("roomNo") int roomNo) {
		List<Chat> cLog = cService.chatLog(roomNo);
		Gson gson = new GsonBuilder().setDateFormat("MM-dd HH:mm:ss").create(); // gson빌더로 gson 만드는데 date 포맷 지정
		return gson.toJson(cLog);
	}



	// 최신 하나만 조회하기
	@ResponseBody
	@RequestMapping(value = "/chat/chatNewOne.kh", method = RequestMethod.GET, produces = "application/json;charset=utf-8" )
	public String chatNewOne(@RequestParam("roomNo") int roomNo) {
		JSONObject jsonObj = new JSONObject(); // json 객체 생성 ( {} 생성 완료 ) // 비어있는 상태임
		Gson gson = new GsonBuilder().setDateFormat("MM-dd hh:mm:ss").create(); // gson빌더로 gson 만드는데 date 포맷 지정
		Chat cOne = cService.chatNewOne(roomNo);

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
	
	//채팅방 비활성화(채팅 나가기) 
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
//	@ResponseBody
//	@RequestMapping(value = "chat/askMail.kh")
//	public String askMail(@RequestParam("roomNo") int roomNO) {
//		MailController mailSender = new MailController();
//		MailInfo info = new MailInfo();
//		info.setRecipient(recipient); // 수신자 조회해서 넣기
//		info.setSubject(subject); // 게목 정해주기
//		info.setText(text); // 내용에 재활성화 버튼 넣어서 보내기
//		int mailResult = mailSender.mailSender(info);	// 메일 보내는 메소드 (성공시 1반환)
//		return null;
//
//	}
	
	


}