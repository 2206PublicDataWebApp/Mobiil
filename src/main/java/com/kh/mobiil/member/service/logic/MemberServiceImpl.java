package com.kh.mobiil.member.service.logic;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.member.service.MemberService;
import com.kh.mobiil.member.store.MemberStore;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private SqlSessionTemplate session;

	@Autowired
	private MemberStore mStore;

	// 멤버(개인)

	@Override
	public int registerMember(Member member) { // 회원가입
		int result = mStore.insertMember(session, member);
		return result;
	}

	@Override
	public int checkDupEmail(String memberEmail) { // 이메일 중복 체크
		int result = mStore.checkDupEmail(session, memberEmail);
		return result;
	}

	@Override
	public int checkDupNick(String memberNick) { // 닉네임 중복 체크
		int result = mStore.checkDupNick(session, memberNick);
		return result;
	}

	@Override
	public Member loginMember(Member member) { // 로그인
		Member mOne = mStore.selectLoginMember(session, member);
		return mOne;
	}

	@Override
	public int checkMemDupEmail(String memberEmail) {
		int result = mStore.checkMemDupEmail(session, memberEmail);
		return result;
	}

	// 비밀번호 변경
	@Override
	public int modifyPwd(Member member) {
		int result = mStore.updatePwd(session, member);
		return result;
	}

	@Override
	public Member printOneByEmail(String memberEmail) { // my page
		Member member = mStore.selectOneByEmail(session, memberEmail);
		return member;
	}

	@Override
	public int modifyMember(Member member) { // 정보 수정
		int result = mStore.updateMember(session, member);
		return result;
	}

	@Override
	public int getTotalCount(String memberEmail) {
		int totalCount = mStore.selectTotalCount(session, memberEmail);
		return totalCount;
	}

	@Override
	public List<Reservation> printAllReserve(String memberEmail, int currentPage, int reserveLimit) {
		List<Reservation> rList = mStore.selectAllReserve(session, memberEmail, currentPage, reserveLimit);
		return rList;
	}

	@Override
	public Reservation printOneByNo(String reservationNo) {
		Reservation reservation = mStore.selectOneByNo(session, reservationNo);
		return reservation;
	}

	@Override
	public int getSpaceTotalCount(String memberEmail) {
		int totalCount = mStore.getSpaceTotalCount(session, memberEmail);
		return totalCount;
	}

	@Override
	public List<Space> printMySpace(String memberEmail, int currentPage, int spaceLimit) {
		List<Space> sList = mStore.selectMySpace(session, memberEmail, currentPage, spaceLimit);
		return sList;
	}

	// 토큰 키 받기
	@Override
	public String getAccessToken(String authorize_code) {
	
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
	
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	
			conn.setRequestMethod("POST");
			conn.setDoOutput(true); // POST 요청
	
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=c61c3ed34bcf022b1aa5f4a4d4826902");
			sb.append("&redirect_uri=http://localhost:9454/member/kakaoLogin.kh");
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
	
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode); // 결과 코드 200이면 성공
	
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
	
			while ((line = br.readLine()) != null) {
				result += line;
			}
	
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
	
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	// 정보 받기
	@Override
	public Member getLoginUser(String access_Token) {
	
		HashMap<String, Object> loginUser = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
	
			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	
			int responseCode = conn.getResponseCode();
	
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	
			String line = "";
			String result = "";
	
			while ((line = br.readLine()) != null) {
				result += line;
			}
	
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
	
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	
			loginUser.put("email", email);
			loginUser.put("nickname", nickname);
	
		} catch (IOException e) {
			e.printStackTrace();
		}
		Member result = mStore.findKakao(loginUser);
		if (result == null) {
			mStore.registKakao(loginUser);
			return mStore.findKakao(loginUser);
		} else {
			return result;
		}
	
	}

	@Override
	public Member printNickByKEmail(String memberEmail) {
		Member member = mStore.selectNickByKEmail(session, memberEmail);
		return member;
	}

	@Override
	public int modifyNick(Member member) {
		int result = mStore.updateNick(session, member);
		return result;
	}

	@Override
	public int modifyKakaoMember(Member member) {
		int result = mStore.updateKakaoMember(session, member);
		return result;
	}

	@Override
	public Member printOneByKEmail(String memberEmail) {
		Member member = mStore.selectOneByKEmail(session, memberEmail);
		return member;
	}

	@Override
	public int removeMember(String memberEmail) { // 회원 탈퇴(일반)
		int result = mStore.deleteMember(session, memberEmail);
		return result;
	}

	@Override
	public int removeKakaoMember(String memberEmail) { // 회원 탈퇴(카카오)
		int result = mStore.deleteKakaoMember(session, memberEmail);
		return result;
	}
	
	@Override
	public void kakaoRemove(String access_Token) { // 회원 탈퇴(카카오) 토큰키 unlink
		  String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		    try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
		        
		        int responseCode = conn.getResponseCode();
		        
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        
		        String result = "";
		        String line = "";
		        
		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		}

	

	// 호스트

	@Override
	public int registerHost(Host host) { // 회원가입
		int result = mStore.insertHost(session, host);
		return result;
	}

	@Override
	public int checkDupHostEmail(String hostEmail) { // 이메일 중복 체크
		int result = mStore.checkDupHostEmail(session, hostEmail);
		return result;
	}

	@Override
	public Host loginHost(Host host) { // 로그인
		Host hOne = mStore.selectLoginHost(session, host);
		return hOne;
	}
	
	@Override
	public int checkHostDupEmail(String hostEmail) {
		int result = mStore.checkHostDupEmail(session, hostEmail);
		return result;
	}

	@Override
	public int modifyHostPwd(Host host) {
		int result = mStore.updateHostPwd(session, host);
		return result;
	}

	
	@Override
	public int getCountHostNick(String memberNick) {
		int result = mStore.selectCountHostNick(memberNick, session);
		return result;
	}

	///////////// 어드민 대시보드
	@Override
	public int getMemberCount() {
		int result = mStore.selectMemberCount(session);
		return result;
	}

	@Override
	public int getDailyNewMember(int dayBefore) {
		int result = mStore.selecMemberDaily(dayBefore, session);
		return result;
	}

	@Override
	public int getDailyNewHost(int dayBefore) {
		int result = mStore.selecHostDaily(dayBefore, session);
		return result;
	}

}
