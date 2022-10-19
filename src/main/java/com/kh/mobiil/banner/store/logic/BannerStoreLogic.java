package com.kh.mobiil.banner.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.banner.domain.Banner;
import com.kh.mobiil.banner.store.BannerStore;

@Repository
public class BannerStoreLogic implements BannerStore{

	@Override
	public List<Banner> selectAllBanner(SqlSessionTemplate session) {
		List<Banner> bList = session.selectList("bannerMapper.selectAllBanner");
		return bList;
	}

	@Override
	public int chkBanner(SqlSessionTemplate session, int bannerNo) {
		int result = session.selectOne("bannerMapper.countBanner", bannerNo);
		return result;
	}

	@Override
	public int updateBanner(SqlSessionTemplate session, Banner banner) {
		int result = session.update("bannerMapper.updateBanner", banner);
		return result;
	}

	@Override
	public int insertBanner(SqlSessionTemplate session, Banner banner) {
		int result = session.insert("bannerMapper.insertBanner", banner);
		return result;
	}

	@Override
	public Banner selectOneBanner(SqlSessionTemplate session, int i) {
		Banner oneBanner = session.selectOne("bannerMapper.selectOneBanner", i);
		return oneBanner;
	}

}
