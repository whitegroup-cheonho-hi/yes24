package com.yes24.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yes24.service.TransferBoardService;
import com.yes24.vo.JsonResult;
import com.yes24.vo.MyTicketingVO;
import com.yes24.vo.SeatClassVO;
import com.yes24.vo.TransferBoardVO;
import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/transferTicket")
public class TransferTicketControll {

	@Autowired
	private TransferBoardService transferBoardService;

	// ---------------- 티켓 양도 등록
	@ResponseBody
	@RequestMapping(value = "/insertTransferTicket", method = RequestMethod.POST)
	public JsonResult insertTransferTicket(@ModelAttribute TransferBoardVO vo, HttpSession session) {
		System.out.println("insertTransferTicket()");

		UserVO userVO = (UserVO) session.getAttribute("authUser");

		vo.setSellUserSq(userVO.getUserSq());

		int result = transferBoardService.insertTransferboard(vo);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(result);

		return jsonResult;

	}

	// --------------- 티켓 양도 취소
	@ResponseBody
	@RequestMapping(value = "/cancelTransferTicket", method = RequestMethod.POST)
	public JsonResult cancelTransferTicket(@ModelAttribute MyTicketingVO vo) {
		System.out.println("cancelTransferTicket()");

		int result = transferBoardService.deleteTransferboard(vo);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(result);

		return jsonResult;

	}

	// ----------------- 양도게시글 상세페이지
	@RequestMapping(value = "/transferTicketDetail/{no}", method = RequestMethod.GET)
	public String transferTicketDetail(@PathVariable("no") int no, Model model) {
		System.out.println("transferTicketDetail()");

		Map<String, Object> map = transferBoardService.getTransferboard(no);

		model.addAttribute("transferBoard", map.get("transferBoardVO"));
		model.addAttribute("show", map.get("showVO"));
		model.addAttribute("concertHall", map.get("concertHallVO"));	

		return "/show/showDetail2";

	}

	// ------------------ 좌석그리기
	@ResponseBody
	@RequestMapping(value = "/drawingSeat", method = RequestMethod.POST)
	public JsonResult drawingSeat(@RequestParam("showSq")int no) {
		System.out.println("drawingSeat()");
			
		List<SeatClassVO> seatClassList = transferBoardService.drawingSeat(no);
		
		JsonResult jsonResult = new JsonResult();
		
		jsonResult.success(seatClassList);

		return jsonResult;
	}
}
