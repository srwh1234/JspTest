package tw.com.hibernate;

import javax.servlet.FilterChain;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

@WebFilter("/*")
public class HibernateFilter extends HttpFilter {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doFilter(final HttpServletRequest req, final HttpServletResponse res, final FilterChain chain) {

		final Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// System.out.println("[HibernateFilter.java]: 開始交易");
		try {
			final Transaction transaction = session.beginTransaction();
			chain.doFilter(req, res);
			transaction.commit();
		} catch (final Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			System.out.println("[HibernateFilter.java]: 交易失敗");
		}
		// System.out.println("[HibernateFilter.java]: 結束交易");
	}
}
