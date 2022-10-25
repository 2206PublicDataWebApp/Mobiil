package com.kh.mobiil.chat.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mobiil.chat.domain.Chat;
import com.kh.mobiil.chat.domain.ChatRoom;

public interface ChatStore {

	public ChatRoom selectOneRoom(ChatRoom roomInfo, SqlSessionTemplate session);

	public int insertRoom(ChatRoom roomInfo, SqlSessionTemplate session);

	public List<ChatRoom> selectChatRoom(String memberNick, SqlSessionTemplate session);

	public int insertChat(Chat chat, SqlSessionTemplate session);

	public List<Chat> selectChatLog(int roomNo, SqlSessionTemplate session);

	public int updateChatRead(int roomNo, SqlSessionTemplate session);

//	public int unReadCount(int roomNo, SqlSessionTemplate session);

}
