package com.wangkaiping.service.impl;

import com.wangkaiping.dao.ManageDao;
import com.wangkaiping.domain.Manage;
import com.wangkaiping.domain.Student;
import com.wangkaiping.service.ManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ManageServiceImpl implements ManageService {
    @Autowired
    private ManageDao manageDao;

    @Override
    public Manage loginManage(Map<String, String> map) {
        return manageDao.loginManage(map);
    }

    @Override
    public List<Student> findAllStudentByManageId(Integer manage_id) {
        return manageDao.findAllStudentByManageId(manage_id);
    }
}
