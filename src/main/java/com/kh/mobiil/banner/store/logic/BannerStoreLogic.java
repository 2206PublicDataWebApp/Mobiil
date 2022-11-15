package com.kh.mobiil.banner.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.banner.domain.Banner;
import com.kh.mobiil.banner.store.BannerStore;

@Repository
public class BannerStoreLogic implements BannerStore{

	@Override
	public int insertBanner(SqlSessionTemplate session, Banner banner) {
		int result = session.insert("bannerMapper.insertBanner", banner);
		return result;
	}

	@Override
	public int renewBanner(SqlSessionTemplate session, Banner banner) {
		int result = session.update("bannerMapper.deleteBanner", banner);
		return result;
	}

	@Override
	public int updateContents(SqlSessionTemplate session, Banner banner) {
		int result = session.update("bannerMapper.updateContents", banner);
		return result;
	}

	@Override
	public int updateImage(SqlSessionTemplate session, Banner banner) {
		int result = session.update("bannerMapper.updateImage", banner);
		return result;
	}

	@Override
	public List<Banner> selectAllBanner(SqlSessionTemplate session) {
		List<Banner> bList = session.selectList("bannerMapper.selectAllBanner");
		return bList;
	}

	@Override
	public Banner selectOneBanner(SqlSessionTemplate session, int i) {
		Banner oneBanner = session.selectOne("bannerMapper.selectOneBanner", i);
		return oneBanner;
	}

	@Override
	public int chkBanner(SqlSessionTemplate session, int bannerNo) {
		int result = session.selectOne("bannerMapper.countBanner", bannerNo);
		return result;
	}
}
