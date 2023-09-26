package com.spring.biz.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;
import com.spring.biz.rboard.RBoardVO;

//@Service : @Component 상속확장 어노테이션
//           비즈니스 로직 처리 서비스 영역에 사용
@Service("MemberService")
public class MemberServiceImpl implements MemberService {
	@Autowired // 타입이 일치하는 객체(인스턴스) 주입
	private MemberDAO memberDAO;

	public MemberServiceImpl() {
		System.out.println(">> MemberServiceImpl() 객체 생성");
	}
// 동훈 =================================================================================
	

	@Override
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}

	@Override
	public List<MemberVO> getMemberList(MemberVO vo) {
		
		return memberDAO.getMemberList(vo);
	}
	
	@Override
 	public List<MemberVO> getMemberListP(MemberVO vo) {
 		System.out.println("getMemberListP 작동");
 		return memberDAO.getMemberListP(vo);
 	}

	
	@Override
	public MemberVO selectMemberTotal(MemberVO vo) {
		System.out.println("selectMemberTotal 작동");
		return memberDAO.selectMemberTotal(vo);
	}
	
// 명식==================================================================================


	@Override
	public void register(MemberVO vo) {
		memberDAO.register(vo);
	}

	@Override
	public int idchk(String id) {
		int rs =  memberDAO.idchk(id);
		return rs;
	}

	@Override
	public void register2(MemberVO vo) {
		memberDAO.register2(vo);
	}
	
	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
		
	}

	@Override
	public void deleteMemeber(MemberVO vo) {
		memberDAO.deleteMember(vo);
		
	}	
	
	@Override
	public int eamilchk(String email) {
		int rs =  memberDAO.eamilchk(email);
		return rs;
	}
	@Override
	public MemberVO login(MemberVO vo) {
		return memberDAO.login(vo);
		
	}
// 정권==================================================================================
	@Override
	public void getMoney(int pay) {
		
	}



	@Override
	public void insertMember(MemberVO vo) {
		
	}



	@Override
	public MemberVO updateTicket(MemberVO vo) {
		
		return memberDAO.updateTicket(vo);
	}
	
	@Override
	public MemberVO ticketMinus(MemberVO vo) {
		
		return memberDAO.ticketMinus(vo);
	}
	
	@Override
	public MemberVO ticketPlus(MemberVO vo) {
		
		return memberDAO.ticketPlus(vo);
	}
	
	
	@Override
 	public List<MemberVO> getMemberListM(MemberVO vo) {
 		System.out.println("getMemberListM 작동");
 		return memberDAO.getMemberListM(vo);
 	}
	
	@Override
 	public List<MemberVO> getMemberListW(MemberVO vo) {
 		System.out.println("getMemberListW 작동");
 		return memberDAO.getMemberListW(vo);
 	}

	// 종현 =================================================
		@Override
		public List<MemberVO> getManTotPay(MemberVO vo) {
			return memberDAO.getManTotPay(vo);
			
		}
		
		@Override
		public MemberVO getWomanTotPay(MemberVO vo) {
			return memberDAO.getWomanTotPay(vo);
			
		}

		@Override
		public List<MemberVO> getSexCnt(MemberVO vo) {
			return memberDAO.getSexCnt(vo);
		}


		@Override
		public void updatePwd(MemberVO vo) {
			
			memberDAO.updatePwd(vo);
			
		}
		
		
		
		@Override
		public MemberVO selectMMemberTotal(MemberVO vo) {
			return memberDAO.selectMMemberTotal(vo);
		}
		@Override
		public List<MemberVO> getMMemberList(MemberVO vo) {
			return memberDAO.getMMemberList(vo);
		}
		@Override
		public MemberVO selectWMemberTotal(MemberVO vo) {
			return memberDAO.selectWMemberTotal(vo);
		}
		@Override
		public List<MemberVO> getWMemberList(MemberVO vo) {
			return memberDAO.getWMemberList(vo);
		}

		
		@Override
		public MemberVO getId(MemberVO vo) {
			return memberDAO.getId(vo);
		}




	}




