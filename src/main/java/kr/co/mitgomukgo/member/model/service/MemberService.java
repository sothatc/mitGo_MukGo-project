package kr.or.mitgomukgo.member.model.service;

import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import kr.or.mitgomukgo.member.model.dao.MemberDao;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	
	
}
