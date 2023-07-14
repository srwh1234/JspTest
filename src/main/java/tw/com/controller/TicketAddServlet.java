package tw.com.controller;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import lombok.Data;
import tw.com.Utils;
import tw.com.dao.TicketDao;
import tw.com.dao.TicketImageDao;
import tw.com.dao.TicketSnDao;
import tw.com.dao.TicketTypeDao;
import tw.com.dao.impl.TicketDaoImpl;
import tw.com.dao.impl.TicketImageDaoImpl;
import tw.com.dao.impl.TicketSnDaoImpl;
import tw.com.dao.impl.TicketTypeDaoImpl;
import tw.com.entity.Ticket;
import tw.com.entity.TicketImage;
import tw.com.entity.TicketSn;
import tw.com.entity.TicketType;

@WebServlet("/add/ticket")
@MultipartConfig(//
		maxFileSize = 1024 * 1024 * 10, // 允許單個檔案最大大小
		maxRequestSize = 1024 * 1024 * 50 // 允許整個 multipart/form-data 要求最大大小
)
public class TicketAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(final HttpServletRequest request,//
			final HttpServletResponse response) throws ServletException, IOException {
		TikcetDto dto = null;
		final List<byte[]> imgBytes = new ArrayList<>();

		// 獲得請求資料
		for (final Part part : request.getParts()) {
			final String partName = part.getName();

			if (partName.equals("post")) {
				// JSON物件
				final StringBuilder sb = new StringBuilder();
				try (BufferedReader reader = new BufferedReader(new InputStreamReader(part.getInputStream()))) {
					String line;
					while ((line = reader.readLine()) != null) {
						sb.append(line);
					}
				}
				dto = Utils.fromJson(sb.toString(), TikcetDto.class);

			} else if (partName.equals("images")) {
				// 圖檔
				try (InputStream is = part.getInputStream();//
						ByteArrayOutputStream os = new ByteArrayOutputStream();) {

					final byte[] buffer = new byte[4096];
					int len;
					while ((len = is.read(buffer)) != -1) {
						os.write(buffer, 0, len);
					}
					imgBytes.add(os.toByteArray());
				}
			}
		}

		response.setContentType("application/json; charset=UTF-8");
		if (dto != null) {
			final TicketDao dao = new TicketDaoImpl();
			final TicketTypeDao typeDao = new TicketTypeDaoImpl();

			response.getWriter().write("1");

			// 如果是0張
			if (dto.getAvailable() <= 0) {
				return;
			}

			// 判斷票券類型
			final TicketType type = typeDao.findByName(dto.getTicketType());
			if (type == null) {
				return;
			}

			// 預設為上架
			final Ticket ticket = new Ticket();

			ticket.setName(dto.getName());
			ticket.setTicketType(type);
			ticket.setStatus(1);// 上架
			ticket.setPrice(dto.getPrice());
			ticket.setTotalSales(dto.getTotalSales());
			ticket.setExpiryDate(dto.getExpiryDate());
			ticket.setDescription(dto.getDescription());
			ticket.setContent(dto.getContent());
			ticket.setNote(dto.getNote());
			ticket.setSupplierName(dto.getSupplierName());
			ticket.setCity(dto.getCity());
			ticket.setAddress(dto.getAddress());
			ticket.setLatitude(dto.getLatitude());
			ticket.setLongitude(dto.getLongitude());
			ticket.setRatingSum(dto.getRating() * dto.getRatingPerson());
			ticket.setRatingCount(dto.getRatingPerson());

			// 新增票券
			dao.insert(ticket);

			// 隨機序號
			createSerialNumber(ticket, dto.getAvailable());

			// 加入新的圖片
			for (final byte[] bytes : imgBytes) {
				addImage(ticket.getTicketId(), bytes);
			}
			return;
		}
		response.getWriter().write("0");
	}

	public String addImage(final int ticketId, final byte[] array) {
		final TicketDao dao = new TicketDaoImpl();
		final TicketImageDao imgDao = new TicketImageDaoImpl();

		final String result = null;

		final Ticket ticket = dao.selectById(ticketId);

		if (ticket == null) {
			return result;
		}

		final TicketImage image = new TicketImage();
		image.setTicketId(ticketId);
		image.setImage(array);
		image.setUploadTime(Timestamp.from(Instant.now()));

		imgDao.insert(image);

		return "/image/" + image.getId();
	}

	private List<TicketSn> createSerialNumber(final Ticket ticket, final int createCount) {
		final TicketSnDao dao = new TicketSnDaoImpl();

		final List<TicketSn> result = new ArrayList<>();
		for (int i = 0; i < createCount; i++) {
			final TicketSn ticketSn = new TicketSn();
			ticketSn.setTicket(ticket);

			final String uuId = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20).toUpperCase();
			ticketSn.setSerialNumber(uuId);
			ticketSn.setStatus(0);// 未使用
			result.add(ticketSn);

			dao.insert(ticketSn);
		}
		return result;
	}

	// 定義請求物件
	@Data
	public static class TikcetDto {
		private int ticketId;
		private String ticketType;
		private String name;
		private int price;
		private int available;
		private int totalSales;
		private Date expiryDate;
		private String description = "description";
		private String content = "content";
		private String note = "note";
		private String supplierName;
		private String city;
		private String address;
		private double latitude;
		private double longitude;
		private int rating;
		private int ratingPerson;
		private final List<String> images = new ArrayList<>();

	}
}
