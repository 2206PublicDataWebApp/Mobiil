//package com.kh.mobiil.host.service;
//
//import java.util.List;
//
//import com.kh.mobiil.host.domain.Host;
//import com.kh.mobiil.space.domain.Space;
//import com.kh.mobiil.space.domain.SpaceImg;
//
//import regervation.Reservation;
//
//
//public interface HostService {
//
//	Host getHostInfo(String hostEmail);
//	
//	int hostModify(Host host);
//
//	int getRegervationTotalCount();
//
//	List<Reservation> regervationList(int currentPage, int imit);
//	
//	int insertSpace(Space space);
//
//	int insertSpaceImg(SpaceImg spaceImg);
//
//	int getSpaceTotalCount();
//
//	List<Space> spaceList(int currentPage, int boardLimit);
//
//	Space spaceByNo(Integer spaceNo);
//
//	List<SpaceImg> spaceImgByNo(Integer spaceNo);
//
//	int spaceModify(Space space);
//
//	int spaceImgModify(SpaceImg spaceImg);
//
//	int spaceRemove(Integer spaceNo);
//}
