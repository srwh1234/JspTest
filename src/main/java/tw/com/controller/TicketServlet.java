package tw.com.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.Data;
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

@WebServlet("/ticket")
public class TicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(final HttpServletRequest request, //
			final HttpServletResponse response) throws ServletException, IOException {

		final TicketDao dao = new TicketDaoImpl();
		final TicketImageDao imageDao = new TicketImageDaoImpl();
		final PromotionDao promotionDao = new PromotionDaoImpl();
		final PromotionDetailDao promotionDetailDao = new PromotionDetailDaoImpl();

		final ArrayList<DescTicketDto> descTicketDtos = new ArrayList<>();
		for (final Ticket ticket : dao.selectAll()) {
			final DescTicketDto dto = new DescTicketDto(ticket);

			// 找圖片
			final TicketImage img = imageDao.selectByTicketId(ticket.getTicketId());
			if (img != null) {
				dto.setImage(request.getContextPath() + "/image/" + img.getId());
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

			descTicketDtos.add(dto);
		}

		request.setAttribute("descTicketDtos", descTicketDtos);

		final String url = "/front-end/ticket.jsp";
		final RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {

		// doGet(request, response);
	}

	@Data
	public static class DescTicketDto {
		public DescTicketDto(final Ticket ticket) {
			this.ticketId = ticket.getTicketId();
			this.name = ticket.getName();
			this.price = ticket.getPrice();
			this.rating = ticket.getRatingSum() / ticket.getRatingCount();
			this.ratingPerson = ticket.getRatingCount();
			this.city = ticket.getCity();
			this.description = ticket.getDescription();
		}

		private final long ticketId;
		private final String name;
		private final int price;
		private int available;
		private final int rating;
		private final int ratingPerson;
		private final String city;
		private final String description;
		private String image;
		private boolean favorite;
		private PromotionDto promotion;
	}

	@Data
	public static class PromotionDto {
		private int price;
		private Date startDate;
		private Date endDate;
	}
}
