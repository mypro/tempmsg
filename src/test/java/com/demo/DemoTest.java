package com.demo;

import com.maximus.service.BaseService;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;

public class DemoTest {
	private static Logger logger = LoggerFactory.getLogger(DemoTest.class);

	private static BaseService baseService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {


	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Test
	public void test() throws Exception {
		System.out.println(new Date().getTime());
		logger.debug("~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
		int big = 1234567890;
		float approx = big;
		System.out.println(big -  approx);
		short s = 1;
		int a = 2;
		a = a+s;
//		s = s+a;
	}
}
