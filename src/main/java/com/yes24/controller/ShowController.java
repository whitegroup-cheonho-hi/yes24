package com.yes24.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yes24.service.ConcertHallService;
import com.yes24.service.ShowService;
import com.yes24.service.UserService;
import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.Criteria;
import com.yes24.vo.JsonResult;
import com.yes24.vo.SeatClassListVO;
import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingVO;
import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/show")
public class ShowController {

	@Autowired
	private ShowService showService;
	@Autowired
	private ConcertHallService concertHallService;
	@Autowired
	private UserService userService;
	
	// ------------------- 공연 등록폼
	@RequestMapping(value = "/showInsertForm", method = RequestMethod.GET)
	public String showInsertForm(Model model, HttpSession session) {
		System.out.println("showInsertForm()");

		String Uri = "admin/showInsertForm";
		Uri = loginCheck(Uri, session);

		List<ConcertHallVO> concertHallList = concertHallService.getConcertHallList();

		model.addAttribute("concertHallList", concertHallList);

		return Uri;
	}

	// ------------------- 공연 등록
	@RequestMapping(value = "/insertShow", method = RequestMethod.POST)
	public String insertShow(@ModelAttribute ShowVO vo, @RequestParam("file") MultipartFile[] file) {
		System.out.println("insertShow()");

		showService.insertShow(vo, file);

		int showSq = vo.getShowSq();

		return "redirect:/show/showSeatClassInsertForm/" + showSq;
	}

	// ------------------- 공연 수정폼
	@RequestMapping(value = "/showModifyForm/{no}", method = RequestMethod.GET)
	public String showModifyForm(@PathVariable("no") int no, Model model, HttpSession session) {
		System.out.println("showModifyForm()");

		String Uri = "admin/showModifyForm";
		Uri = loginCheck(Uri, session);

		Map<String, Object> map = showService.getShow(no, 2);

		model.addAttribute("show", map.get("showVO"));
		model.addAttribute("concertHallList", map.get("concertHallList"));

		return Uri;
	}

	// ------------------- 공연 수정
	@RequestMapping(value = "/updateShow", method = RequestMethod.POST)
	public String updateShow(@ModelAttribute ShowVO vo, @RequestParam("file") MultipartFile[] file) {
		System.out.println("updateShow()");

		int result = showService.updateShow(vo, file);

		return "redirect:/show/showSeatClassModifyForm/" + vo.getShowSq();
	}

	// ------------------- 공연 좌석 클래스등록폼
	@RequestMapping(value = "/showSeatClassInsertForm/{no}", method = RequestMethod.GET)
	public String showSeatClassInsertForm(Model model, @PathVariable("no") int no, HttpSession session) {
		System.out.println("showSeatClassInsertForm()");

		String Uri = "admin/showSeatClassInsertForm";
		Uri = loginCheck(Uri, session);

		Map<String, Object> map = showService.getShow(no, 1);

		model.addAttribute("show", map.get("showVO"));
		model.addAttribute("concertHall", map.get("concertHallVO"));

		return Uri;
	}

	// ------------------- 공연 좌석 클래스수정폼
	@RequestMapping(value = "/showSeatClassModifyForm/{no}", method = RequestMethod.GET)
	public String showSeatClassModifyForm(Model model, @PathVariable("no") int no, HttpSession session) {
		System.out.println("showSeatClassModifyForm()");

		String Uri = "admin/showSeatClassModifyForm";
		Uri = loginCheck(Uri, session);

		Map<String, Object> map = showService.getShow(no, 3);

		model.addAttribute("show", map.get("showVO"));
		model.addAttribute("concertHall", map.get("concertHallVO"));
		model.addAttribute("seatClassList", map.get("seatClassList"));

		return Uri;
	}

	// ------------------- 공연 상세
	@RequestMapping(value = "/detail/{no}", method = RequestMethod.GET)
	public String detailForm(@PathVariable("no") int no, Model model, Criteria cri) {
		System.out.println("detailForm()");

		cri.setAmount(6);
		Map<String, Object> map = showService.getShow(no, cri);

		model.addAttribute("show", map.get("showVO"));
		model.addAttribute("pageMaker", map.get("pageMaker"));
		model.addAttribute("reviewList", map.get("reviewList"));
		model.addAttribute("concertHall", map.get("concertHallVO"));

		return "show/showDetail";
	}

	// ------------------- 공연 좌석클래스 등록
	@ResponseBody
	@RequestMapping(value = "/insertSeatClass", method = RequestMethod.POST)
	public JsonResult insertSeatClass(@RequestBody List<SeatClassListVO> list) {
		System.out.println("insertSeatClass()");

		int result = showService.insertSeatClass(list);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(result);

		return jsonResult;

	}

	// ------------------- 공연 좌석클래스 수정
	@ResponseBody
	@RequestMapping(value = "/updateSeatClass", method = RequestMethod.POST)
	public JsonResult updateSeatClass(@RequestBody List<SeatClassListVO> list) {
		System.out.println("updateSeatClass()");

		int result = showService.updateSeatClass(list);

		JsonResult jsonResult = new JsonResult();

		return jsonResult;

	}

	// 로그인 체크
	public String loginCheck(String Uri, HttpSession session) {
		
		UserVO userVO = (UserVO) session.getAttribute("authUser");

		if (userVO == null) {

			Uri = "redirect:/user/loginForm";
		} else {

			UserVO vo = userService.getUser(userVO);

			if (vo.getUserRole() == 1) {

				Uri = "redirect:/";
			}

		}
		return Uri;
	}

}
