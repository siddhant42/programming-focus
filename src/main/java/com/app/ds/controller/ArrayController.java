package com.app.ds.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.controller.DSController;
import com.app.model.UrlLog;
import com.app.service.JavaService;
import com.app.utiltiy.Common;

@Controller
public class ArrayController {

	private static Logger log = LoggerFactory.getLogger(DSController.class);
	@Autowired
	JavaService javaService;
	@RequestMapping(value="/data-structures/histogram", method = RequestMethod.GET)
	public String histogram(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "/data-structures/array/histogram";
	}
	@RequestMapping(value="/data-structures/inversionCount", method = RequestMethod.GET)
	public String inversionCount(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "/data-structures/array/inversionCount";
	}
	@RequestMapping(value="/data-structures/kthlargest", method = RequestMethod.GET)
	public String kthLargest(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "/data-structures/array/kthLargest";
	}
	@RequestMapping(value="/data-structures/kthsmallest", method = RequestMethod.GET)
	public String kthSmallest(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "/data-structures/array/kthSmallest";
	}
	@RequestMapping(value="/data-structures/median-samelength", method = RequestMethod.GET)
	public String medianSameLength(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "/data-structures/array/median-samelength";
	}
	@RequestMapping(value="/data-structures/median-unequallength", method = RequestMethod.GET)
	public String medianUnequalLength(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "/data-structures/array/median-unequalLength";
	}
	@RequestMapping(value="/data-structures/nthprime", method = RequestMethod.GET)
	public String nthPrime(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "/data-structures/array/nthPrime";
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
