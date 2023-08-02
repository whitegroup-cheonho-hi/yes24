package com.yes24.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yes24.dao.ConcertHallDAO;
import com.yes24.dao.ReviewDAO;
import com.yes24.dao.ShowDAO;
import com.yes24.dao.ShowingDAO;
import com.yes24.dto.PageMakerDTO;
import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.Criteria;
import com.yes24.vo.ReviewVO;
import com.yes24.vo.SaveTicketVO;
import com.yes24.vo.SeatClassListVO;
import com.yes24.vo.SeatClassVO;
import com.yes24.vo.SeatVO;
import com.yes24.vo.ShowSeatVO;
import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingVO;

@Service
public class ShowService {

	@Autowired
	private ShowDAO showDAO;
	@Autowired
	private ShowVO showVO;
	@Autowired
	private ConcertHallDAO concertHallDAO;
	@Autowired
	private ShowingDAO showingDAO;
	@Autowired
	private ReviewDAO reviewDAO;

	String saveDir = "C:/yes24/img/upload/";

	// ------------------ 공연등록
	public int insertShow(ShowVO vo, MultipartFile[] file) {
		System.out.println("insertShow Service()");

		int result = 0;

		if (!file[0].isEmpty() && !file[1].isEmpty() && !file[2].isEmpty()) {

			fileCheck(vo, file);

			result = showDAO.insertShow(vo);

		}

		return result;
	}

	// ------------------ 공연좌석클래스 등록
	public int insertSeatClass(List<SeatClassListVO> list) {
		System.out.println("insertSeatClass Service()");

		List<SeatVO> seatVOList = new ArrayList<>();
		// 공연장 시퀀스 번호로 등록된 좌석을 리스트로 받아온다
		seatVOList = concertHallDAO.getConcertHallSeatList(list.get(0).getConcertHallSq());

		// 카운트 사용 인덱스
		int index = 0;

		// 좌석 클래스 시퀀스값 저장 배열
		int[] seatClassSq = new int[list.size()];

		// 좌석의 총 개수를 담을 변수
		int total = 0;

		// 파라미터 list에서 반복문
		for (SeatClassListVO s : list) {
			// 좌석 클래스 등록
			int d = showDAO.insertSeatClass(s);
			System.out.println(d);
			// selectKey 값을 배열에 저장
			seatClassSq[index++] = s.getSeatClassSq();
			// 좌석리스트의 갯수를 구하는 식
			total += s.getSeatClassList().size();

		}

		// 좌석의 총 개수 만큼 좌석클래스 시퀀스 번호를 담기위한 배열
		int[] seatClassSqList = new int[total];

		// index 초기화
		index = 0;
		// seatClassSq 배열의 길이만큼 반복
		for (int i = 0; i < seatClassSq.length; i++) {
			// 좌석클래스의 사이즈를 구한다
			int seatClassSize = list.get(i).getSeatClassList().size();
			// 좌석클래스의 사이즈만큼 반복
			for (int j = 0; j < seatClassSize; j++) {
				// 각 좌석 클래스의 사이즈에 해당하는 시퀀스 번호를 좌석의 총 개수만큼 배치합니다.
				seatClassSqList[index++] = seatClassSq[i];
			}
		}

		// 좌석의 총 개수만큼 공연좌석으로 등록
		for (SeatVO seatVO : seatVOList) {
			// 반복으로 생성한 이유는 힙메모리에 값이 덮어씌워지기 때문!!
			ShowSeatVO showSeatVO = new ShowSeatVO();
			// 공연좌석 객체에 좌석 시퀀스 저장
			showSeatVO.setSeatSq(seatVO.getSeatSq());
			// 공연좌석 객체에 좌석클래스 시퀀스 저장
			showSeatVO.setSeatClassSq(seatClassSqList[seatVOList.indexOf(seatVO)]);
			// 공연좌석 등록
			showDAO.insertShowSeat(showSeatVO);
		}

		return index;
	}

