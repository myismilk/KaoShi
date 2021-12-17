package com.wangkaiping.service.impl;

import com.wangkaiping.dao.ManageDao;
import com.wangkaiping.domain.Manage;
import com.wangkaiping.service.ManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class ManageServiceImpl implements ManageService {
    @Autowired
    private ManageDao manageDao;

    @Override
    public Manage loginManage(Map<String, String> map) {
        return manageDao.loginManage(map);
    }
}
