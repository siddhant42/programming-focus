package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.model.UrlLog;
import com.app.repository.JavaRepo;

@Service
public class JavaService {
	JavaRepo javaRepo;
	@Autowired
	public JavaService(JavaRepo javaRepo) {
		this.javaRepo = javaRepo;
	}
	public void saveUrl(UrlLog urlLog) {
		javaRepo.save(urlLog);
	}
}
