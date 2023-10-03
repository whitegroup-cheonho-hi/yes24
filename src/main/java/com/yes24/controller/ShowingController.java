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

import com.yes24.service.ShowService;
import com.yes24.service.ShowingService;
import com.yes24.service.UserService;
import com.yes24.vo.JsonResult;
import com.yes24.vo.RemainingSeatsVO;
import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingVO;
import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/showing")
public class ShowingController {

	@Autowired
	private ShowingService showingService;
	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping(value = "/getShowing", method = RequestMethod.POST)
	public JsonResult getShowing(@ModelAttribute ShowingVO vo) {
	    System.out.println("getShowing()");

	    try {
	        List<ShowingVO> showingList = showingService.getShowing(vo);
	        System.out.println(vo);

	        JsonResult jsonResult = new JsonResult();
	        jsonResult.success(showingList);

	        return jsonResult;
	    } catch (Exception ex) {
	        // 예외가 발생하면 로깅하고 예외 메시지와 vo 정보를 함께 반환
	        ex.printStackTrace(); // 예외 정보를 로그에 출력
	        JsonResult errorResult = new JsonResult();
	        errorResult.fail("An error occurred: " + ex.getMessage()); // fail 메소드를 사용하여 실패 상태를 설정
	        errorResult.setData(vo); // setData 메소드를 사용하여 vo 객체의 정보를 응답에 추가

	        return errorResult;
	    }
	}
	// ---------------------- 잔여좌석 가져오기
	@ResponseBody
	@RequestMapping(value = "/remainingSeats", method = RequestMethod.POST)
	public JsonResult getRemainingSeats(@ModelAttribute ShowingVO vo) {
		System.out.println("getRemainingSeats()");

		List<RemainingSeatsVO> remainingSeatsList = showingService.getRemainingSeats(vo);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(remainingSeatsList);

		return jsonResult;

	}

	// ---------------------- 공연회차리시트 가져오기
	@ResponseBody
	@RequestMapping(value = "/getShowingList", method = RequestMethod.POST)
	public JsonResult getShowingList(@ModelAttribute ShowingVO vo) {
		System.out.println("getShowingList()");

		List<ShowingVO> showingList = showingService.getShowingList(vo);

		JsonResult jsonResult = new JsonResult();
		
		System.out.println("이거다"+showingList);

		jsonResult.success(showingList);

		return jsonResult;

	}

	// ---------------------- 공연좌석리시트 가져오기
	@ResponseBody
	@RequestMapping(value = "/getShowSeatList", method = RequestMethod.POST)
	public JsonResult getShowSeatList(@ModelAttribute ShowingVO vo) {
		System.out.println("getShowSeatList()");

		Map<String, Object> map = showingService.getShowSeats(vo);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(map);

		return jsonResult;

	}

	// 회차등록 폼
	@RequestMapping(value = "/showingInsertForm/{no}", method = RequestMethod.GET)
	public String showingInsertForm(@PathVariable("no") int no, Model model, HttpSession session) {
		System.out.println("showingInsertForm()");

		String Uri = "admin/showingInsertForm";
		Uri = loginCheck(Uri, session);

		ShowVO vo = showingService.getShow2(no);

		model.addAttribute("show", vo);

		return Uri;
	}

	// 회차수정 폼
	@RequestMapping(value = "/showingModifyForm/{no}", method = RequestMethod.GET)
	public String showingModifyForm(@PathVariable("no") int no, Model model, HttpSession session) {
		System.out.println("showingModifyForm()");

		String Uri = "admin/showingModifyForm";
		Uri = loginCheck(Uri, session);

		ShowVO vo = showingService.getShow2(no);

		model.addAttribute("show", vo);

		return Uri;
	}
	
	// 회차등록
	@ResponseBody
	@RequestMapping(value = "/insertShowing", method = RequestMethod.POST)
	public JsonResult insertShowing(@ModelAttribute ShowingVO vo) {
		System.out.println("insertShowing()");

		int cnt = showingService.insertShowing(vo);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(cnt);

		return jsonResult;
	}
	
	// 회차삭제
	@ResponseBody
	@RequestMapping(value = "/deleteShowing", method = RequestMethod.POST)
	public JsonResult deleteShowing(@RequestParam("showingSq") String showingSq) {
		System.out.println("insertShowing()");

		int cnt = showingService.deleteShowing(showingSq);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(cnt);

		return jsonResult;
	}
	
	// 회차날짜 가져오기
	@ResponseBody
	@RequestMapping(value = "/getShowingDay", method = RequestMethod.POST)
	public JsonResult getShowingDay(@RequestParam("showSq") int showSq) {
		System.out.println("getShowingDay()");

		List<String> dayList = showingService.getShowingDay(showSq);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(dayList);

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
