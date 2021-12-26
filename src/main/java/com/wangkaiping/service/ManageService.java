package com.wangkaiping.service;

import com.wangkaiping.domain.Manage;
import com.wangkaiping.domain.Student;

import java.util.List;
import java.util.Map;

public interface ManageService {
    Manage loginManage(Map<String, String> map);

    List<Student> findAllStudentByManageId(Integer manage_id);
}
