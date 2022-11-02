package com.kh.mobiil.banner.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mobiil.banner.domain.Banner;

public interface BannerStore  {

 	public	List<Banner> selectAllBanner(SqlSessionTemplate session);

	public int chkBanner(SqlSessionTemplate session, int bannerNo);

	public int renewBanner(SqlSessionTemplate session, Banner banner);

	public int insertBanner(SqlSessionTemplate session, Banner banner);

	public Banner selectOneBanner(SqlSessionTemplate session, int i);

	public int updateContents(SqlSessionTemplate session, Banner banner);

	public int updateImage(SqlSessionTemplate session, Banner banner);


}
