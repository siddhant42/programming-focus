package com.app.utiltiy;

import javax.servlet.http.HttpServletRequest;

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
	private Common() {
		new AssertionError();
	}
}
