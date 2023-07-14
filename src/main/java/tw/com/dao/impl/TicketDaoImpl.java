package tw.com.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import tw.com.dao.TicketDao;
import tw.com.entity.Ticket;

public class TicketDaoImpl implements TicketDao {

	@Override
	public Ticket selectById(final int id) {
		return this.getSession().get(Ticket.class, id);
	}

	@Override
	public List<Ticket> selectAll() {
		final String hql = "FROM Ticket";
		final Query<Ticket> query = this.getSession().createQuery(hql, Ticket.class);
		return query.getResultList();
	}

	@Override
	public List<Ticket> selectAllOrderByTotalSales() {
		final String hql = "FROM Ticket ORDER BY totalSales DESC";
		final Query<Ticket> query = this.getSession().createQuery(hql, Ticket.class);
		return query.getResultList();
	}

	@Override
	public Ticket update(final Ticket t) {
		this.getSession().update(t);
		return t;
	}

	@Override
	public boolean insert(final Ticket t) {
		this.getSession().persist(t);
		return true;
	}

	@Override
	public boolean deleteById(final int id) {
		final Session session = this.getSession();
		final Ticket t = session.get(Ticket.class, id);
		if (t != null) {
			session.remove(t);
			return true;
		}
		return false;
	}

}
