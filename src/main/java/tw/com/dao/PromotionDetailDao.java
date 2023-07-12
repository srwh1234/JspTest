package tw.com.dao;

import tw.com.entity.PromotionDetail;

public interface PromotionDetailDao extends BaseDao<PromotionDetail> {
	public PromotionDetail selsectByTicketId(int ticketId);
}
