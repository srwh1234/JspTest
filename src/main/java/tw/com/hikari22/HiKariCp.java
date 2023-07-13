package tw.com.hikari22;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HiKariCp {

	public static HiKariCp get() {
		return Ineer.instance;
	}

	private static class Ineer {
		private static HiKariCp instance = new HiKariCp();
	}

	private DataSource ds;

	private HiKariCp() {
		try {
			final Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/myjdbc");
		} catch (final Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws SQLException {
		if (ds == null) {
			throw new SQLException("未設定連線池");
		}
		return ds.getConnection();
	}
}
