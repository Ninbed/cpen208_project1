package com.obed.cpen208.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.obed.cpen208.db_connector.db_layer;
import com.obed.cpen208.models.cls_course;

@RestController
@RequestMapping("/course_service")
public class course_service {
  cls_course course_l = new cls_course();

  @Autowired
  private db_layer db_config;

   // Yearly outstanding fees
   @CrossOrigin(origins = "*")
   @GetMapping("/yearly_outstanding_fees")
   public Object yearly_outstanding_fees(@RequestParam String s_id) {
     course_l.con = db_config.getCon();
     Object result = course_l.outstanding_fees(s_id);
     return result;
   }
   
}
