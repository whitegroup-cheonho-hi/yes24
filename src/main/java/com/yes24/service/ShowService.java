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
	Map<String, Object> seatClass = new HashMap<>();
	List<ConcertHallVO> concertHallList = new ArrayList<>();
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
		
		List<SeatVO> seatVOList = new ArrayList<>();
		
		//공연장 시퀀스 번호로 등록된 좌석을 리스트로 받아온다
		seatVOList = concertHallDAO.getConcertHallSeatList(list.get(0).getConcertHallSq());
		
		// 포이치문 사용 인덱스
		int index = 0;
	
		// 좌석 클래스 시퀀스값 저장 배열
		int[] seatClassSq = new int[list.size()];
		//좌석의 총 개수를 담을 변수
		int total = 0;

		//파라미터 list에서 반복문
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
		
		// i & j 값을 사용하지 못하기에 index  변수선언
		int index2 = 0;
		// seatClassSq 배열의 길이만큼 반복
		for (int i = 0; i < seatClassSq.length; i++) {
			// 좌석클래스의 사이즈를 구한다
			int seatClassSize = list.get(i).getSeatClassList().size();
			// 좌석클래스의 사이즈만큼 반복
			for (int j = 0; j < seatClassSize; j++) {
				// 각 좌석 클래스의 사이즈에 해당하는 시퀀스 번호를 좌석의 총 개수만큼 배치합니다.
				seatClassSqList[index2++] = seatClassSq[i];
			}
		}
		// 좌석의 총 개수만큼 공연좌석으로 등록
		for (int i = 0; i < seatVOList.size(); i++) {
			// 반복으로 생성한 이유는 힙메모리에 값이 덮어씌워지기 때문!!
			ShowSeatVO showSeatVO = new ShowSeatVO();
			// 공연좌석 객체에 좌석 시퀀스 저장
			showSeatVO.setSeatSq(seatVOList.get(i).getSeatSq());
			// 공연좌석 객체에 좌석클래스 시퀀스 저장
			showSeatVO.setSeatClassSq(seatClassSqList[i]);
			// 공연좌석 등록
			showDAO.insertShowSeat(showSeatVO);
		}

		return 0;
	}

	// ------------------ 공연수정
	public int updateShow(ShowVO vo, MultipartFile file1, MultipartFile file2) {
		System.out.println("updateShow Service()");

		int resulet = 0;

		fileCheck(vo, file1, file2);
		if (!file1.isEmpty() && !file2.isEmpty()) {

			resulet = showDAO.updateShow(vo);

//			// 좌석클래스 수정
//			for (int i = 0; i < vo.getSeatClass().size(); i++) {
//
//				seatClass.put("seatClass", vo.getSeatClass().get(i));
//				seatClass.put("seatPrice", vo.getSeatPrice().get(i));
//				seatClass.put("seatClassSq", vo.getSeatClassSq().get(i));
//
//				showDAO.updateSeatClass(seatClass);
//
//			}
		}

		return resulet;
	}

	// ------------------ 공연정보가져오기
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
