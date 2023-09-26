package com.spring.biz.member.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.member.MemberVO;
import com.spring.biz.rboard.RBoardVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
// 동훈==============================================================================
	// 유저 1명 상세보기
	public MemberVO getMember(MemberVO vo) {
		System.out.println("===> MyBatis 사용 getMember() 실행");
		mybatis.selectOne("memberDAO.getMember", vo);
		
		return mybatis.selectOne("memberDAO.getMember", vo);
	}

	// 유저 목록 LIST
	public List<MemberVO> getMemberList() {
		System.out.println("===> MyBatis 사용 getMemberList() 실행");
		List<MemberVO> list = null;
		list = mybatis.selectList("getMemberList");
		return list;
	}
	
	public List<MemberVO> getMemberListP(MemberVO vo){
 		System.out.println("getMemberListP() 실행");
 		List<MemberVO> list = mybatis.selectList("memberDAO.getMemberListP", vo);
 		return list;
 	}
	
	public MemberVO selectMemberTotal(MemberVO vo) {
 		return mybatis.selectOne("memberDAO.selectMemberList", vo);
 	}
	// 종현===================================================================================
		
		
				public List<MemberVO> sexMemberList() {
					System.out.println("===> MyBatis 사용 sexMberList() 실행");
					List<MemberVO> list = null;
					list = mybatis.selectList("sexMemberList");
					return list;
				}
				
				// 유저 검색
				public List<MemberVO> getMemberList(MemberVO vo) {
					System.out.println("===> MyBatis 사용 getMemberList(admin) 실행");
					List<MemberVO> list = null;
					if (vo.getSearchCondition() == null) {
						vo.setSearchCondition("ID");
					}
					if (vo.getSearchCondition() == null) {
						vo.setSearchKeyword("");
					}
					
					if ("ID".equals(vo.getSearchCondition())) {
						list = mybatis.selectList("memberDAO.getMemberList_I", vo.getSearchKeyword());
					} else {
						list = mybatis.selectList("memberDAO.getMemberList_S", vo.getSearchKeyword());
					}
					
					return list;
				}	
			
				// 남자 매출 합계
				public List<MemberVO> getManTotPay(MemberVO vo) {
					System.out.println("===> MyBatis 사용 getManTotPay() 실행");
					List<MemberVO> list = null;
					List<MemberVO> list1 = null;
					list = mybatis.selectList("getManTotPay", vo);
					return list;
					
					
				}
				
				// 여자 매출 합계
				public MemberVO getWomanTotPay(MemberVO vo ) {
					System.out.println("===> MyBatis 사용 getWomanTotPay() 실행");
					mybatis.selectOne("memberDAO.getWomanTotPay", vo);
					return mybatis.selectOne("memberDAO.getWomanTotPay", vo);
					
				}
				
				// 남/녀 회원수
				public List<MemberVO> getSexCnt(MemberVO vo) {
					System.out.println("===> MyBatis 사용 getSexCnt() 실행");
					List<MemberVO> list = null;
					list = mybatis.selectList("getSexCnt", vo);
					return list;
				}
				

				// 아이디 찾기
				public MemberVO getId(MemberVO vo) {
					System.out.println("===> MyBatis 사용 getId() 실행");
					mybatis.selectOne("memberDAO.getId", vo);
					return mybatis.selectOne("memberDAO.getId", vo);
				}
	
// 명식==============================================================================
	public MemberDAO() {
		System.out.println(">> MemberDAO() 객체 생성");
	}
	
	//회원가입
		public void register(MemberVO vo) {
			System.out.println("===> MyBatis 사용 insertBoard() 실행");
			mybatis.insert("memberDAO.register", vo);
			
		}
	//회원가입2
		public void register2(MemberVO vo) {
			mybatis.update("memberDAO.register2", vo);
		}
		
	//id 중복체크
		public int idchk(String id) {
			int rs =  mybatis.selectOne("memberDAO.checkId", id);
			return rs;
		}
	
		//email 중복체크
				public int eamilchk(String email) {
					int rs =  mybatis.selectOne("memberDAO.chkEmail", email);
					return rs;
				}
				
				
				public MemberVO login(MemberVO vo) {
					System.out.println("===> MyBatis 사용 getMember() 실행");
					mybatis.selectOne("memberDAO.login", vo);
					
					return mybatis.selectOne("memberDAO.login", vo);
				}

	//글 정보 수정(회원정보 수정)	
	public void updateMember (MemberVO vo) {
		System.out.println("===> MyBatis 사용 updateMember() 실행");
		
		mybatis.update("memberDAO.updateMember", vo);		
		
	}
	
	//회원 비밀번호 수정 (회원정보 수정): 로그인 후 비밀번호 변경 (준)
		public void updatePwd (MemberVO vo) {
			System.out.println("===> MyBatis 사용 updatePwd() 실행");
			
			mybatis.update("memberDAO.updatePwd", vo);	
			
		}
	
	//회원삭제
	public void deleteMember(MemberVO vo) {
		System.out.println("===> MyBatis 사용 insertBoard() 실행");
		mybatis.delete("memberDAO.deleteMember", vo);
		
	}
	
	
// 정권===============================================================================
	public int getMoney(int pay) {
		System.out.println("getMoney 실행");
		
		 pay = mybatis.selectOne("getMoney", pay);
			return pay;
		
	}
	
	
	public MemberVO updateTicket(MemberVO vo) {
		System.out.println("===> MyBatis 사용 updateTicket() 실행");
		mybatis.update("memberDAO.updateTicket", vo);
		return vo;

	}
	
	
	public MemberVO ticketMinus(MemberVO vo) {
		System.out.println("===> MyBatis 사용 ticketMinus() 실행");
		mybatis.update("memberDAO.ticketMinus", vo);
		return vo;

	}
	
	public MemberVO ticketPlus(MemberVO vo) {
		System.out.println("===> MyBatis 사용 ticketPlus() 실행");
		mybatis.update("memberDAO.ticketPlus", vo);
		return vo;

	}

	// 글입력
	public void insertMember(MemberVO vo) {
		System.out.println("===> MyBatis 사용 insertMember() 실행");
		mybatis.insert("MemberDAO.insertMember", vo);
	}
	
	public List<MemberVO> getMemberListM(MemberVO vo){
 		System.out.println("getMemberListM() 실행");
 		List<MemberVO> list = mybatis.selectList("memberDAO.getMemberListM", vo);
 		return list;
 	}
	
	public List<MemberVO> getMemberListW(MemberVO vo){
 		System.out.println("getMemberListW() 실행");
 		List<MemberVO> list = mybatis.selectList("memberDAO.getMemberListW", vo);
 		return list;
 	}
	
	public MemberVO selectMMemberTotal(MemberVO vo) {
		return mybatis.selectOne("memberDAO.selectMMemberTotal", vo);
	}
	
	public List<MemberVO> getMMemberList (MemberVO vo) {
		List<MemberVO> list = mybatis.selectList("memberDAO.getMMemberList", vo);
		return list;
	}
	public MemberVO selectWMemberTotal(MemberVO vo) {
		return mybatis.selectOne("memberDAO.selectWMemberTotal", vo);
	}
	
	public List<MemberVO> getWMemberList (MemberVO vo) {
		List<MemberVO> list = mybatis.selectList("memberDAO.getWMemberList", vo);
		return list;
	}
	
}
