package tw.com.service;

import java.util.List;

import tw.com.controller.TicketServlet.DescTicketDto;

public interface TicketService {

	public List<DescTicketDto> getRndItems(String contextPath);

	public List<DescTicketDto> getHotItems(String contextPath);
}
