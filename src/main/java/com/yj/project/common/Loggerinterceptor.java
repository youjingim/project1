package com.yj.project.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class Loggerinterceptor extends HandlerInterceptorAdapter{
	private Logger logger = LoggerFactory.getLogger(Loggerinterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(logger.isDebugEnabled()) {
			logger.debug("===========interceptor start==========");
			logger.debug(request.getRequestURI());
			
		}
/*		if(request.getSession().getAttribute("memberLoggedIn")==null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;
		}*/
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(logger.isDebugEnabled()) {
			logger.debug("===========postHandle start==========");
			logger.debug(request.getRequestURI());
			
		}
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		if(logger.isDebugEnabled()) {
			logger.debug("===========afterCompletion start==========");
			logger.debug(request.getRequestURI());
			
		}		super.afterCompletion(request, response, handler, ex);
	}

}
