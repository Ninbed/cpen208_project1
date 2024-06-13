package com.cpen.cpen_208.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cpen.cpen_208.db_connector.db_settings;
import com.cpen.cpen_208.models.cls_courses;

@RestController
@RequestMapping("/course_services")
public class course_services {
  cls_courses course_l = new cls_courses();

  @Autowired
  private db_settings cls_db_config;

  @GetMapping("/list_of_courses")
  public String list_of_courses() {
    course_l.con = cls_db_config.getCon();
    String result = course_l.select_all_courses();
    return result;
  }
}