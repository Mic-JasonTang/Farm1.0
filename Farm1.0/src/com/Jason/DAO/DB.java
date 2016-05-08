package com.Jason.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

import org.junit.Test;

public class DB {
	
	public static Connection getConn() {
		Connection conn = null;
		if (conn == null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(
						"jdbc:mysql://localhost/farm", "root", "361239731");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return conn;
	}

	public static Statement createStmt(Connection conn) {
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			System.out.println("DB--加载语句出错");
			e.printStackTrace();
		}
		return stmt;
	}
	/**
	 * 
	* @Title: getKey 
	* @Description: 返回产生的主键 
	* @param conn
	* @param sql
	* @return int    返回类型 
	* @throws
	 */
	public static int getKey(Connection conn, String sql) {
		ResultSet rsKey = null;
		int key = -1;
		PreparedStatement pstmt = null;
		if(pstmt == null) {
			try {
				pstmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
				rsKey = pstmt.getGeneratedKeys();
				rsKey.next();
				key = rsKey.getInt(1);
			} catch (SQLException e) {
				System.out.println("DB--创建预处理语句,返回主键时出错");
				e.printStackTrace();
			}
		}
		return key;
	}
	public static PreparedStatement createPstmt(Connection conn, String sql) {
		PreparedStatement pstmt = null;
		if (pstmt == null) {
			try {
				pstmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			} catch (SQLException e) {
				System.out.println("DB--加载预处理语句出错");
				e.printStackTrace();
			}
		}
		return pstmt;
	}

	public static ResultSet exeQuery(Statement stmt, String sql) {
		ResultSet rs = null;
		if (rs == null) {
			try {
				rs = stmt.executeQuery(sql);
			} catch (SQLException e) {
				System.out.println("DB--数据查询出错");
				e.printStackTrace();
			}
		}
		return rs;
	}
	
	public static void exeInsert(Connection conn, String sql) {
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			stmt.execute(sql);
		} catch (SQLException e) {
			System.out.println("DB--数据插入出错");
			e.printStackTrace();
		}
	}
	public static void exeUpdate(Connection conn, String sql) {
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println("DB--数据更新出错");
			e.printStackTrace();
		}
	}

	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
				conn = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void close(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
				stmt = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void close(PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
				pstmt = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
