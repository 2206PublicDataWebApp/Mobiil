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

	public Chat selectOneNew(int roomNo, SqlSessionTemplate session);

	public int selectDailyNewRoom(int dayBefore, SqlSessionTemplate session);

	public int selectUnRead(int refRoomNo, SqlSessionTemplate session);

	public int disableRoom(int roomNo, SqlSessionTemplate session);


}
