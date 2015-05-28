package com.maximus.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ControllerAccessInterceptor extends HandlerInterceptorAdapter {
	private static final String mappingURL = "/j2eeNode";// 需要拦截的
	private static final String mappingExcept01 = "/application"; // 不拦截

	// private static final String mappingExcept01 = "/getUserById"; // 不拦截
	// private static final String mappingExcept02 = "/getUserByLoginName"; // 不拦截
	// private static final String mappingExcept03 = "/countAllUser"; // 不拦截
	// private static final String mappingExcept04 = "/cache/\\w+"; // 不拦截

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String contextPath = request.getContextPath(); //
		if (contextPath.equals(mappingURL)) {
			String url = request.getRequestURL().toString();
			String temp = url.split(mappingURL)[1];
			System.out.println("****  " + temp);
			if (!mappingExcept01.equals(temp)) {
				return true;
			} else {
				response.sendError(405);
				return false;
			}
		}
		return true;
	}
}
