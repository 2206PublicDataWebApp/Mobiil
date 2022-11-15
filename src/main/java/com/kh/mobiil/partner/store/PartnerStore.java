package com.kh.mobiil.partner.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mobiil.partner.domain.Partner;
import com.kh.mobiil.partner.domain.SearchPartner;

public interface PartnerStore {

	public int insertPartner(Partner partner, SqlSessionTemplate session);

	public int updatePartnerImage(Partner partner, SqlSessionTemplate session);

	public int updatePartnerContents(Partner partner, SqlSessionTemplate session);

	public int updateApproval(int partnerNo, SqlSessionTemplate session);

	public int updateRejectMail(int partnerNo, SqlSessionTemplate session);

	public int deletePartnerInfo(int partnerNo, SqlSessionTemplate session);

	public Partner selectOnePartner(String memberEmail, SqlSessionTemplate session);

	public Partner selectOnePartnerByMemberNick(String memberNick, SqlSessionTemplate session);

	public Partner selectOnePartnerByNo(int partnerNo, SqlSessionTemplate session);

	public int selectTotalCount(SearchPartner sp, SqlSessionTemplate session);

	public List<Partner> selectPartnerList(SearchPartner sp, RowBounds rowBounds, SqlSessionTemplate session);

	public int selectApprovedPartnerCount(SqlSessionTemplate session);

	public int selectNotApprovedPartnerCount(SqlSessionTemplate session);

}
