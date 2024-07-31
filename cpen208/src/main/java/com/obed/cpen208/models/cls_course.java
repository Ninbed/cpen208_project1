package com.obed.cpen208.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
// import org.mindrot.jbcrypt.BCrypt;
// import org.json.JSONObject;

import org.springframework.stereotype.Service;
// import org.springframework.web.bind.annotation.RequestParam;

@Service
public class cls_course {
  public Connection con = null;

  // outstanding fees
  public Object outstanding_fees(String s_id) {
    Object result = null;
    String SQL = "SELECT student_mngt.calculate_outstanding_fees(?)";
    Connection conn = con;

    try {
      PreparedStatement pstmt = conn.prepareStatement(SQL);
      pstmt.setString(1, s_id);
      ResultSet rs = pstmt.executeQuery();
      while (rs.next()) {
        result = rs.getDouble("calculate_outstanding_fees");
      }
    } catch (SQLException e) {
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
  };
}
