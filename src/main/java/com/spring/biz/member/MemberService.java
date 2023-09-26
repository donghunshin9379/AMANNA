package com.spring.biz.member;

import java.util.List;

import com.spring.biz.member.MemberVO;
import com.spring.biz.rboard.RBoardVO;

public interface MemberService {
	//정권====================================================================================
	MemberVO updateTicket(MemberVO vo);
	MemberVO ticketMinus(MemberVO vo);
	MemberVO ticketPlus(MemberVO vo);
	void insertMember(MemberVO vo);
	void getMoney(int pay);
	
	
	MemberVO selectMemberTotal(MemberVO vo);
	List<MemberVO> getMemberListP(MemberVO vo);
	List<MemberVO> getMemberListM(MemberVO vo);
	List<MemberVO> getMemberListW(MemberVO vo);
	//명식====================================================================================
	void register(MemberVO vo);
	void register2(MemberVO vo);
	int idchk(String id);
	List<MemberVO> getMemberList(MemberVO vo);
	void updateMember(MemberVO vo);
	void updatePwd(MemberVO vo);
	void deleteMemeber(MemberVO vo);
	
	MemberVO login(MemberVO vo);
	int eamilchk(String email);
	//동훈====================================================================================
	MemberVO getMember(MemberVO vo);
	
	//종현=========================================
		List<MemberVO> getManTotPay(MemberVO vo);
		MemberVO getWomanTotPay(MemberVO vo);
		List<MemberVO> getSexCnt(MemberVO vo);
		MemberVO getId(MemberVO vo);
		
		// 재형==============
		MemberVO selectMMemberTotal(MemberVO vo);
		List<MemberVO> getMMemberList(MemberVO vo);
		MemberVO selectWMemberTotal(MemberVO vo);
		List<MemberVO> getWMemberList(MemberVO vo);

}
