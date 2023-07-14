package tw.com.dao;

import java.util.List;

import tw.com.entity.Ticket;

public interface TicketDao extends BaseDao<Ticket> {

	// 按照銷售排序
	public List<Ticket> selectAllOrderByTotalSales();
}
