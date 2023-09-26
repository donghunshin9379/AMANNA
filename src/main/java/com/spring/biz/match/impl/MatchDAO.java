package com.spring.biz.match.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.match.MatchVO;
import com.spring.biz.member.MemberVO;

@Repository
public class MatchDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public MatchDAO() {
		System.out.println(">> MatchDAO mybatis() 객체 생성");
	}
//동훈===========================================================
	// 아이디값 insert
			public void insertMatching(MatchVO vo) {
				System.out.println("===> Mybatis 사용 insertMatching() 실행");
				mybatis.insert("insertMatching", vo);
			}
		
			// 내게 온 신청
			public List<MatchVO> getMatchList(MemberVO member) {
				System.out.println("===> MyBatis 사용 getMatchList(vo) 실행");
				List<MatchVO> list = null;
				list = mybatis.selectList("getMatchList",member);
				return list;
			}
			
			// 내가 보낸 신청
			public List<MatchVO> getMyMatchList(MemberVO member) {
				System.out.println("===> MyBatis 사용 getMyMatchList(vo) 실행");
				List<MatchVO> list = null;
				list = mybatis.selectList("getMyMatchList",member);
				return list;
			}
			
//명식============================================================

	// 내게 온 신청
	public List<MatchVO> getMatchList(MatchVO vo) {
		System.out.println("===> MyBatis 사용 getMatchList(vo) 실행");
		List<MatchVO> list = null;
		list = mybatis.selectList("getMatchList",vo);
		return list;
	}
	
	// 내가 보낸 신청
	public List<MatchVO> getMyMatchList(MatchVO vo) {
		System.out.println("===> MyBatis 사용 getMyMatchList(vo) 실행");
		List<MatchVO> list = null;
		list = mybatis.selectList("getMyMatchList",vo);
		return list;
	}
	
	// 내게 요청한 유저 프로필 상세보기
	public MatchVO getCaller(MatchVO vo) {
		System.out.println("===> MyBatis 사용 getCaller(vo) 실행");
		System.out.println("===> vo : " +vo);
		MatchVO getCaller = mybatis.selectOne("getCaller", vo);
		return getCaller;
	}

	// 내가 신청했던 유저 프로필 상세보기
	public MatchVO getReceiver(MatchVO vo) {
		System.out.println("===> MyBatis 사용 getReceiver(vo) 실행");
		MatchVO getReceiver = mybatis.selectOne("getReceiver", vo);
		return getReceiver;
	}
	
	// 내게 온 요청 수락하기 (UPDATE)
	public void yesMatch(MatchVO vo) {
		System.out.println("===> MyBatis 사용 yesMatch(vo) 실행");
		System.out.println("===> 담긴값 : " + vo);
		mybatis.update("yesMatch", vo);
	}

	// 내게 온 요청 거절하기 (UPDATE)
	public void noMatch(MatchVO vo) {
		System.out.println("===> MyBatis 사용 noMatch(vo) 실행");
		mybatis.update("noMatch", vo);
	}

	// 내가 보낸 요청 취소하기 (UPDATE)
	public void cancelMatch(MatchVO vo) {
		System.out.println("===> MyBatis 사용 cancelMatch(vo) 실행");
		mybatis.update("cancelMatch", vo);
	}

}

