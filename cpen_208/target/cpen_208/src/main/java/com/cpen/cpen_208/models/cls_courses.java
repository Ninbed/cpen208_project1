package com.cpen.cpen_208.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class cls_courses {
  public Connection con = null;

  public String select_all_courses() {
    String result = null;
    String SQL = "SELECT * FROM ses.select_all_courses()";
    Connection conn = con;
    try {

      PreparedStatement pstmt = conn.prepareStatement(SQL);
      ResultSet rs = pstmt.executeQuery();
      while (rs.next()) {
        result = rs.getString("select_all_courses");
      }
    } catch (SQLException e) {
      // Print Errors in console.
      System.out.println(e.getMessage());
    } finally {
      if (conn != null) {
        try {
          conn.close();
        } catch (SQLException ex) {
          ex.printStackTrace();
        }
      }
    }
    return result;

  }
}