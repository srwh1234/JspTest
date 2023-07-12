package tw.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.com.dao.TicketImageDao;
import tw.com.dao.impl.TicketImageDaoImpl;
import tw.com.entity.TicketImage;

@WebServlet("/image/*")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(final HttpServletRequest request,//
			final HttpServletResponse response) throws ServletException, IOException {

		final int id = Integer.parseInt(request.getPathInfo().substring(1));

		final TicketImageDao dao = new TicketImageDaoImpl();

		final TicketImage ticketImage = dao.selectById(id);

		response.setContentType("image/gif");

		response.getOutputStream().write(ticketImage.getImage());

	}

}
