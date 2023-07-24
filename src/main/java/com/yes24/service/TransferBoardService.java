package com.yes24.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.TicketDAO;
import com.yes24.dao.TransferBoardDAO;
import com.yes24.vo.TransferBoardVO;

@Service
public class TransferBoardService {

	@Autowired
	private TransferBoardDAO transferBoardDAO;
	@Autowired
	private TicketDAO ticketDAO;

	// ------------------- 양도게시판 등록
	public int insertTransferboard(TransferBoardVO vo) {
		System.out.println("insertTransferboard Service()");

		ticketDAO.updateTicket(vo.getTicketSq());		
		
		return transferBoardDAO.insertTransferboard(vo);
	}

}
