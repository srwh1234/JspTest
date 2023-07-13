package tw.com;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Utils {

	/**
	 * 關閉AutoCloseable
	 */
	public static void close(final AutoCloseable... acs) {
		for (final AutoCloseable ac : acs) {
			close(ac);
		}
	}

	/**
	 * 關閉AutoCloseable
	 */
	public static void close(final AutoCloseable ac) {
		if (ac == null) {
			return;
		}
		try {
			ac.close();
		} catch (final Exception e) {
			//
		}
	}

	/**
	 * json物件的轉換
	 */
	public static final Gson GSON = new GsonBuilder().setDateFormat("yyy-MM-dd").create();

	public static <T> T fromJson(final String json, final Class<T> classOfT) {
		return GSON.fromJson(json, classOfT);
	}

	public static String toJson(final Object src) {
		return GSON.toJson(src);
	}
}
