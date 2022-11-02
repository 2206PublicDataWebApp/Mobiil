package com.kh.mobiil.banner.service.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.banner.domain.Banner;
import com.kh.mobiil.banner.service.BannerService;
import com.kh.mobiil.banner.store.BannerStore;

@Service
public class BannerServiceImpl implements BannerService{
	
	@Autowired
	private BannerStore bStore;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Banner> printAllBanner() {
		List<Banner> bList = bStore.selectAllBanner(session);
		return bList;
	}

	@Override
	public int chkBanner(int bannerNo) {
		int result = bStore.chkBanner(session, bannerNo);
		return result;
	}

	@Override
	public int renewBanner(Banner banner) {
		int result = bStore.renewBanner(session, banner);
		return result;
	}

	@Override
	public int registerBanner(Banner banner) {
		int result = bStore.insertBanner(session, banner);
		return result;
	}

	@Override
	public Banner printOneBanenr(int i) {
		Banner oneBanner = bStore.selectOneBanner(session, i);
		return oneBanner;
	}

	@Override
	public int updateContents(Banner banner) {
		int result = bStore.updateContents(session, banner);
		return result;
	}

	@Override
	public int updateImage(Banner banner) {
		int result = bStore.updateImage(session, banner);
		return result;
	}


	
	

}
