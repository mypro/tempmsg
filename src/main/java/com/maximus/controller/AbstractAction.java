package com.maximus.controller;


import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public abstract class AbstractAction {
	private static final Logger LOGGER = LoggerFactory.getLogger(AbstractAction.class);
	private String message;



	protected Object get(String name, HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	/**
	 * Put an object in the WebWork user session
	 */
	protected void set(String name, Object value, HttpServletRequest request, HttpServletResponse response) {
	}

	/**
	 * Put an object in the WebWork user session
	 */
	protected void remove(Object key, HttpServletRequest request, HttpServletResponse response) {
	}

	/**
	 * @return Returns the sMessage.
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message
	 *            The sMessage to set.
	 */
	public void setMessage(String message, HttpServletRequest request, HttpServletResponse response) {
		this.message = message;
	}

	protected String returnForAjax(HttpServletRequest request, HttpServletResponse response, Integer result, Object obj) {
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter writer;
		try {
			writer = response.getWriter();
			writer.write(JSON.toJSONString(obj));
			writer.flush();
		} catch (IOException e) {
			LOGGER.error("异常" + e);
		}
		return null;
	}

	protected String returnForAjax(HttpServletRequest request, HttpServletResponse response, int curPage,
			Long totalNum, Integer result, Object obj) throws Exception {
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.write(JSON.toJSONString(obj));
		writer.flush();
		return null;
	}

	protected String returnForAjax(HttpServletRequest request, HttpServletResponse response, Object obj) {
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter writer;
		try {
			writer = response.getWriter();
			writer.write(JSON.toJSONString(obj));
			writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	protected String returnJsonP(HttpServletRequest request, HttpServletResponse response, Object obj, String callback) {
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter writer;
		try {
			writer = response.getWriter();
			writer.append(callback + "(");
			writer.write(JSON.toJSONString(obj));
			writer.append(");");
			writer.flush();
		} catch (IOException e) {
			LOGGER.error("异常" + e);
		}
		return null;
	}

	protected String returnJsonP(HttpServletRequest request, HttpServletResponse response, Integer code, Object obj,
			String callback) {
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter writer;
		try {
			writer = response.getWriter();
			writer.write(JSON.toJSONString(obj));
			writer.flush();
		} catch (IOException e) {
			LOGGER.error("异常" + e);
		}
		return null;
	}

	protected boolean isNull(String str) {
		return str == null || str.trim().length() == 0;
	}

	public String colorInvalid(String regexStr, String content, String prefix, String ending) {
		if (!isNull(regexStr) && !isNull(content)) {
			Pattern p = null;
			Matcher m = null;
			String sRegex = "(" + regexStr + ")";
			p = Pattern.compile(sRegex, Pattern.CASE_INSENSITIVE);
			m = p.matcher(content);
			String s = null, sTmp = null;
			StringBuffer sb = new StringBuffer();
			while (m.find()) {
				sTmp = m.group();
				s = prefix + sTmp + ending;
				m.appendReplacement(sb, s);
			}
			m.appendTail(sb);
			return sb.toString();
		} else {
			return content;
		}
	}

}
