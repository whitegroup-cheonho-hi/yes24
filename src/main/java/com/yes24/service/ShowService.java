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

import com.yes24.dao.ShowDAO;
import com.yes24.vo.SeatClassVO;
import com.yes24.vo.ShowVO;

@Service
public class ShowService {

	@Autowired
	private ShowDAO showDAO;
	@Autowired
	private ShowVO showVO;

	String saveDir = "C:/yes24/img/upload/";

	// ------------------ 공연등록
	public int insertShow(ShowVO vo, MultipartFile file1, MultipartFile file2) {
		System.out.println("insertShow Service()");
		int resulet = 0;
		Map<String, Object> seatClass = new HashMap<>();
		fileCheck(vo, file1, file2);
		if (!file1.isEmpty() && !file2.isEmpty()) {

			resulet = showDAO.insertShow(vo);

			// 좌석클래스 저장
			for (int i = 0; i < vo.getSeatClass().size(); i++) {

				seatClass.put("seatClass", vo.getSeatClass().get(i));
				seatClass.put("seatPrice", vo.getSeatPrice().get(i));
				seatClass.put("showSq", vo.getshowSq());

				showDAO.insertSeatClass(seatClass);

			}
		}

		return resulet;
	}

	// ------------------ 공연등록
	public int updateShow(ShowVO vo, MultipartFile file1, MultipartFile file2) {
		System.out.println("updateShow Service()");
	
		int resulet = 0;
		Map<String, Object> seatClass = new HashMap<>();
		fileCheck(vo, file1, file2);
		if (!file1.isEmpty() && !file2.isEmpty()) {

			resulet = showDAO.updateShow(vo);

				// 좌석클래스 저장
				for (int i = 0; i < vo.getSeatClass().size(); i++) {

					seatClass.put("seatClass", vo.getSeatClass().get(i));
					seatClass.put("seatPrice", vo.getSeatPrice().get(i));
					seatClass.put("seatClassSq", vo.getSeatClassSq().get(i));

					showDAO.updateSeatClass(seatClass);

				}
		}

		return resulet;
	}

	// ------------------ 공연정보가져오기
	public ShowVO getShow(int no) {
		System.out.println("getShow Service()");
		List<Integer> seatClassSqList = new ArrayList<>();
		List<String> seatClassList = new ArrayList<>();
		List<Integer> seatPriceSqList = new ArrayList<>();

		// 공연정보
		showVO = showDAO.getShow(no);

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

		return showVO;

	}

	// ------------------ 공연리스트가져오기
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
