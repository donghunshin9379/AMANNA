 package com.spring.biz.view.rboard;
 
 import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.stereotype.Controller;
 import org.springframework.ui.Model;
 import org.springframework.web.bind.annotation.RequestMapping;
 import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;
import com.spring.biz.rboard.QrBoardService;
import com.spring.biz.rboard.QrBoardVO;
import com.spring.biz.rboard.RBoardService;
 import com.spring.biz.rboard.RBoardVO;
 
 @SessionAttributes("rboard")
 @Controller
 public class RBoardController {
    private RBoardService rboardService;
     @Autowired
     private MemberService memberService;
    @Autowired
     private QrBoardService QrBoardService;
    
    public RBoardController() {
       System.out.println("RBoardController () 객체 생성");
    }
    
    @Autowired
    public RBoardController(RBoardService rboardService) {
       System.out.println("RBoardService(rboardService) 객체 생성");
       this.rboardService = rboardService;
    }
    
    
    @RequestMapping("/main.do")
    public String main (RBoardVO vo, Model model, MemberVO mvo) {
       
       List<RBoardVO> list = rboardService.getRBoardList(vo);
       model.addAttribute("rboardList", list);
       System.out.println("list : " + list);
       MemberVO member = memberService.getMember(mvo);
      System.out.println("member : " + member);
      model.addAttribute("member", member);
      
      return "main.jsp";
       
       
    }
    
    @RequestMapping("/getRBoardList.do")
    public String getRBoardList(RBoardVO vo, Model model, MemberVO mvo) {
       System.out.println(">>> 리뷰글 전체 보여주기");
       System.out.println("vo : " +vo);
       
       RBoardVO total = rboardService.selectNRBoardTotal(vo);
       System.out.println("total :" + total);
       
       double totalPage = Math.ceil((double) total.getTotal() / 10);
      System.out.println("totalPage: " + totalPage);
       
       int viewPage = vo.getViewPage(); 
       int startIndex = (viewPage-1) * 10 + 1;
       int endIndex = startIndex + (10 - 1);
       
       vo.setStartIndex(startIndex); 
       vo.setEndIndex(endIndex);
       
       model.addAttribute("total", total);
      model.addAttribute("totalPage", totalPage);
       
       List<RBoardVO> list = rboardService.getRBoardList(vo);
       model.addAttribute("rboardList", list);
       System.out.println("list : " + list);
       MemberVO member = memberService.getMember(mvo);
      System.out.println("member : " + member);
      model.addAttribute("member", member);
       
       return "getRBoardList.jsp";
    }
    
    @RequestMapping("/getRBoard.do")
    public String getRBoard(RBoardVO vo, Model model, QrBoardVO qvo, MemberVO mvo, HttpSession session) {
        System.out.println(">>> 리뷰글 보여주기");
        RBoardVO rboard = rboardService.getRBoard(vo);

        List<QrBoardVO> qlist = QrBoardService.getQrBoardList(qvo);
        model.addAttribute("rboard", rboard);
        model.addAttribute("qlist", qlist);
        System.out.println("qlist : " + qlist);

        MemberVO member = memberService.getMember(mvo);
        System.out.println("member : " + member);
        model.addAttribute("member", member);

        MemberVO loggedInMember = (MemberVO) session.getAttribute("member");
        System.out.println("member1: " + loggedInMember);
       if (loggedInMember != null && loggedInMember.getId().equals(rboard.getId())) {
           // 작성자와 회원님이 같은 경우에는 조회수 증가하지 않음
           System.out.println("작성자와 회원님이 같습니다");
       } else if (loggedInMember != null) {
           // 로그인 상태이고 작성자와 회원님이 다른 경우에는 조회수 증가
           System.out.println("작성자와 회원님이 다릅니다");
           rboard.setCount(rboard.getCount() + 1); // 조회수 증가
           rboardService.updateCountRBoard(vo);
       } else {
           // 로그인 상태가 아닌 경우에는 조회수 증가하지 않음
           System.out.println("로그인 상태가 아닙니다");
       }
        return "getRBoard.jsp";
    }


    
    @RequestMapping("/getMyRBoardList.do") 
    public String getMyRBoard(RBoardVO vo,Model model,  MemberVO mvo) {
       System.out.println(">>> 리뷰글 보여주기");
       List<RBoardVO> list = rboardService.getMyRBoardList(vo);
       model.addAttribute("rboard", list);
       
       MemberVO member = memberService.getMember(mvo);
      System.out.println("member : " + member);
      model.addAttribute("member", member);
       return "getMyRBoardList.jsp";
    }
    
    @RequestMapping("/insertRBoard.do")
    public String insertRBoard(MultipartHttpServletRequest request, RBoardVO vo) {
        // 파일 업로드 처리 로직
        MultipartFile file = request.getFile("uploadFile");
        if (file != null) {
            // 파일이 업로드된 경우 처리
            try {
                // 저장할 경로와 파일명 설정
                String uploadPath = "C:/MYSTUDY/drive-download-20230416T103643Z-001/FINAL/PayTest/src/main/webapp/reviewPictures/";
                String fileName = file.getOriginalFilename();
                String extension = "";
                int dotIndex = fileName.lastIndexOf(".");
                if (dotIndex >= 0) {
                    extension = fileName.substring(dotIndex);
                }
                String randomFileName = UUID.randomUUID().toString() + extension;
                String filePath = uploadPath + randomFileName;

                // 파일 저장
                File dest;
                if (extension.isEmpty()) {
                    // 확장자가 없는 경우 기본 확장자를 설정하거나 파일 업로드를 건너뛰는 등의 처리를 수행
                    // 예시: dest = new File(filePath + ".txt");
                    // 예시: return "errorPage.jsp"; // 파일 업로드를 건너뛰는 경우
                } else {
                    dest = new File(filePath);
                    file.transferTo(dest);
                }
                // 파일 업로드 성공 처리
                vo.setUploadFile1(fileName);
                System.out.println("fileName :" + fileName);
            } catch (IOException e) {
                // 파일 업로드 실패 처리
                // ...
            }
        } else {
            // 파일이 업로드되지 않은 경우 처리
            // ...
        }

        // 나머지 리뷰 입력 처리 로직
        // vo에 필요한 값들을 request.getParameter() 등을 사용하여 설정
        System.out.println("uploadFile1 : " + file);
        System.out.println("vo : " + vo);
        rboardService.insertRBoard(vo);
        return "getMyRBoardList.do";
    }


    
    
    
    @RequestMapping("/deleteRBoard.do")
    public String deleteRBoard(RBoardVO vo, QrBoardVO qvo) {
       System.out.println("삭제 작업 장동");
       rboardService.deleteRBoard(vo);
       QrBoardService.deleteQrBoard(qvo);
       return "getMyRBoardList.do";
    }
    
    @RequestMapping("/getMyRBoard.do")
    public String getMyRBoard(RBoardVO vo, Model model) {
       System.out.println(">>> 리뷰글 보여주기");
       RBoardVO rboard = rboardService.getRBoard(vo);
       model.addAttribute("rboard", rboard);
       return "getMyRBoard.jsp";
    }
    
    @RequestMapping("/updateRBoard.do")
    public String updateRBoard(RBoardVO vo) {
       System.out.println("업데이트 작업 진행");
       rboardService.updateRBoard(vo);
       System.out.println("test");
       return "getMyRBoard.do";
    }
    
    //관리자 리뷰 관리
    @RequestMapping("/getAdminRBoardList.do")
    public String getAdminRBoardList(RBoardVO vo, Model model) {
       System.out.println(">>> 리뷰글 전체 보여주기");
       System.out.println("vo : " +vo);
       
       RBoardVO total = rboardService.selectNRBoardTotal(vo);
       System.out.println("total :" + total);
       
       double totalPage = Math.ceil((double) total.getTotal() / 10);
      System.out.println("totalPage: " + totalPage);
       
       int viewPage = vo.getViewPage(); int startIndex = (viewPage-1) * 10 + 1;
       int endIndex = startIndex + (10 - 1);
       
       vo.setStartIndex(startIndex); vo.setEndIndex(endIndex);
       
       model.addAttribute("total", total);
      model.addAttribute("totalPage", totalPage);
       
       List<RBoardVO> list = rboardService.getRBoardList(vo);
       model.addAttribute("rboardList", list);
       System.out.println("list : " + list);
       return "getAdminRBoardList.jsp";
    }
    //관리자 리뷰 보기
    @RequestMapping("/getAdminRBoard.do")
    public String getAdminRBoard(RBoardVO vo, Model model, QrBoardVO qvo ) {
       System.out.println("관리자 모드로 글보기");
       RBoardVO rboard = rboardService.getRBoard(vo);
       List<QrBoardVO> qlist = QrBoardService.getQrBoardList(qvo);
       
       model.addAttribute("rboard", rboard);
       model.addAttribute("qlist", qlist); 
       System.out.println("qlist : " + qlist);

       return "getAdminRBoard.jsp";
    }
    
    //관리자 모드로 리뷰 지우기
    @RequestMapping("/deleteAdminRBoard.do")
    public String deleteAdminRBoard(RBoardVO vo,QrBoardVO qvo) {
    System.out.println("삭제 작업 장동");
   rboardService.deleteRBoard(vo);
   QrBoardService.deleteQrBoard(qvo);
   return "getAdminRBoardList.do";
    }
    
     //(정권) 이벤트 채택하기
    
     @RequestMapping("/eventChoose.do")
     public String eventChoose(RBoardVO vo,MemberVO mvo) { 
     System.out.println("이벤트 작업 작동"); 
     RBoardVO rboard = rboardService.getRBoard(vo);
     String id = rboard.getId();
     System.out.println("id : " + id);
     
    mvo.setId(id);  
     
    System.out.println("mvo : " + mvo);
     memberService.ticketPlus(mvo);
     
     
     return "getAdminRBoardList.do"; }
 }