package com.app.algo.controller;

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
public class SearchNSortController {
	private static Logger log = LoggerFactory.getLogger(SearchNSortController.class);
	@Autowired
	JavaService javaService;
	
	@RequestMapping(value="/algorithms/bubble-sort", method = RequestMethod.GET)
	public String bubbleSort(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "/algorithms/searchNsort/bubble-sort";
	}
	@RequestMapping(value="/algorithms/heap-sort", method = RequestMethod.GET)
	public String heapSort(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "/algorithms/searchNsort/heap-sort";
	}
	@RequestMapping(value="/algorithms/insertion-sort", method = RequestMethod.GET)
	public String insertionSort(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "/algorithms/searchNsort/insertion-sort";
	}
	@RequestMapping(value="/algorithms/merge-sort", method = RequestMethod.GET)
	public String mergeSort(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "/algorithms/searchNsort/merge-sort";
	}
	@RequestMapping(value="/algorithms/quick-sort", method = RequestMethod.GET)
	public String quickSort(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "/algorithms/searchNsort/quick-sort";
	}
	@RequestMapping(value="/algorithms/selection-sort", method = RequestMethod.GET)
	public String selectionSort(HttpServletRequest request) {
		log.info("incoming request:"+request.getRequestURI());
		saveUrl(request);
		return "/algorithms/searchNsort/selection-sort";
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
