package tw.com.dao;

import tw.com.entity.TicketType;

public interface TicketTypeDao extends BaseDao<TicketType> {
	public TicketType findByName(String name);
}
