package ssg.com.a.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.a.dao.BbsDao;

@Service
public class BbsServiceImpl implements BbsService{

	@Autowired
	BbsDao dao;
}
