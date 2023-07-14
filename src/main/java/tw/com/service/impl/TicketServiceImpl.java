package tw.com.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import tw.com.controller.TicketServlet.DescTicketDto;
import tw.com.controller.TicketServlet.PromotionDto;
import tw.com.dao.PromotionDao;
import tw.com.dao.PromotionDetailDao;
import tw.com.dao.TicketDao;
import tw.com.dao.TicketImageDao;
import tw.com.dao.impl.PromotionDaoImpl;
import tw.com.dao.impl.PromotionDetailDaoImpl;
import tw.com.dao.impl.TicketDaoImpl;
import tw.com.dao.impl.TicketImageDaoImpl;
import tw.com.entity.Promotion;
import tw.com.entity.PromotionDetail;
import tw.com.entity.Ticket;
import tw.com.entity.TicketImage;
import tw.com.service.TicketService;

public class TicketServiceImpl implements TicketService {
	private final TicketDao dao = new TicketDaoImpl();
	private final TicketImageDao imageDao = new TicketImageDaoImpl();
	private final PromotionDao promotionDao = new PromotionDaoImpl();
	private final PromotionDetailDao promotionDetailDao = new PromotionDetailDaoImpl();

	@Override
	public List<DescTicketDto> getRndItems(final String contextPath) {
		final List<Ticket> tickets = dao.selectAll();

		Collections.shuffle(tickets);

		final ArrayList<DescTicketDto> result = new ArrayList<>();
		for (final Ticket ticket : tickets) {
			if (result.size() >= 4) {
				break;
			}
			final DescTicketDto dto = new DescTicketDto(ticket);

			// 找圖片
			final TicketImage img = imageDao.selectByTicketId(ticket.getTicketId());
			if (img != null) {
				dto.setImage(contextPath + "/image/" + img.getId());
			}
			// 找促銷
			final PromotionDetail detail = promotionDetailDao.selsectByTicketId(ticket.getTicketId());
			if (detail != null) {
				final Promotion promotion = promotionDao.selectById(detail.getKey().getPromotionId());

				final PromotionDto promotionDto = new PromotionDto();
				promotionDto.setPrice(detail.getPromotionPrice());
				promotionDto.setStartDate(promotion.getStartDate());
				promotionDto.setEndDate(promotion.getEndDate());
				dto.setPromotion(promotionDto);
			}
			result.add(dto);
		}
		return result;
	}

	@Override
	public List<DescTicketDto> getHotItems(final String contextPath) {
		final ArrayList<DescTicketDto> result = new ArrayList<>();
		for (final Ticket ticket : dao.selectAllOrderByTotalSales()) {
			if (result.size() >= 8) {
				break;
			}
			final DescTicketDto dto = new DescTicketDto(ticket);

			// 找圖片
			final TicketImage img = imageDao.selectByTicketId(ticket.getTicketId());
			if (img != null) {
				dto.setImage(contextPath + "/image/" + img.getId());
			}
			// 找促銷
			final PromotionDetail detail = promotionDetailDao.selsectByTicketId(ticket.getTicketId());
			if (detail != null) {
				final Promotion promotion = promotionDao.selectById(detail.getKey().getPromotionId());

				final PromotionDto promotionDto = new PromotionDto();
				promotionDto.setPrice(detail.getPromotionPrice());
				promotionDto.setStartDate(promotion.getStartDate());
				promotionDto.setEndDate(promotion.getEndDate());
				dto.setPromotion(promotionDto);
			}
			result.add(dto);
		}
		return result;
	}
}
