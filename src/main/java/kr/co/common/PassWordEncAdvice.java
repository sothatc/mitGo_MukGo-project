package kr.co.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.mitgomukgo.member.model.vo.Member;
import kr.co.mitgomukgo.member.model.vo.Owner;

@Component
@Aspect
public class PassWordEncAdvice {
	@Autowired
	private SHA256Util passEnc;
	@Pointcut(value="execution(* kr.co.mitgomukgo.member.model.service.MemberService.*Member(kr.co.mitgomukgo.member.model.vo.Member))")
	public void memberPointcut() {}
	
	
	@Before(value="memberPointcut()")
	public void passwordEnc1(JoinPoint jp) throws Exception {
		Object[] args = jp.getArgs();
		Member m = (Member)args[0];
		String memberPw = m.getMemberPw();
		System.out.println("사용자 입력 비밀번호 : "+memberPw);
		if(memberPw != null) {
			String encPw = passEnc.encData(memberPw);
			m.setMemberPw(encPw);
		}
	}

	@Pointcut(value="execution(* kr.co.mitgomukgo.member.model.service.MemberService.*Owner(kr.co.mitgomukgo.member.model.vo.Owner))")
	public void ownerPointcut() {}
	
	
	@Before(value="ownerPointcut()")
	public void passwordEnc2(JoinPoint jp) throws Exception {
		Object[] args = jp.getArgs();
		Owner o = (Owner)args[0];
		String ownerPw = o.getOwnerPw();
		System.out.println("사용자 입력 비밀번호 : "+ownerPw);
		if(ownerPw != null) {
			String encPw = passEnc.encData(ownerPw);
			o.setOwnerPw(encPw);
		}
	}
}
