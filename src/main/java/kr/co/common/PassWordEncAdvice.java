package kr.co.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.mitgomukgo.member.model.vo.Member;

@Component
@Aspect
public class PassWordEncAdvice {
	@Autowired
	private SHA256Util passEnc;
	@Pointcut(value="execution(* kr.co.member.model.service.MemberService.*Member(kr.co.member.model.vo.Member))")
	public void encPointcut() {}
	
	
	@Before(value="encPointcut()")
	public void passwordEnc(JoinPoint jp) throws Exception {
		Object[] args = jp.getArgs();
		Member m = (Member)args[0];
		String memberPw = m.getMemberPw();
		System.out.println("사용자 입력 비밀번호 : "+memberPw);
		if(memberPw != null) {
			String encPw = passEnc.encData(memberPw);
			m.setMemberPw(encPw);
		}
	}
}
