package tw.com.dao.impl;

import java.util.List;

import org.hibernate.query.Query;

import tw.com.dao.PromotionDao;
import tw.com.entity.Promotion;

public class PromotionDaoImpl implements PromotionDao {

	@Override
	public Promotion selectById(final int id) {
		return this.getSession().get(Promotion.class, id);
	}

	@Override
	public List<Promotion> selectAll() {
		final String hql = "From Promotion";
		final Query<Promotion> query = this.getSession().createQuery(hql, Promotion.class);
		return query.getResultList();
	}

	@Override
	public Promotion update(final Promotion t) {
		this.getSession().update(t);
		return t;
	}

	@Override
	public boolean insert(final Promotion t) {
		this.getSession().persist(t);
		return true;
	}

	@Override
	public boolean deleteById(final int id) {
		final Promotion t = selectById(id);

		if (t != null) {
			this.getSession().remove(t);
			return true;
		}
		return false;
	}

}