	// ------------------ 공연수정
	public int updateShow(ShowVO vo, MultipartFile[] file) {
		System.out.println("updateShow Service()");

		int caseNumber = 0;

		if (!file[0].isEmpty()) caseNumber += 1; // 메인 이미지가 수정된 경우
		if (!file[1].isEmpty()) caseNumber += 2; // 서브 이미지가 수정된 경우
		if (!file[2].isEmpty()) caseNumber += 4; // 상세 이미지가 수정된 경우

		switch (caseNumber) {

		case 1: // 메인 이미지만 수정된 경우
			fileCheck(vo, file[0], 1);
			break;
		case 2: // 서브 이미지만 수정된 경우
			fileCheck(vo, file[1], 2);
			break;
		case 3: // 메인 이미지와 서브 이미지가 모두 수정된 경우
			fileCheck(vo, file[0], file[1], 1);
			break;
		case 4: // 상세 이미지만 수정된 경우
			fileCheck(vo, file[2], 3);
			break;
		case 5: // 메인 이미지와 상세 이미지가 모두 수정된 경우
			fileCheck(vo, file[0], file[2], 2);
			break;
		case 6: // 서브 이미지와 상세 이미지가 모두 수정된 경우
			fileCheck(vo, file[1], file[2], 3);
			break;
		case 7: // 모든 이미지가 수정된 경우
			fileCheck(vo, file);
			break;
		}

		return showDAO.updateShow(vo);
	}

	// ------------------ 공연좌석클래스 수정
	public int updateSeatClass(List<SeatClassListVO> list) {
		System.out.println("updateSeatClass Service()");

		List<SeatVO> seatVOList = new ArrayList<>();
		// 공연장 시퀀스 번호로 등록된 좌석을 리스트로 받아온다
		seatVOList = concertHallDAO.getConcertHallSeatList(list.get(0).getConcertHallSq());

		// 포이치문 사용 인덱스
		int index = 0;

		// 좌석 클래스 시퀀스값 저장 배열
		int[] seatClassSq = new int[list.size()];
		// 좌석의 총 개수를 담을 변수
		int total = 0;

		// 파라미터 list에서 반복문
		for (SeatClassListVO s : list) {

			// 좌석 클래스 수정
			showDAO.updateSeatClass(s);
			// 공연좌석 삭제
			showDAO.deleteShowSeat(s.getSeatClassSq());
			// 좌석클래스퀀스 값을 배열에 저장
			seatClassSq[index++] = s.getSeatClassSq();
			// 좌석리스트의 갯수를 구하는 식
			total += s.getSeatClassList().size();

		}

		// 좌석의 총 개수 만큼 좌석클래스 시퀀스 번호를 담기위한 배열
		int[] seatClassSqList = new int[total];

		// i & j 값을 사용하지 못하기에 index 변수선언
		index = 0;
		// seatClassSq 배열의 길이만큼 반복
		for (int i = 0; i < seatClassSq.length; i++) {
			// 좌석클래스의 사이즈를 구한다
			int seatClassSize = list.get(i).getSeatClassList().size();
			// 좌석클래스의 사이즈만큼 반복
			for (int j = 0; j < seatClassSize; j++) {
				// 각 좌석 클래스의 사이즈에 해당하는 시퀀스 번호를 좌석의 총 개수만큼 배치합니다.
				seatClassSqList[index++] = seatClassSq[i];
			}
		}

		// 좌석의 총 개수만큼 공연좌석으로 등록
		for (SeatVO seatVO : seatVOList) {
			// 반복으로 생성한 이유는 힙메모리에 값이 덮어씌워지기 때문!!
			ShowSeatVO showSeatVO = new ShowSeatVO();
			// 공연좌석 객체에 좌석 시퀀스 저장
			showSeatVO.setSeatSq(seatVO.getSeatSq());
			// 공연좌석 객체에 좌석클래스 시퀀스 저장
			showSeatVO.setSeatClassSq(seatClassSqList[seatVOList.indexOf(seatVO)]);
			// 공연좌석 등록
			showDAO.insertShowSeat(showSeatVO);
		}

		return index;
	}

