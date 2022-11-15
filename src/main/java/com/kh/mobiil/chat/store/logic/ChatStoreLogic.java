package com.kh.mobiil.chat.store.logic;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.chat.domain.Chat;
import com.kh.mobiil.chat.domain.ChatRoom;
import com.kh.mobiil.chat.domain.ChatSearchResult;
import com.kh.mobiil.chat.domain.UnreadInfo;
import com.kh.mobiil.chat.store.ChatStore;

@Repository
public class ChatStoreLogic implements ChatStore{

	@Override
	public int insertRoom(ChatRoom roomInfo, SqlSessionTemplate session) {
		int result = session.insert("chatRoomMapper.insertRoom", roomInfo);
		return result;
	}

	@Override
	public int insertChat(Chat chat, SqlSessionTemplate session) {
		int result = session.insert("chatMapper.insertChat", chat);
		return result;
	}

	@Override
	public List<Chat> selectChatLog(int roomNo, SqlSessionTemplate session) {
		List<Chat> cLog = session.selectList("chatMapper.selectChatLog", roomNo);
		return cLog;
	}

	@Override
	public Chat selectOneNew(int roomNo, SqlSessionTemplate session) {
		Chat cOne = session.selectOne("chatMapper.selectOneNew", roomNo);
		return cOne;
	}

	@Override
	public int updateChatRead(int roomNo, String memberNick, SqlSessionTemplate session) {
		UnreadInfo unreadInfo = new UnreadInfo(memberNick, roomNo);
		int result = session.update("chatMapper.updateChatRead", unreadInfo);
		return result;
	}

	@Override
	public ChatRoom selectOneRoom(ChatRoom roomInfo, SqlSessionTemplate session) {
		ChatRoom chatRoom = session.selectOne("chatRoomMapper.selectOneRoom", roomInfo);
		return chatRoom;
	}

	@Override
	public List<ChatRoom> selectChatRoom(String memberNick, SqlSessionTemplate session) {
		List<ChatRoom> cList = session.selectList("chatRoomMapper.selectAllRoom", memberNick);
		return cList;
	}

	@Override
	public int selectUnRead(int refRoomNo, String memberNick, SqlSessionTemplate session) {
		UnreadInfo unreadInfo = new UnreadInfo(memberNick, refRoomNo);
		int result = session.selectOne("chatMapper.selectUnRead", unreadInfo);
		return result;
	}

	@Override
	public int disableRoom(int roomNo, SqlSessionTemplate session) {
		int result = session.update("chatRoomMapper.disableRoom", roomNo);
		return result;
	}

	@Override
	public List<ChatSearchResult> selectSearchResult(String searchValue, SqlSessionTemplate session) {
		List<ChatSearchResult> sList = session.selectList("chatMapper.selectSearchResult", searchValue);
		return sList;
	}

	@Override
	public int selectDailyNewRoom(int dayBefore, SqlSessionTemplate session) {
		int result = session.selectOne("chatRoomMapper.selectDailyNewRoom", dayBefore);
		return result;
	}
	
}
