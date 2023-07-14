package tw.com.dao.impl;

import java.util.List;

import org.hibernate.query.Query;

import tw.com.dao.TicketTypeDao;
import tw.com.entity.TicketType;

public class TicketTypeDaoImpl implements TicketTypeDao {

	@Override
	public TicketType selectById(final int id) {
		return this.getSession().get(TicketType.class, id);
	}

	@Override
	public List<TicketType> selectAll() {
		final String hql = "From TicketType";
		final Query<TicketType> query = this.getSession().createQuery(hql, TicketType.class);
		return query.getResultList();
	}

	@Override
	public TicketType update(final TicketType t) {
		this.getSession().update(t);
		return t;
	}

	@Override
	public boolean insert(final TicketType t) {
		this.getSession().persist(t);
		return false;
	}

	@Override
	public boolean deleteById(final int id) {
		final TicketType t = selectById(id);
		if (t != null) {
			this.getSession().remove(t);
			return true;
		}
		return false;
	}

	@Override
	public TicketType findByName(final String name) {
		final String hql = "From TicketType WHERE name=:name";
		final Query<TicketType> query = this.getSession().createQuery(hql, TicketType.class);
		query.setParameter("name", name);

		if (query.getResultList().isEmpty()) {
			return null;
		}
		return query.getResultList().get(0);
	}

}
