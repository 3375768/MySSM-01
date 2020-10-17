package com.bjpowernode.service;

import com.bjpowernode.entity.Student;

import java.util.List;

public interface MyService {
    int addStudent(Student student);
    List<Student> findStudent();
}
