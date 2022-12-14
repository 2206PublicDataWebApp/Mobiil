package com.kh.mobiil.partner.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.partner.domain.Partner;
import com.kh.mobiil.partner.domain.SearchPartner;
import com.kh.mobiil.partner.store.PartnerStore;

@Repository
public class PartnerStoreLogic implements PartnerStore{

	@Override
	public int insertPartner(Partner partner, SqlSessionTemplate session) {
		int result = session.insert("partnerMapper.insertPartner", partner);
		return result;
	}

	@Override
	public int updatePartnerContents(Partner partner, SqlSessionTemplate session) {
		int result = session.update("partnerMapper.updatePartnerContents", partner);
		return result;
	}

	@Override
	public int updatePartnerImage(Partner partner, SqlSessionTemplate session) {
		int result = session.update("partnerMapper.updatePartnerImage", partner);
		return result;
	}

	@Override
	public int updateApproval(int partnerNo, SqlSessionTemplate session) {
		int result = session.update("partnerMapper.updateApproval", partnerNo);
		return result;
	}

	@Override
	public int updateRejectMail(int partnerNo, SqlSessionTemplate session) {
		int result = session.update("partnerMapper.updateRejectMail", partnerNo);
		return result;
	}

	@Override
	public int deletePartnerInfo(int partnerNo, SqlSessionTemplate session) {
		int result = session.delete("partnerMapper.deletePartnerInfo", partnerNo);
		return result;
	}

	@Override
	public Partner selectOnePartner(String memberEmail, SqlSessionTemplate session) {
		Partner pOne = session.selectOne("partnerMapper.selectOnePartner", memberEmail);
		return pOne;
	}

	@Override
	public Partner selectOnePartnerByMemberNick(String memberNick, SqlSessionTemplate session) {
		Partner pOne = session.selectOne("partnerMapper.selectOneByMemberNick", memberNick);
		return pOne;
	}

	@Override
	public Partner selectOnePartnerByNo(int partnerNo, SqlSessionTemplate session) {
		Partner partner = session.selectOne("partnerMapper.selectOneByNo", partnerNo);
		return partner;
	}

	@Override
	public List<Partner> selectPartnerList(SearchPartner sp, RowBounds rowBounds, SqlSessionTemplate session) {
		List<Partner> pList = session.selectList("partnerMapper.selectPartnerList", sp, rowBounds);
		return pList;
	}

	@Override
	public int selectTotalCount(SearchPartner sp, SqlSessionTemplate session) {
		int result = session.selectOne("partnerMapper.selectTotalCount", sp);
		return result;
	}

	@Override
	public int selectApprovedPartnerCount(SqlSessionTemplate session) {
		int result = session.selectOne("partnerMapper.selectApprovedPartnerCount");
		return result;
	}

	@Override
	public int selectNotApprovedPartnerCount(SqlSessionTemplate session) {
		int result = session.selectOne("partnerMapper.selectNotApprovedPartnerCount");
		return result;
	}

}
