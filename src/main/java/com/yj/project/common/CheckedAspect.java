package com.yj.project.common;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.yj.project.member.model.vo.Member;

@Component
@Aspect
public class CheckedAspect {
	
	
	@Around("execution(* com.yj.project..*(..)))")
	public Object checkValue(ProceedingJoinPoint joinPoint) throws Throwable{
		HttpSession session = (HttpSession)RequestContextHolder.currentRequestAttributes().resolveReference(RequestAttributes.REFERENCE_SESSION);
		Member member = (Member)session.getAttribute("memberLoggedIn");
/*		if(member==null) {
			throw new RuntimeException("접근권한이 없습니다!");
		}*/
		return joinPoint.proceed();
		
	}
}
