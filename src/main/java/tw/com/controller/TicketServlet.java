package tw.com.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.Data;
import tw.com.entity.Ticket;
import tw.com.service.TicketService;
import tw.com.service.impl.TicketServiceImpl;

@WebServlet("/ticket")
public class TicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		final String[] locationTypes = {//
				"主題樂園", "景點門票", "水族館 & 動物園", "博物館 & 美術館", "歷史景點",//
		};
		final String[] taiwanCities = {//
				"基隆市", "台北市", "新北市", "桃園市", "新竹市", "新竹縣", "苗栗縣",//
				"台中市", "彰化縣", "南投縣", "雲林縣", "嘉義市", "嘉義縣", "台南市",//
				"高雄市", "屏東縣", "台東縣", "花蓮縣", "宜蘭縣", "澎湖縣", "金門縣", "連江縣"//
		};

		this.getServletContext().setAttribute("locationTypes", locationTypes);
		this.getServletContext().setAttribute("taiwanCities", taiwanCities);
	}

	@Override
	protected void doGet(final HttpServletRequest request, //
			final HttpServletResponse response) throws ServletException, IOException {

		final TicketService service = new TicketServiceImpl();

		final List<DescTicketDto> rndDescTicketDtos = service.getRndItems(request.getContextPath());
		request.setAttribute("rndDescTicketDtos", rndDescTicketDtos);

		final List<DescTicketDto> hotDescTicketDtos = service.getHotItems(request.getContextPath());
		request.setAttribute("hotDescTicketDtos", hotDescTicketDtos);

		// 跳轉
		final String url = "/front-end/ticket.jsp";
		final RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
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