	// ------------------ 공연정보가져오기 필요없는 값 보내지 않기 위해 파라미터를 추가 수정완료23/07/27
	public Map<String, Object> getShow(int no, int sortation) {
		System.out.println("getShow Service()");
		Map<String, Object> map = new HashMap<>();
		List<Integer> seatClassSqList = new ArrayList<>();
		List<String> seatClassList = new ArrayList<>();
		List<Integer> seatPriceSqList = new ArrayList<>();
		List<ConcertHallVO> concertHallList;

		// 공연정보
		showVO = showDAO.getShow(no);

		if (sortation == 1 || sortation == 3) {
			// 1.공연장정보
			ConcertHallVO concertHallVO = concertHallDAO.getConcertHall(showVO.getConcertHallSq());

			map.put("concertHallVO", concertHallVO);

		}
		if (sortation == 2) {
			// 2.공연장 리스트
			concertHallList = concertHallDAO.getConcertHallList();

			map.put("concertHallList", concertHallList);

		}
		if (sortation == 3) {
			// 3.좌석클레스
			List<SeatClassVO> SeatClassList = showDAO.getSeatClassList(no);
			for (SeatClassVO seatClassSq : SeatClassList) {
				seatClassSqList.add(seatClassSq.getSeatClassSq());
				seatClassList.add(seatClassSq.getSeatClass());
				seatPriceSqList.add(seatClassSq.getSeatPrice());
			}
			showVO.setSeatClassSq(seatClassSqList);
			showVO.setSeatClass(seatClassList);
			showVO.setSeatPrice(seatPriceSqList);

			map.put("seatClassList", SeatClassList);

			// 리뷰페이징

		}

		map.put("showVO", showVO);

		return map;

	}

	// -------------- 공연상세페이지 리뷰때문에 나눔
	public Map<String, Object> getShow(int no, Criteria cri) {
		System.out.println("getShow Service()");
		Map<String, Object> map = new HashMap<>();
		List<Integer> seatClassSqList = new ArrayList<>();
		List<String> seatClassList = new ArrayList<>();
		List<Integer> seatPriceSqList = new ArrayList<>();

		// 공연정보
		showVO = showDAO.getShow(no);

		// 공연장정보
		ConcertHallVO concertHallVO = concertHallDAO.getConcertHall(showVO.getConcertHallSq());

		// 좌석클레스
		List<SeatClassVO> SeatClassList = showDAO.getSeatClassList(no);
		for (SeatClassVO seatClassSq : SeatClassList) {
			seatClassSqList.add(seatClassSq.getSeatClassSq());
			seatClassList.add(seatClassSq.getSeatClass());
			seatPriceSqList.add(seatClassSq.getSeatPrice());
		}
		showVO.setSeatClassSq(seatClassSqList);
		showVO.setSeatClass(seatClassList);
		showVO.setSeatPrice(seatPriceSqList);

		// 키워드에 공연시퀀스 담기
		cri.setKeyword(no);
		// 리뷰페이징
		List<ReviewVO> reviewList = reviewDAO.getReviewList(cri);

		int total = reviewDAO.getTotal(no);

		// 페이지메이커
		PageMakerDTO pageMaker = new PageMakerDTO(total, cri);

		map.put("showVO", showVO);
		map.put("pageMaker", pageMaker);
		map.put("reviewList", reviewList);
		map.put("concertHallVO", concertHallVO);
		map.put("seatClassList", SeatClassList);

		return map;

	}

	// ------------------ 공연정보가져오기 필요없는 값 보내지 않기 위해 파라미터를 추가 수정예정
	public Map<String, Object> getShow(SaveTicketVO vo) {
		System.out.println("getShow Service()");
		Map<String, Object> map = new HashMap<>();

		// 공연정보
		showVO = showDAO.getShow(vo.getShowSq());

		ShowingVO showing = showingDAO.getShowing(vo.getShowingSq());

		map.put("showVO", showVO);
		map.put("showing", showing);

		return map;

	}

	// ------------------ 공연리스트가져오기 상태값때문에 no가 필요
	public Map<String, Object> getShowList(int no) {
		System.out.println("getShowList Service()");

		Map<String, Object> map = new HashMap<>();

		List<ShowVO> showList = showDAO.getShowList(no);
		List<ShowVO> getWhatsHot = showDAO.getWhatsHot();
		List<ShowVO> ticketingScheduled = showDAO.getTicketingScheduled();

		map.put("showList", showList);
		map.put("getWhatsHot", getWhatsHot);
		map.put("ticketingScheduled", ticketingScheduled);

		return map;

	}

	// ------------------ 공연리스트가져오기 상태값때문에 no가 필요
	public Map<String, Object> getShowList(Criteria cri) {
		System.out.println("getShowList Service()");

		Map<String, Object> map = new HashMap<>();

		int total = showDAO.getTotal(cri);
		// 롤링
		List<ShowVO> showList = showDAO.getShowList(cri.getKeyword());
		// 검색포함
		List<ShowVO> showList2 = showDAO.getShowList(cri);

		PageMakerDTO pageMaker = new PageMakerDTO(total, cri);

		map.put("showList", showList);
		map.put("showList2", showList2);
		map.put("pageMaker", pageMaker);

		return map;

	}

