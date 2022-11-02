package com.kh.mobiil.banner.service;

import java.util.List;

import com.kh.mobiil.banner.domain.Banner;

public interface BannerService  {

	//배너 리스트 출력
	public List<Banner> printAllBanner();

	//기존 배너 유무 체크
	public int chkBanner(int bannerNo);

	// 기존 배너 있으면 업데이트
	public int renewBanner(Banner banner);

	// 기존 배너 없으면 인서트
	public int registerBanner(Banner banner);

	// 실제하는 배너만 출력하도록 하나씩 부름
	public Banner printOneBanenr(int i);

	// 배너 내용 업데이트
	public int updateContents(Banner banner);

	//배너 이미지 업데이트
	public int updateImage(Banner banner);
	

}
