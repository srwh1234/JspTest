package tw.com.hibernate;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

@WebListener
public class HibernateListener implements ServletContextListener {
	@Override
	public void contextInitialized(final ServletContextEvent sce) {
		HibernateUtil.getSessionFactory();
		System.out.println("[HibernateListener.java]: 初始化SessionFactory");
	}

	@Override
	public void contextDestroyed(final ServletContextEvent sce) {
		HibernateUtil.shutdown();
		System.out.println("[HibernateListener.java]: 關閉SessionFactory");

		AbandonedConnectionCleanupThread.uncheckedShutdown();
		System.out.println("[HibernateListener.java]: 關閉JDBC driver");
	}
}
