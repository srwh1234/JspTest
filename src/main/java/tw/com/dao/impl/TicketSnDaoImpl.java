package tw.com.dao.impl;

import java.util.List;

import org.hibernate.query.Query;

import tw.com.dao.TicketSnDao;
import tw.com.entity.TicketSn;

public class TicketSnDaoImpl implements TicketSnDao {

	@Override
	public TicketSn selectById(final int id) {
		return this.getSession().get(TicketSn.class, id);
	}

	@Override
	public List<TicketSn> selectAll() {
		final String hql = "From TicketSn";
		final Query<TicketSn> query = this.getSession().createQuery(hql, TicketSn.class);
		return query.getResultList();
	}

	@Override
	public TicketSn update(final TicketSn t) {
		this.getSession().update(t);
		return t;
	}

	@Override
	public boolean insert(final TicketSn t) {
		this.getSession().persist(t);
		return false;
	}

	@Override
	public boolean deleteById(final int id) {
		final TicketSn t = selectById(id);
		if (t != null) {
			this.getSession().remove(t);
			return true;
		}
		return false;
	}

}
