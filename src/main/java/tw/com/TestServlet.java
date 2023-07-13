package tw.com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.com.dao.TicketDao;
import tw.com.dao.impl.TicketDaoImpl;
import tw.com.entity.Ticket;

/**
 * for test
 */
@WebServlet("/Test")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {

		final TicketDao dao = new TicketDaoImpl();

		final Ticket ticket = dao.selectById(10);

		request.setAttribute("ticket", ticket);

		// final String url = "/front-end/Navbar.jsp";
		final String url = "/front-end/index.jsp";
		final RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
