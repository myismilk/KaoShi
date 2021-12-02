package com.wangkaiping;

import com.wangkaiping.service.StudentService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class Test1 {

    @Test
    public void test001() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-config.xml");
        StudentService studentService = (StudentService) applicationContext.getBean("studentServiceImpl");
        studentService.findStudentById(1);
    }
}
