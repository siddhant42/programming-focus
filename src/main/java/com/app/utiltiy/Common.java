package com.app.utiltiy;

import javax.servlet.http.HttpServletRequest;

import com.app.model.UrlLog;
import com.app.service.JavaService;

public class Common {
	public static String getClientIp(HttpServletRequest request) {

        String remoteAddr = "";

        if (request != null) {
            remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || "".equals(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }
        }

        return remoteAddr;
    }
	public static void saveUrl(JavaService javaService,HttpServletRequest request) {
		String ip = Common.getClientIp(request);
		//System.out.println("called from ip:"+ip);
		UrlLog urlLog = new UrlLog();
		urlLog.setClientip(ip);
		urlLog.setUrl(request.getRequestURI());
		javaService.saveUrl(urlLog);
	}
	private Common() {
		new AssertionError();
	}
}
