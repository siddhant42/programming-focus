package com.app.java.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.service.JavaService;
import com.app.utiltiy.Common;

@Controller
public class OopsController {
	private static Logger log = LoggerFactory.getLogger(OopsController.class);
	@Autowired
	JavaService javaService;
	@RequestMapping(value="/java/static-method-overriding", method = RequestMethod.GET)
	public String staticMethod(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService, request);
		return "java/staticMethod";
	}
	
}
