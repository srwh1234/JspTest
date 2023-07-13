package tw.com.controller;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import lombok.Data;
import tw.com.Utils;

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

		for (final Part part : request.getParts()) {
			final String partName = part.getName();

			if (partName.equals("post")) {
				final StringBuilder sb = new StringBuilder();
				try (BufferedReader reader = new BufferedReader(new InputStreamReader(part.getInputStream()))) {
					String line;
					while ((line = reader.readLine()) != null) {
						sb.append(line);
					}
				}
				dto = Utils.fromJson(sb.toString(), TikcetDto.class);

			} else if (partName.equals("images")) {
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

		if (dto != null) {
			System.out.println(dto);
		}
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().write("1");
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
