package com.wangkaiping.controller.studentController;

import com.wangkaiping.domain.Student;
import com.wangkaiping.service.StudentService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class SelfController {
    @Autowired
    private StudentService studentServiceImpl;


    //查看学生个人信息
    @RequestMapping("/workbean/self/studentMessage.do")
    public ModelAndView getStudentMessage() {
        ModelAndView mav = new ModelAndView();
        Student student = studentServiceImpl.findStudentById(20180001);
        System.out.println(student);
        mav.addObject("student", student);
        mav.setViewName("workbean/studentInterface/self/mySelf");
        return mav;
    }


    //修改个人的自我评价
    @RequestMapping(value = "/workbean/studentInterface/self/editEvaluation.do", produces = {"text/plain;charset=utf-8"})
    public @ResponseBody
    String editEvaluation(HttpServletRequest request) {
        String context = request.getParameter("context");
        Integer studengId = Integer.valueOf(request.getParameter("studentId"));
        Map<String, Object> map = new HashMap<>();
        map.put("context", context);
        map.put("studentId", studengId);
        String result = studentServiceImpl.editEvaluation(map);
        return result;
    }

    //修改头像的请求
    @RequestMapping("/workbean/studentInterface/self/editPhoto")
    public String editPhoto(HttpServletRequest request) throws Exception {
        boolean multipartContent = ServletFileUpload.isMultipartContent(request);
        if (!multipartContent) {
            return "不是二进制传输";
        }
//创建FileItemFactory对象
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
        servletFileUpload.setHeaderEncoding("utf-8");
        List<FileItem> items = servletFileUpload.parseRequest(request);
        Map<String,String> map = new HashMap<>();
//迭代出每一个FileItem
        for (FileItem item : items) {
            if (item.isFormField()) {
                // 不是上传组件
                String fieldName = item.getFieldName(); // 获取组件名称
                String value = item.getString("utf-8"); // 解决乱码问题
                System.out.println(fieldName + "   " + value);
                map.put(fieldName,value);
            } else {
                // 是上传组件
                // 得到上传文件真实名称
                String fileName = UUID.randomUUID() + item.getName();
//获取将图片存放的路径
                String str = request.getSession().getServletContext().getRealPath("/userImg/" + fileName);
                item.write(new File(str));
                map.put("url",fileName);
            }
        }
        Integer result = studentServiceImpl.editPhoto(map);
        return "forward:/workbean/self/studentMessage.do";
    }


}
