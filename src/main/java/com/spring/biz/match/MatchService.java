package com.spring.biz.match;

import java.util.List;

import com.spring.biz.member.MemberVO;



public interface MatchService {
	//동훈===============================================
	// 매칭신청(INSERT)
	void insertMatching(MatchVO vo);
	// 나의  매치 수신 리스트(SELECT)
	List<MatchVO> getMatchList(MemberVO member);
	// 나의 매치 발신 리스트(SELECT)
	List<MatchVO> getMyMatchList(MemberVO member);
	// 발신자 정보 보기 (내게 요청한 유저)
	MatchVO getCaller(MatchVO vo);
	// 수신자 정보 보기 (내가 요청했던 유저)
	MatchVO getReceiver(MatchVO vo);
	// 발신자 정보보기 (수락하기)
	void yesMatch(MatchVO vo);
	// 발신자 정보보기 (거절하기)
	void noMatch(MatchVO vo);
	// 수신자 정보보기 (매칭 취소)
	void cancelMatch(MatchVO vo);
	//명식===============================================
	
	List<MatchVO> getMatchList(MatchVO vo);
	List<MatchVO> getMyMatchList(MatchVO vo);
	
}
