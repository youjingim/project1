package com.yj.project.common;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
@Component
@Aspect
public class LoggerAspect {
	private Logger logger = LoggerFactory.getLogger(LoggerAspect.class);
	
	@Pointcut("execution(* com.yj.project..*(..))")
	public void myPointcut() {}
	
	
	@Around("myPointcut()")
	public Object loggerAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		Signature signature = joinPoint.getSignature();
		String type=signature.getDeclaringTypeName();
		String methodName = signature.getName();
		
		String component = "";
		if(type.indexOf("Controller")>-1) {
			component="Controller\t : ";
		}else if(type.indexOf("Service")>-1) {
			component="Service\t : ";
		}else if(type.indexOf("DAO")>-1) {
			component="DAO\t : ";
		}
		logger.debug("[before]" + component + type+"."+methodName+"()");
		return joinPoint.proceed();
	}
	
	
	
}
