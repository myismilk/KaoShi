package com.wangkaiping.dao;

import com.wangkaiping.domain.Manage;

import java.util.Map;

public interface ManageDao {
    Manage loginManage(Map<String, String> map);
}
