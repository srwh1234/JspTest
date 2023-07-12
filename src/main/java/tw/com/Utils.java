package tw.com;

public class Utils {

	public static void close(final AutoCloseable... acs) {
		for (final AutoCloseable ac : acs) {
			close(ac);
		}
	}

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
}
