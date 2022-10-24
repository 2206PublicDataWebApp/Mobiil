package com.kh.mobiil.chat.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.chat.domain.Chat;
import com.kh.mobiil.chat.domain.ChatRoom;
import com.kh.mobiil.chat.store.ChatStore;

@Repository
public class ChatStoreLogic implements ChatStore{

	@Override
	public ChatRoom selectOneRoom(ChatRoom roomInfo, SqlSessionTemplate session) {
		ChatRoom chatRoom = session.selectOne("chatRoomMapper.selectOneRoom", roomInfo);
		return chatRoom;
	}

	@Override
	public int insertRoom(ChatRoom roomInfo, SqlSessionTemplate session) {
		int result = session.insert("chatRoomMapper.insertRoom", roomInfo);
		return result;
	}

	@Override
	public List<ChatRoom> selectChatRoom(String memberNick, SqlSessionTemplate session) {
		List<ChatRoom> cList = session.selectList("chatRoomMapper.selectAllRoom", memberNick);
		return cList;
	}

	@Override
	public int insertChat(Chat chat, SqlSessionTemplate session) {
		int result = session.insert("chatMapper.insertChat", chat);
		return result;
	}

	@Override
	public List<Chat> selectReadRog(int roomNo, SqlSessionTemplate session) {
		List<Chat> cLog = session.selectList("chatMapper.selectReadChat", roomNo);
		return cLog;
	}

//	@Override
//	public int unReadCount(int roomNo, SqlSessionTemplate session) {
//		int unRead = session.selectOne("chatMapper.unReadCount", roomNo);
//		return unRead;
//	}

}
