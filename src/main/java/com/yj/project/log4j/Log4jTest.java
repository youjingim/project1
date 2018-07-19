package com.yj.project.log4j;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

public class Log4jTest {
	private static Logger logger = Logger.getLogger(Log4jTest.class);
	public static void main(String[] args) {
		logger.setLevel(Level.WARN);
		new Log4jTest().test();
		
	}
	public void test() {
		
		//설정된 레벨을 기준으로 출력!!
		logger.fatal("FATAL로그");
		logger.error("ERROR로그");
		logger.warn("Warn로그");
		logger.info("INFO로그");
		logger.debug("DEBUG로그");
		logger.trace("TRACE로그");
	}

}
