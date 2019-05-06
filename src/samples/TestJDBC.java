package samples;

import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestJDBC {
	public static void main(String args[]) {
		// Снова используем файл для вывода из-за кодировки
		try {
			System.setOut(new PrintStream("out.txt"));
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
			return;
		}

		System.out.println("Copyright 2009, Anton Saburov");
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("org.postgresql.Driver"); // выбираем нужный драйвер
			String url = "jdbc:postgresql://localhost:5432/students"; // указываем путь до базы
			con = DriverManager.getConnection(url, "postgres", "1"); // postgres- user, 1- пароль
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT * FROM students");
			while (rs.next()) {
				String str = rs.getString(1) + ":" + rs.getString(3);
				printString(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Эта часть позволяет нам закрыть все открытые ресуры
			// В противном случае возмжожны проблемы. Поэтому будьте
			// всегда аккуратны при работе с коннектами
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
				System.err.println("Error: " + ex.getMessage());
			}
		}
	}

	// Снова используем этот метод для вывода из-за кодировки
	public static void printString(Object s) {
		try {
			System.out.println(new String(s.toString()));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
