package kr.or.member.controller;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.service.MemberService;
import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	
	
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "/member/joinFrm";
	}
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "/member/loginFrm";
	}
	@ResponseBody
	@RequestMapping(value="/memberPhoneCheck")
	public String memberPhoneCheck(String phone) throws CoolsmsException {
		String api_key = "NCSWCXKJNQFT0JWN";
		  String api_secret = "MGVZXWLCEBOJRYV6RZZGAZELC7H5VTEA";
		  Message coolsms = new Message(api_key, api_secret);

		  Random rand = new Random(); 
			String numStr = "";
			for(int i=0; i<4; i++) {
				String ran = Integer.toString(rand.nextInt(10)); 
				numStr += ran;
			}
		  
		  HashMap<String, String> set = new HashMap<String, String>();
		  set.put("to", phone); // 수신번호

		  set.put("from", "01086676959"); // 발신번호
		  set.put("text", numStr); // 문자내용
		  set.put("type", "sms"); // 문자 타입
		  set.put("app_version", "test app 1.2"); 

		  System.out.println(set);
		  try {
		  JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		  System.out.println(result.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }

		  return "/";
		
	}
}
