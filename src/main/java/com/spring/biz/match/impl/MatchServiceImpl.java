package com.spring.biz.match.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.match.MatchService;
import com.spring.biz.match.MatchVO;
import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;

//@Service : @Component 상속확장 어노테이션
//           비즈니스 로직 처리 서비스 영역에 사용
@Service("matchService")
public class MatchServiceImpl implements MatchService {
	@Autowired // 타입이 일치하는 객체(인스턴스) 주입
	private MatchDAO matchDAO;

	public MatchServiceImpl() {
		System.out.println(">> MatchServiceImpl() 객체 생성");
	}
//동훈=================================================================
	@Override
	public void insertMatching(MatchVO vo) {
		matchDAO.insertMatching(vo);
	}
	
	@Override
	public List<MatchVO> getMatchList(MemberVO member) {
		
		return matchDAO.getMatchList(member);
	}

	@Override
	public List<MatchVO> getMyMatchList(MemberVO member) {
		return matchDAO.getMyMatchList(member);
	}

	@Override
	public MatchVO getCaller(MatchVO vo) {
		return matchDAO.getCaller(vo);
	}

	@Override
	public MatchVO getReceiver(MatchVO vo) {
		return matchDAO.getReceiver(vo);
	}

	@Override
	public void yesMatch(MatchVO vo) {
		matchDAO.yesMatch(vo);
	}

	@Override
	public void noMatch(MatchVO vo) {
		matchDAO.noMatch(vo);
	}

	@Override
	public void cancelMatch(MatchVO vo) {
		matchDAO.cancelMatch(vo);
	}
//명식=================================================================
	@Override
	public List<MatchVO> getMatchList(MatchVO vo) {
		
		return matchDAO.getMatchList(vo);
	}

	@Override
	public List<MatchVO> getMyMatchList(MatchVO vo) {
		return matchDAO.getMyMatchList(vo);
	}


}
