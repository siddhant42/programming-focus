package com.app.ds.controller;

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
public class LinkedListController {
	private static Logger log = LoggerFactory.getLogger(LinkedListController.class);
	@Autowired
	JavaService javaService;
	
	@RequestMapping(value="/data-structures/findloop", method = RequestMethod.GET)
	public String findloop(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService,request);
		return "/data-structures/linkedlist/findloop";
	}
	@RequestMapping(value="/data-structures/palindrome", method = RequestMethod.GET)
	public String palindrome(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService,request);
		return "/data-structures/linkedlist/palindrome";
	}
	@RequestMapping(value="/data-structures/reverse-iterative", method = RequestMethod.GET)
	public String reverseIterative(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService,request);
		return "/data-structures/linkedlist/reverse-iterative";
	}
	@RequestMapping(value="/data-structures/reverse-recursive", method = RequestMethod.GET)
	public String reverseRecursive(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		Common.saveUrl(javaService,request);
		return "/data-structures/linkedlist/reverse-recursive";
	}
}
