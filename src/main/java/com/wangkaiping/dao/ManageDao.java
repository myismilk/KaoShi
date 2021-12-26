package com.wangkaiping.dao;

import com.wangkaiping.domain.Manage;
import com.wangkaiping.domain.Student;

import java.util.List;
import java.util.Map;

public interface ManageDao {
    Manage loginManage(Map<String, String> map);

    List<Student> findAllStudentByManageId(Integer manage_id);
}
