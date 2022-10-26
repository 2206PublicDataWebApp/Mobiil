package com.kh.mobiil.chat.service.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.chat.domain.Chat;
import com.kh.mobiil.chat.domain.ChatRoom;
import com.kh.mobiil.chat.service.ChatService;
import com.kh.mobiil.chat.store.ChatStore;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatStore cStore;
	@Autowired
	private SqlSessionTemplate session;
	@Override
	public ChatRoom findByUsers(ChatRoom roomInfo) {
		ChatRoom chatRoom  = cStore.selectOneRoom(roomInfo, session);
		return chatRoom;
	}
	@Override
	public int registerChatRoom(ChatRoom roomInfo) {
		int result = cStore.insertRoom(roomInfo, session);
		return result;
	}
	@Override
	public List<ChatRoom> listByMemberNick(String memberNick) {
		List<ChatRoom> cList = cStore.selectChatRoom(memberNick, session);
		return cList;
	}
	@Override
	public int registerChat(Chat chat) {
		int result = cStore.insertChat(chat, session);
		return result;
	}
	@Override
	public List<Chat> chatLog(int roomNo) {
		int result = cStore.updateChatRead(roomNo, session); // read 업데이트
		List<Chat> cLog = cStore.selectChatLog(roomNo, session);
		return cLog;
	}
	@Override
	public Chat chatNewOne(int roomNo) {
		Chat cOne = cStore.selectOneNew(roomNo, session);
		int result = cStore.updateChatRead(roomNo, session); // read 업데이트
		return cOne;
	}
	@Override
	public int getDailyNewRoom(int dayBefore) {
		int result = cStore.selectDailyNewRoom(dayBefore, session);
		return result;
	}

}
