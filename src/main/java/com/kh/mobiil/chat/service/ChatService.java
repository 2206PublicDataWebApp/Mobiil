package com.kh.mobiil.chat.service;

import java.util.List;

import com.kh.mobiil.chat.domain.Chat;
import com.kh.mobiil.chat.domain.ChatRoom;
import com.kh.mobiil.chat.domain.ChatSearchResult;

public interface ChatService {

	public int registerChatRoom(ChatRoom roomInfo);

	public int registerChat(Chat chat);

	public List<Chat> chatLog(int roomNo);

	public Chat chatNewOne(int roomNo);

	public ChatRoom findByUsers(ChatRoom roomInfo);

	public List<ChatRoom> listByMemberNick(String memberNick);

	public int updateChatRead(int roomNo, String memberNick);

	public int unReadCount(int refRoomNo, String memberNick);

	public int disableRoom(int roomNo);

	public List<ChatSearchResult> searchSpace(String searchValue);  // 채팅방에서 공간검색하기 

	public int getDailyNewRoom(int dayBefore);


}
