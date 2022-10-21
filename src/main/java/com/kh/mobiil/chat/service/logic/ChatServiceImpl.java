package com.kh.mobiil.chat.service.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.chat.service.ChatService;
import com.kh.mobiil.chat.store.ChatStore;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatStore cStore;
	@Autowired
	private SqlSessionTemplate session;

}
