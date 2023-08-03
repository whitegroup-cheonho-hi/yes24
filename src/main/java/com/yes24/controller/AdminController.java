package com.yes24.controller;

import java.util.ArrayList;
import java.util.HashMap;
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

import com.yes24.service.AdminService;
import com.yes24.service.UserService;
import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.Criteria;
import com.yes24.vo.JsonResult;
import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingVO;
import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminservice;
	@Autowired
	private UserService userService;

	List<ConcertHallVO> concertHallList = new ArrayList<>();

	// 어드민 공연리스트(예매전)
	@RequestMapping(value = "/adminShowList", method = RequestMethod.GET)
	public String adminShowList(Model modle, Criteria cri, HttpSession session) {

		String Uri = "admin/showList";
		Uri = loginCheck(Uri, session);

		cri.setShowStat(1);
		Map<String, Object> map = adminservice.getShowList(cri);

		modle.addAttribute("showList", map.get("list"));
		modle.addAttribute("pageMake", map.get("pageMake"));

		return Uri;
	}

	// 어드민 공연리스트(예매중)
	@RequestMapping(value = "/ticketingShowList", method = RequestMethod.GET)
	public String ticketingShowList(Model modle, Criteria cri, HttpSession session) {

		String Uri = "admin/showTicketingList";
		Uri = loginCheck(Uri, session);

		cri.setShowStat(2);
		Map<String, Object> map = adminservice.getShowList(cri);

		modle.addAttribute("showList", map.get("list"));
		modle.addAttribute("pageMake", map.get("pageMake"));

		return Uri;
	}

	// 어드민 공연리스트(공연완료)
	@RequestMapping(value = "/showEndList", method = RequestMethod.GET)
	public String showEndList(Model model, Criteria cri, HttpSession session) {

		String Uri = "admin/showEndList";
		Uri = loginCheck(Uri, session);

		cri.setShowStat(3);
		Map<String, Object> map = adminservice.getShowList(cri);

		model.addAttribute("showList", map.get("list"));
		model.addAttribute("pageMake", map.get("pageMake"));

		return Uri;
	}

	// 공연장홀 리스트
	@RequestMapping(value = "/getConcertHallList", method = RequestMethod.GET)
	public String getConcertHallList(Model model, Criteria cri, HttpSession session) {

		String Uri = "admin/concertHallList";
		Uri = loginCheck(Uri, session);

		Map<String, Object> map = adminservice.getConcertHallList(cri);

		model.addAttribute("hallList", map.get("hallList"));
		model.addAttribute("pageMake", map.get("pageMake"));

		return Uri;
	}

	// 양도리스트
	@RequestMapping(value = "/getTransferList/{key}", method = RequestMethod.GET)
	public String getTransferList(@PathVariable("key") String key, Model model, Criteria cri, HttpSession session) {
		System.out.println("getTransferList()");
		
		String Uri = "admin/transferList";
		Uri = loginCheck(Uri, session);

		cri.setKeyword2(key);
		Map<String, Object> map = adminservice.getTransferList(cri);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageMake", map.get("pageMake"));
		model.addAttribute("key", key);
		
		return Uri;
	}

	// 회원별 예매리시트
	@RequestMapping(value = "/getUserTicketingList", method = RequestMethod.GET)
	public String getUserTicketingList(Model model, Criteria cri, HttpSession session) {
		System.out.println("getUserTicketingList");

		String Uri = "admin/userTicketingList";
		Uri = loginCheck(Uri, session);

		Map<String, Object> map = adminservice.getUserTicketingList(cri);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageMake", map.get("pageMake"));

		return Uri;
	}

	// 예매현황 리스트
	@RequestMapping(value = "/getTicketingList", method = RequestMethod.GET)
	public String getTicketingList(Model model, Criteria cri, HttpSession session) {

		String Uri = "admin/ticketingList";
		Uri = loginCheck(Uri, session);

		cri.setShowStat(0);
		Map<String, Object> map = adminservice.getShowList(cri);

		model.addAttribute("showList", map.get("list"));
		model.addAttribute("pageMake", map.get("pageMake"));

		return Uri;
	}

	// 예매현황 페이지
	@RequestMapping(value = "/ticketingDetail/{no}", method = RequestMethod.GET)
	public String getTicketingDetail(@PathVariable("no") int no, Model model, HttpSession session) {

		String Uri = "admin/ticketingDetail";
		Uri = loginCheck(Uri, session);

		Map<String, Object> map = adminservice.getTicketingDetailHallName(no);

		model.addAttribute("show", map.get("show"));
		model.addAttribute("hallName", map.get("hallName"));

		return Uri;
	}

	// 회차등록 폼
	@RequestMapping(value = "/showingInsertForm/{no}", method = RequestMethod.GET)
	public String showingInsertForm(@PathVariable("no") int no, Model model, HttpSession session) {

		String Uri = "admin/showingInsertForm";
		Uri = loginCheck(Uri, session);

		ShowVO vo = adminservice.getShow(no);
		model.addAttribute("show", vo);

		return Uri;
	}

	// 회차리스트
	@ResponseBody
	@RequestMapping(value = "/getShowing", method = RequestMethod.POST)
	public JsonResult getShowing(@ModelAttribute ShowingVO vo) {
		// System.out.println(vo);
		List<ShowingVO> showingList = adminservice.getShowing(vo);
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(showingList);
		System.out.println("getShowing()");
		System.out.println(showingList);
		return jsonResult;
	}

	// 회차추가
	@ResponseBody
	@RequestMapping(value = "/InsertShowing", method = RequestMethod.POST)
	public JsonResult InsertShowing(@ModelAttribute ShowingVO vo) {
		System.out.println("InsertShowing()");
		// System.out.println(vo);
		// List<ShowingVO> showingList = testservice.getShowing(vo);
		int cnt = adminservice.InsertShowing(vo);
		JsonResult jsonResult = new JsonResult();
		System.out.println(cnt);
		jsonResult.success(cnt);
		return jsonResult;
	}

	// 회차삭제
	@ResponseBody
	@RequestMapping(value = "/DeleteShowing", method = RequestMethod.POST)
	public JsonResult DeleteShowing(@RequestParam("showingSq") String showingSq) {
		System.out.println("DeleteShowing()");
		int cnt = adminservice.DeleteShowing(showingSq);
		JsonResult jsonResult = new JsonResult();
		System.out.println(cnt);
		jsonResult.success(cnt);
		return jsonResult;
	}

	// 한달스케쥴(백그라운드)
	@ResponseBody
	@RequestMapping(value = "/getShowingDay", method = RequestMethod.POST)
	public JsonResult getShowingDay(@RequestParam("showSq") int showSq) {
		System.out.println("getShowingDay()");
		List<String> dayList = adminservice.getShowingDay(showSq);
		JsonResult jsonResult = new JsonResult();
		System.out.println(dayList);
		jsonResult.success(dayList);
		return jsonResult;
	}

	// 예매시작 상태변경
	@ResponseBody
	@RequestMapping(value = "/showUpdateStat", method = RequestMethod.POST)
	public JsonResult showUpdateStat(@ModelAttribute ShowVO vo) {
		System.out.println("showUpdateStat");
		JsonResult jsonResult = new JsonResult();
		int cnt = adminservice.showUpdateStat(vo);
		jsonResult.success(cnt);
		return jsonResult;
	}
	
	// 권환 없음
	@RequestMapping(value = "/noRing", method = RequestMethod.GET)
	public String noRing() {
		System.out.println("noRing()");
				
		return "admin/noRing";
	} 

	// 회차종료
	@ResponseBody
	@RequestMapping(value = "/endShowing", method = RequestMethod.GET)
	public JsonResult endShowing() {
		System.out.println("endShowing");

		JsonResult jsonResult = new JsonResult();

		int cnt = adminservice.endShowing();

		jsonResult.success(cnt);

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
