package tw.com.dao;

import tw.com.entity.TicketImage;

public interface TicketImageDao extends BaseDao<TicketImage> {
	public TicketImage selectByTicketId(int ticketId);
}
