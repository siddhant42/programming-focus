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
public class ClassesNObjectsController {
	private static Logger log = LoggerFactory.getLogger(ClassesNObjectsController.class);
	@Autowired
	JavaService javaService;
	@RequestMapping(value="/java/weak-references", method = RequestMethod.GET)
	public String weakReferences(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService,request);
		return "java/weak-references";
	}
	@RequestMapping(value="/java/overriding-hashcode-equals", method = RequestMethod.GET)
	public String hashcodeEquals(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService,request);
		return "java/overriding-hashcode-equals";
	}
	@RequestMapping(value="/java/object-creation", method = RequestMethod.GET)
	public String creatingObject(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService,request);
		return "java/object-creation";
	}
}
