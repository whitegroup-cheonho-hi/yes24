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
import com.yes24.dao.ShowDAO;
import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.SeatClassListVO;
import com.yes24.vo.SeatClassVO;
import com.yes24.vo.SeatVO;
import com.yes24.vo.ShowSeatVO;
import com.yes24.vo.ShowVO;

@Service
public class ShowService {

	@Autowired
	private ShowDAO showDAO;
	@Autowired
	private ShowVO showVO;
	@Autowired
	private ConcertHallDAO concertHallDAO;
	@Autowired
	private List<SeatVO> seatVOList;
	@Autowired
	private List<ConcertHallVO> concertHallList;

	String saveDir = "C:/yes24/img/upload/";

	// ------------------ 공연등록
	public int insertShow(ShowVO vo, MultipartFile file1, MultipartFile file2) {
		System.out.println("insertShow Service()");

		int resulet = 0;

		fileCheck(vo, file1, file2);
		if (!file1.isEmpty() && !file2.isEmpty()) {

			resulet = showDAO.insertShow(vo);

		}

		return resulet;
	}

	// ------------------ 공연좌석클래스 등록
	public int insertSeatClass(List<SeatClassListVO> list) {
		System.out.println("insertSeatClass Service()");

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
			showDAO.insertSeatClass(s);
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

		return 0;
	}

	// ------------------ 공연수정 기존파일을 사용하고 싶을때 예외처리 아니면수정할때 파일을 디폴트로 넣어보자
	public int updateShow(ShowVO vo, MultipartFile file1, MultipartFile file2) {
		System.out.println("updateShow Service()");

		int resulet = 0;

		fileCheck(vo, file1, file2);
		if (!file1.isEmpty() && !file2.isEmpty()) {

			resulet = showDAO.updateShow(vo);

		}

		return resulet;
	}

	// ------------------ 공연좌석클래스 수정
	public int updateSeatClass(List<SeatClassListVO> list) {
		System.out.println("updateSeatClass Service()");

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

		return 0;
	}

	// ------------------ 공연정보가져오기 필요없는 값 보내지 않기 위해 파라미터를 추가 수정예정
	public Map<String, Object> getShow(int no) {
		System.out.println("getShow Service()");
		Map<String, Object> map = new HashMap<>();
		List<Integer> seatClassSqList = new ArrayList<>();
		List<String> seatClassList = new ArrayList<>();
		List<Integer> seatPriceSqList = new ArrayList<>();

		// 공연장 리스트
		concertHallList = concertHallDAO.getConcertHallList();

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

		map.put("showVO", showVO);
		map.put("concertHallVO", concertHallVO);
		map.put("concertHallList", concertHallList);
		map.put("seatClassList", SeatClassList);

		return map;

	}

	// ------------------ 공연리스트가져오기 상태값때문에 no가 필요
	public List<ShowVO> getShowList(int no) {
		System.out.println("getShowList Service()");

		return showDAO.getShowList(no);

	}

	// ------------- 파일체크 & 저장
	public void fileCheck(ShowVO vo, MultipartFile file1, MultipartFile file2) {

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
				// 파일이름 상품번호 map으로 만들어 보내기

				vo.setMainImage(saveName);
				vo.setSubImage(saveName2);

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
