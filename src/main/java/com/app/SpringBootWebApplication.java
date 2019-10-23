package com.app;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication
public class SpringBootWebApplication extends SpringBootServletInitializer {
	private static Logger log = LoggerFactory.getLogger(SpringBootWebApplication.class);
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(SpringBootWebApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(SpringBootWebApplication.class, args);
	}
	
//	@Override
//	public void onStartup(ServletContext container) {
//		System.out.println("inside onstartup function");
//		XmlWebApplicationContext appContext = new XmlWebApplicationContext();
//		appContext.setConfigLocation("/WEB-INF/spring/dispatcher-config.xml");
//
//		ServletRegistration.Dynamic dispatcher =
//				container.addServlet("dispatcher", new DispatcherServlet(appContext));
//		dispatcher.setLoadOnStartup(1);
//		dispatcher.addMapping("/");
//		log.info("dispatcher");
//		Map<String,String> map =dispatcher.getInitParameters();
//		for(String key:map.keySet()) {
//			log.info(key+":"+map.get(key));
//		}
//		log.info("mappings:");
//		Set<String> set = (Set<String>) dispatcher.getMappings();
//		for(String key:set) {
//			log.info(key);
//		}
//		container.addFilter("requestLoggingFilter", CommonsRequestLoggingFilter.class)
//		.addMappingForServletNames(null, false, "dispatcher");
//	}
}