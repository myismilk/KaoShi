package com.wangkaiping.service;

import com.wangkaiping.domain.Manage;

import java.util.Map;

public interface ManageService {
    Manage loginManage(Map<String, String> map);
}
