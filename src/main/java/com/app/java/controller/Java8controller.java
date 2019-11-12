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
public class Java8controller {
	private static Logger log = LoggerFactory.getLogger(Java8controller.class);
	@Autowired
	JavaService javaService;
	@RequestMapping(value="/java/lambdas", method = RequestMethod.GET)
	public String lambdas(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService,request);
		return "java/lambdas";
	}
	@RequestMapping(value="/java/streams", method = RequestMethod.GET)
	public String streams(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService,request);
		return "java/streams";
	}
	@RequestMapping(value="/java/pattern-matching", method = RequestMethod.GET)
	public String patternMatching(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService,request);
		return "java/pattern-matching";
	}
	@RequestMapping(value="/java/map-functions", method = RequestMethod.GET)
	public String mapFunction(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService,request);
		return "/java/map-functions";
	}
	@RequestMapping(value="/java/method-reference", method = RequestMethod.GET)
	public String methodReference(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService,request);
		return "/java/method-reference";
	}
	@RequestMapping(value="/java/optional", method = RequestMethod.GET)
	public String optional(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService,request);
		return "/java/optional";
	}
}
