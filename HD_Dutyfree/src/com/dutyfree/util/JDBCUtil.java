package com.dutyfree.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
//박진수

//Connection 객체와 Callable statement 객체의 연결을 종료시키는 클래스
public class JDBCUtil {
	
	//Connection 객체가 존재하면 연결을 종료시키는 메소드
	public static void close(Connection conn) {
		try {
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//CallableStatement 객체가 존재하면 객체의 연결을 종료시키는 메서드
	public static void close(CallableStatement cstmt) {
		try {
			if(cstmt!=null) cstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//ResultSet 객체가 존재하면 연결을 종료시키는 메소드
	public static void close(ResultSet rs) {
		try {
			if(rs!=null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}