package com.kh.mobiil.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.mobiil.chat.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;

}
