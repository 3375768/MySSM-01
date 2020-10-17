package com.bjpowernode.controller;

import com.bjpowernode.entity.Student;
import com.bjpowernode.service.MyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/student")
public class MyController {

    @Resource
    private MyService service;

    @RequestMapping("/addstudent.do")
    public ModelAndView addStudent(Student student){
        ModelAndView mv = new ModelAndView();
        int num = service.addStudent(student);
        mv.addObject("name",student.getName());
        if (num == 1){
            mv.addObject("result","添加成功");
        } else {
            mv.addObject("result","添加失败");
        }
        mv.setViewName("result");
        return mv;
    }

    @RequestMapping("/findStudent.do")
    @ResponseBody
    public List<Student> findStudent(){
        List<Student> students = service.findStudent();
        System.out.println(students);
        return students;
    }
}
