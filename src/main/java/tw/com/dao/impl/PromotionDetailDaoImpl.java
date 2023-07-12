package tw.com.dao.impl;

import java.util.List;

import org.hibernate.query.Query;

import tw.com.dao.PromotionDetailDao;
import tw.com.entity.PromotionDetail;

public class PromotionDetailDaoImpl implements PromotionDetailDao {

	@Override
	public PromotionDetail selectById(final int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PromotionDetail> selectAll() {
		final String hql = "From PromotionDetail";
		final Query<PromotionDetail> query = this.getSession().createQuery(hql, PromotionDetail.class);
		return query.getResultList();
	}

	@Override
	public PromotionDetail update(final PromotionDetail t) {
		this.getSession().update(t);
		return t;
	}

	@Override
	public boolean insert(final PromotionDetail t) {
		this.getSession().persist(t);
		return true;
	}

	@Override
	public boolean deleteById(final int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PromotionDetail selsectByTicketId(final int ticketId) {
		final String hql = "SELECT d FROM PromotionDetail d JOIN Promotion p "//
				+ "ON p.promotionId=d.key.promotionId "//
				+ "WHERE d.key.ticketId= :id " //
				+ "AND CURRENT_TIMESTAMP >= p.startDate "//
				+ "AND CURRENT_TIMESTAMP <= p.endDate";//
		final Query<PromotionDetail> query = this.getSession().createQuery(hql, PromotionDetail.class);
		query.setParameter("id", ticketId);

		if (query.getResultList().isEmpty()) {
			return null;
		}
		return query.getResultList().get(0);
	}
}
