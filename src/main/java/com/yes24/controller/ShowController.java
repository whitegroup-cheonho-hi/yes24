package com.yes24.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.JsonResult;
import com.yes24.vo.SeatClassListVO;
import com.yes24.vo.SeatClassVO;
import com.yes24.vo.ShowVO;

@Controller
@RequestMapping("/show")
public class ShowController {

	@Autowired
	private ShowService showService;
	@Autowired
	private ConcertHallService concertHallService;
	List<ConcertHallVO> concertHallList = new ArrayList<>();

	// ------------------- 공연 등록폼
	@RequestMapping(value = "/showInsertForm", method = RequestMethod.GET)
	public String showInsertForm(Model model) {
		System.out.println("showInsertForm()");

		concertHallList = concertHallService.getConcertHallList();

		model.addAttribute("concertHallList", concertHallList);

		System.out.println(concertHallList);
		return "admin/showInsertForm";
	}

	// ------------------- 공연 등록
	@RequestMapping(value = "/insertShow", method = RequestMethod.POST)
	public String insertShow(@ModelAttribute ShowVO vo, @RequestParam("file1") MultipartFile file1,
			@RequestParam("file2") MultipartFile file2) {
		System.out.println("insertShow()");

		showService.insertShow(vo, file1, file2);

		int showSq = vo.getshowSq();

		return "redirect:/show/showSeatClassInsertForm/" + showSq;
	}

	// ------------------- 공연 수정폼
	@RequestMapping(value = "/showModifyForm/{no}", method = RequestMethod.GET)
	public String showModifyForm(@PathVariable("no") int no, Model model) {
		System.out.println("showModifyForm()");

		Map<String, Object> map = showService.getShow(no);

		model.addAttribute("show", map.get("showVO"));
		model.addAttribute("concertHallList", map.get("concertHallList"));

		return "admin/showModifyForm";
	}

	// ------------------- 공연 수정
	@RequestMapping(value = "/updateShow", method = RequestMethod.POST)
	public String updateShow(@ModelAttribute ShowVO vo, @RequestParam("file1") MultipartFile file1,
			@RequestParam("file2") MultipartFile file2) {
		System.out.println("updateShow()");
		int result = showService.updateShow(vo, file1, file2);

		return "";
	}

	// ------------------- 공연 좌석 클래스등록폼
	@RequestMapping(value = "/showSeatClassInsertForm/{no}", method = RequestMethod.GET)
	public String showSeatClassInsertForm(Model model, @PathVariable("no") int no) {
		System.out.println("showSeatClassInsertForm()");

		Map<String, Object> map = showService.getShow(no);

		model.addAttribute("show", map.get("showVO"));
		model.addAttribute("concertHall", map.get("concertHallVO"));

		return "admin/showSeatClassInsertForm";
	}
	
	// ------------------- 공연 좌석 클래스수정폼
		@RequestMapping(value = "/showSeatClassModifyForm/{no}", method = RequestMethod.GET)
		public String showSeatClassModifyForm(Model model, @PathVariable("no") int no) {
			System.out.println("showSeatClassModifyForm()");

			Map<String, Object> map = showService.getShow(no);
						
			model.addAttribute("show", map.get("showVO"));
			model.addAttribute("concertHall", map.get("concertHallVO"));			
			model.addAttribute("seatClassList", map.get("seatClassList"));
		
			System.out.println(map.get("seatClassList"));
			return "admin/showSeatClassModifyForm";
		}

	// ------------------- 공연 상세
	@RequestMapping(value = "/detail/{no}", method = RequestMethod.GET)
	public String detailForm(@PathVariable("no") int no, Model model) {
		System.out.println("detailForm()");

		Map<String, Object> map = showService.getShow(no);

		model.addAttribute("show", map.get("showVO"));
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

}
