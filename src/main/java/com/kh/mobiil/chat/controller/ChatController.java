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
import com.kh.mobiil.chat.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	// 채팅방 리스트 띄우기
	@RequestMapping(value="/chat/chatWindow.kh", method = RequestMethod.GET)
	public ModelAndView showChatList(@RequestParam("memberNick") String memberNick, ModelAndView mv) {
		List<ChatRoom> cList = cService.listByMemberNick(memberNick);
		mv.addObject("cList", cList);
		mv.setViewName("/chat/chatWindow");
		return mv;
	}
	
	// 채팅방 띄우기
	@RequestMapping(value="/chat/chatRoom.kh")
	public ModelAndView showChatRoom(@RequestParam("memberNick") String memberNick,
										@RequestParam("roomNo") int roomNo,
										ModelAndView mv) {
		mv.addObject("memberNick", memberNick);
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
		Gson gson = new GsonBuilder().setDateFormat("MM-dd hh:mm:ss").create(); // gson빌더로 gson 만드는데 date 포맷 지정
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

}