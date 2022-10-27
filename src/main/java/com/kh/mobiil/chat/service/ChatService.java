package com.kh.mobiil.chat.service;

import java.util.List;

import com.kh.mobiil.chat.domain.Chat;
import com.kh.mobiil.chat.domain.ChatRoom;

public interface ChatService {

	public ChatRoom findByUsers(ChatRoom roomInfo);

	public int registerChatRoom(ChatRoom roomInfo);

	public List<ChatRoom> listByMemberNick(String memberNick);

	public int registerChat(Chat chat);

	public List<Chat> chatLog(int roomNo);

	public Chat chatNewOne(int roomNo);

	public int getDailyNewRoom(int dayBefore);

	public int unReadCount(int refRoomNo);

	public int disableRoom(int roomNo);


}
