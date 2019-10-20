package com.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.model.UrlLog;
import com.app.service.JavaService;
import com.app.utiltiy.Common;

@Controller
public class JavaController {
	private static Logger log = LoggerFactory.getLogger(JavaController.class);
	@Autowired
	JavaService javaService;
	@RequestMapping(value="/java/static-method-overriding", method = RequestMethod.GET)
	public String staticMethod(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "java/staticMethod";
	}
	
	@RequestMapping(value="/java/weak-references", method = RequestMethod.GET)
	public String weakReferences(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "java/weak-references";
	}
	@RequestMapping(value="/java/overriding-hashcode-equals", method = RequestMethod.GET)
	public String hashcodeEquals(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "java/overriding-hashcode-equals";
	}
	private void saveUrl(HttpServletRequest request) {
		String ip = Common.getClientIp(request);
		//System.out.println("called from ip:"+ip);
		UrlLog urlLog = new UrlLog();
		urlLog.setClientip(ip);
		urlLog.setUrl(request.getRequestURI());
		javaService.saveUrl(urlLog);
	}
}
