package tw.com.dao.impl;

import java.util.List;

import org.hibernate.query.Query;

import tw.com.dao.TicketImageDao;
import tw.com.entity.TicketImage;

public class TicketImageDaoImpl implements TicketImageDao {

	@Override
	public TicketImage selectById(final int id) {
		return this.getSession().get(TicketImage.class, id);
	}

	@Override
	public List<TicketImage> selectAll() {
		final String hql = "From TicketImage";
		final Query<TicketImage> query = this.getSession().createQuery(hql, TicketImage.class);
		return query.getResultList();
	}

	@Override
	public TicketImage update(final TicketImage t) {
		this.getSession().update(t);
		return t;
	}

	@Override
	public boolean insert(final TicketImage t) {
		this.getSession().persist(t);
		return true;
	}

	@Override
	public boolean deleteById(final int id) {
		final TicketImage t = selectById(id);
		if (t != null) {
			this.getSession().remove(t);
			return true;
		}
		return false;
	}

	@Override
	public TicketImage selectByTicketId(final int ticketId) {
		final String hql = "From TicketImage WHERE ticketId= :id";
		final Query<TicketImage> query = this.getSession().createQuery(hql, TicketImage.class);
		query.setParameter("id", ticketId);

		if (query.getResultList().isEmpty()) {
			return null;
		}
		return query.getResultList().get(0);
	}

}
