package com.app.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.model.UrlLog;
import com.app.service.JavaService;
import com.app.utiltiy.Common;

@Controller
public class WelcomeController {
	@Autowired
	JavaService javaService;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String welcome(HttpServletRequest request) {
		saveUrl("/",request);
		return "welcome";
	}
	@RequestMapping(value="/java", method = RequestMethod.GET)
	public String Java(HttpServletRequest request) {
		saveUrl("/java",request);
		return "java";
	}
	@RequestMapping(value="/java/static-method-overriding", method = RequestMethod.GET)
	public String staticMethod(HttpServletRequest request) {
		saveUrl("/java/static-method-overriding",request);
		return "java/staticMethod";
	}
	private void saveUrl(String url,HttpServletRequest request) {
		String ip = Common.getClientIp(request);
		//System.out.println("called from ip:"+ip);
		UrlLog urlLog = new UrlLog();
		urlLog.setClientip(ip);
		urlLog.setUrl(url);
		javaService.saveUrl(urlLog);
	}
}