	// ------------- 파일체크 & 저장
	public void fileCheck(ShowVO vo, MultipartFile[] file) {

		if (!file[0].isEmpty() && !file[1].isEmpty() && !file[2].isEmpty()) {
			// 오리지널파일
			String orgName = file[0].getOriginalFilename();
			String orgName2 = file[1].getOriginalFilename();
			String orgName3 = file[2].getOriginalFilename();

			// 확장자
			String exName = orgName.substring(orgName.indexOf("."));
			String exName2 = orgName2.substring(orgName2.indexOf("."));
			String exName3 = orgName3.substring(orgName3.indexOf("."));

			// 저장파일 이름
			String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			String saveName2 = System.currentTimeMillis() + UUID.randomUUID().toString() + exName2;
			String saveName3 = System.currentTimeMillis() + UUID.randomUUID().toString() + exName3;

			// 파일패스
			String filePath = saveDir + saveName;
			String filePath2 = saveDir + saveName2;
			String filePath3 = saveDir + saveName3;

			try {
				file[0].transferTo(new File(filePath));
				file[1].transferTo(new File(filePath2));
				file[2].transferTo(new File(filePath3));

				vo.setMainImage(saveName);
				vo.setSubImage(saveName2);
				vo.setDetailedImage(saveName3);

			} catch (IOException e) {
				// 파일 처리 중 예외가 발생한 경우 예외 처리 로직을 추가합니다.
				System.out.println("Error occurred while uploading file.");
				e.printStackTrace();
			}
		} else {
			// 업로드된 파일이 없는 경우에 대한 처리를 수행합니다.
			System.out.println("No file uploaded.");
		}
	}

	// ------------- 파일체크 & 저장
	public void fileCheck(ShowVO vo, MultipartFile file1, MultipartFile file2, int no) {

		if (!file1.isEmpty() && !file2.isEmpty()) {
			// 오리지널파일
			String orgName = file1.getOriginalFilename();
			String orgName2 = file2.getOriginalFilename();

			// 확장자
			String exName = orgName.substring(orgName.indexOf("."));
			String exName2 = orgName2.substring(orgName2.indexOf("."));

			// 저장파일 이름
			String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			String saveName2 = System.currentTimeMillis() + UUID.randomUUID().toString() + exName2;

			// 파일패스
			String filePath = saveDir + saveName;
			String filePath2 = saveDir + saveName2;

			try {
				file1.transferTo(new File(filePath));
				file2.transferTo(new File(filePath2));

				if (no == 1) {

					vo.setMainImage(saveName);
					vo.setSubImage(saveName2);

				} else if (no == 2) {

					vo.setMainImage(saveName);
					vo.setDetailedImage(saveName2);

				} else if (no == 3) {

					vo.setSubImage(saveName);
					vo.setDetailedImage(saveName2);
				}

			} catch (IOException e) {
				// 파일 처리 중 예외가 발생한 경우 예외 처리 로직을 추가합니다.
				System.out.println("Error occurred while uploading file.");
				e.printStackTrace();
			}
		} else {
			// 업로드된 파일이 없는 경우에 대한 처리를 수행합니다.
			System.out.println("No file uploaded.");
		}
	}

	// 파일이 한개일경우 체크 오버로드!! 오버로드를 사용한 이유는 조건문이 늘어서 가독성이 떨어질거같았다.
	public void fileCheck(ShowVO vo, MultipartFile file, int no) {
		if (!file.isEmpty()) {
			// 오리지널 파일
			String orgName = file.getOriginalFilename();

			// 확장자
			String exName = orgName.substring(orgName.indexOf("."));

			// 저장 파일 이름
			String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;

			// 파일 패스
			String filePath = saveDir + saveName;

			try {
				file.transferTo(new File(filePath));

				if (no == 1) {

					vo.setMainImage(saveName);

				} else if (no == 2) {

					vo.setSubImage(saveName);

				} else if (no == 3) {

					vo.setDetailedImage(saveName);

				}
			} catch (IOException e) {
				// 파일 처리 중 예외가 발생한 경우 예외 처리 로직을 추가합니다.
				System.out.println("Error occurred while uploading file.");
				e.printStackTrace();
			}
		} else {
			// 업로드된 파일이 없는 경우에 대한 처리를 수행합니다.
			System.out.println("No file uploaded.");
		}
	}

}
