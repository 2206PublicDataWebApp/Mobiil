package com.kh.mobiil.mail.controller;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;

import com.kh.mobiil.mail.domain.MailInfo;

@Controller
public class MailController {
	
	public int mailSender(MailInfo info) {
        
        Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 true 고정
        p.put("mail.smtp.host", "smtp.naver.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은 true 고정
        p.put("mail.smtp.port", "587");                 // 네이버 포트
        p.put("mail.smtp.ssl.protocols", "TLSv1.2");    // ssl 버전 안맞는 경우 에러나서 추가
           
        Authenticator auth = new MyAuthentication();
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
         
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
            InternetAddress from = new InternetAddress() ;
            from = new InternetAddress("kh_mobiil@naver.com"); //발신자 아이디
            // 이메일 발신자
            msg.setFrom(from);
            // 이메일 수신자
            InternetAddress to = new InternetAddress(info.getRecipient()); // 배열로 하면 여러명한테 보낼 수 있음 
            msg.setRecipient(Message.RecipientType.TO, to);
            // 이메일 제목
            msg.setSubject(info.getSubject(), "UTF-8");
            // 이메일 내용
            msg.setText(info.getText(), "UTF-8");
            // 이메일 헤더
            msg.setHeader("content-Type", "text/html");
            //메일보내기
            javax.mail.Transport.send(msg, msg.getAllRecipients());
            return 1;
             
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
            return 0;
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
            return 0;
        }catch (Exception msg_e) {
            msg_e.printStackTrace();
            return 0;
        }
    }
}
 
class MyAuthentication extends Authenticator {
      
    PasswordAuthentication pa;
    public MyAuthentication(){
         
        String id = "kh_mobiil";  //네이버 이메일 아이디
        String pw = "@mobiilkh";        //네이버 비밀번호
 
        // ID와 비밀번호를 입력한다.
        pa = new PasswordAuthentication(id, pw);
    }
 
    // 시스템에서 사용하는 인증정보
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
} 
  
