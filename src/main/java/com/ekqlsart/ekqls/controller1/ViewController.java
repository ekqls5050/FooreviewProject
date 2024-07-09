package com.ekqlsart.ekqls.controller1;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ekqlsart.ekqls.dao.BoardDao1;
import com.ekqlsart.ekqls.dao.CommentDao1;
import com.ekqlsart.ekqls.dao.LikeboardDao1;
import com.ekqlsart.ekqls.dto.board;
import com.ekqlsart.ekqls.dto.comment;
import com.ekqlsart.ekqls.dto.likeboard;

@Controller
public class ViewController {

	@Autowired
	BoardDao1 dao;
	@Autowired
	CommentDao1 dao2;
	
	@Autowired
	LikeboardDao1 dao3;
	
	@GetMapping("/view")
    public String view(Model model,HttpSession session,String mode, int num,HttpServletRequest req) { 
		int bno = num;
        board board = dao.selectNum(num);
        Map<String, Object> likeMap = new HashMap<>();
        String id=session.getAttribute("id")+"";
        likeMap.put("id", id);
        likeMap.put("bno", num);
        int like = dao3.selectLike(likeMap);
        double star = Math.round(board.getAvg_star() * 10) / 10.0; 
        List<comment> commentList = dao2.selectAll(bno);
    	String toUrl = req.getRequestURL().toString();
	    String queryString = req.getQueryString();
	    if (queryString != null) {
	        toUrl += "?" + queryString;
	    }
	    model.addAttribute("toUrl",toUrl);
        model.addAttribute("board", board); 
        model.addAttribute("commentList", commentList); 
        model.addAttribute("star", star); 
        model.addAttribute("like",like);
        System.out.println("board: "+board);
        System.out.println("like: "+like);
        String commenter = session.getAttribute("nickname")+"";
        int idc = dao2.selectidc(commenter);
        int idl = dao3.selectidl(id);
        model.addAttribute("idc", idc);
        model.addAttribute("idl", idl);
        System.out.println("idc: "+idc);
        System.out.println("idl:" +idl);

        return "view"; 
	}
	@GetMapping("/like")
	public String like(int num, String mode, RedirectAttributes redirectAttributes, HttpSession session) {
	    String id = (String) session.getAttribute("id");
	    System.out.println(num);

	    int res = 0;
	    if ("unlike".equals(mode)) {
	        // 좋아요 취소 메소드 호출
	        Map<String, Object> likeMap = new HashMap<>();
	        likeMap.put("id", id);
	        likeMap.put("bno", num);
	        res = dao3.deleteLike(likeMap);
	        // 좋아요 수 감소 처리
	        likeMap.put("likeCnt", -1); // 좋아요 수를 감소시킬 값
	        res = dao.updateLikeCnt(likeMap);
	    } else {
	        // 좋아요 추가 메소드 호출
	        Map<String, Object> likeMap = new HashMap<>();
	        likeMap.put("id", id);
	        likeMap.put("bno", num);
	        res = dao3.insertLike(likeMap);
	        // 좋아요 수 증가 처리
	        likeMap.put("likeCnt", 1); // 좋아요 수를 증가시킬 값
	        res = dao.updateLikeCnt(likeMap);
	    }

	    // 원래 페이지로 리다이렉션
	    redirectAttributes.addAttribute("num", num);
	    return "redirect:/view";
	}
	@GetMapping("commentwrite")
	public String commentwritePage(HttpSession session, int num,RedirectAttributes reatt,Model m) {
	    String commenter = session.getAttribute("nickname") + "";
	    String id = session.getAttribute("id")+"";
	    int idc = dao2.selectidc(commenter);
        int idl = dao3.selectidl(id);
        System.out.println(idl);
        m.addAttribute("idc", idc);
        m.addAttribute("idl", idl);
	    Map<String, Object> rmap = new HashMap<>();
	    rmap.put("bno", num);
	    rmap.put("commenter", commenter);
	    boolean hasReviewed = dao2.hasReviewed(rmap);
	    if (!hasReviewed) {
	        // 리뷰를 작성하지 않은 경우에만 리뷰 작성 페이지로 이동
	        return "commentwrite"; 
	    } else {
	    	reatt.addFlashAttribute("error", "이미 리뷰를 작성했습니다. 1인당 각게시물 1개의 리뷰만 작성 가능합니다.");
	        return "redirect:/view?num=" + num;
	    }
	}

	@PostMapping("commentwrite")
	public String commentwrite(int num,HttpSession session,comment c,RedirectAttributes reatt,int starVar) {
		
		c.setStar(starVar);
		c.setBno(num);
	    String commenter = session.getAttribute("nickname") + "";
	    c.setCommenter(commenter);
	   
	    int res = dao2.insertcomment(c);
	    if (res == 1) {
	    	Map<String, Object> map = new HashMap<>();
	    	map.put("bno", num);
	    	map.put("commentCnt", 1);
	    	 res = dao.updateCommentCnt1(map);
        	reatt.addFlashAttribute("success", "댓글을 성공적으로 작성했습니다.");
            return "redirect:/view?num="+num; 
        } else {
        	reatt.addFlashAttribute("error", "잠시 후 다시 시도해주십시오.");
            reatt.addAttribute(c);
            return "redirect:/commentwrite?num"+num; 
        }
	}
	
	@GetMapping("/commentedit")
	public String commentedit(comment c,int cno ,Model m) {
		
		c.setCno(cno);
		c = dao2.selectComment(cno);
		System.out.println(c.getComment());
		m.addAttribute("c",c);
		
		System.out.println(c.getComment());
		System.out.println(c.getStar());
		return "commentedit";
	}
	@PostMapping("/commentedit2")
	public String commentedit2(comment c, Model m, String comment, HttpSession session, RedirectAttributes reatt) {
	    String commenter = session.getAttribute("nickname")+"";
	    c.setCommenter(commenter);
	    System.out.println("c : "+c);
	    int res = dao2.updateComment(c);
	    if (res == 1) {
	        reatt.addFlashAttribute("error", "수정에 성공했습니다.");
	        return "redirect:/view?num=" + c.getBno();
	    } else {
	        reatt.addFlashAttribute("error", "수정에 실패했습니다.");
	        return "redirect:/view?num=" + c.getBno();
	    }
	}
		
	@GetMapping("/editboard")
	public String editboard(board b, int num,String food, String title,String addr,String phone,String hm,Model m) {
		b= dao.selectBoard(num);
		m.addAttribute("b",b);
		b.getTitle();
		b.getPhone();
		b.getHm();
		b.getNum();
		b.getFood();
		b.getAddr();
		 hm = b.getHm();
		String[] start = hm.split("[:~\\s]+");
		m.addAttribute("start0", start[0]);
		m.addAttribute("start1", start[1]);
		m.addAttribute("start2", start[2]);
		m.addAttribute("start3", start[3]);
    
		return "editboard";
	}
	@PostMapping("/editboard")
	public String edbo(board b, RedirectAttributes reatt,Integer fileEx, MultipartFile uploadFile,int num,String HH,String mm, String HH2, String mm2,HttpSession session) {
		b.setHm(HH + ":" + mm +" "+ "~" +" "+ HH2 + ":" + mm2);
		System.out.println("board dto : " + b);
	    System.out.println("파일 업로드 여부 확인 : " + fileEx);
	    System.out.println("업로드 파일 이름 : " + b.getFilename());
	    System.out.println("업로드 파일 이름 : " +uploadFile.getOriginalFilename());
	    
	    String uploadFolder = "C:\\Users\\ekqls\\Documents\\workspace-sts-3.9.17.RELEASE\\FooreviewProject\\FinalProject0430\\src\\main\\webapp\\resources\\storeimg"; // resources/_____.png
	    MultipartFile multipartFile = uploadFile;
	    System.out.println("uploadFolder: " + uploadFolder);
	    
	    String uploadFileName = multipartFile.getOriginalFilename(); // 파일 원래 이름
	    System.out.println("uplodaFileName: " + uploadFileName);
	    
	    // 경로를 제거하고 파일 이름만 가져옴
	    uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1); // 경로 제외 진짜 파일 이름
	    System.out.println("last file name: " + uploadFileName);
	    
	    // UUID를 사용하여 파일 이름 생성
	    UUID uuid = UUID.randomUUID(); // 랜덤한 이름
	    uploadFileName = uuid.toString() + "_" + uploadFileName;
	    System.out.println("변환 후 파일이름: " + uploadFileName);
	    
	    // 파일을 저장할 위치에 파일 객체 생성
	    File saveFile = new File(uploadFolder, uploadFileName); // 자바에서 File 객체
	    
	    
		
		
		
		try {
	        // 파일을 지정된 위치에 저장
	        multipartFile.transferTo(saveFile); // 컴퓨터에 저장
	        b.setFilename(uploadFileName);
	        dao.updateBoard(b);
	    } catch (IllegalStateException | IOException e) {
	        e.printStackTrace();
	    }
		
		reatt.addFlashAttribute("success", "가게정보를 성공적으로 수정했습니다.");
		return "redirect:/view?num="+num;
	}

	@GetMapping("/deleteboard")
	public String debo(board b,RedirectAttributes reatt) {
		dao.deleteBoard(b);
		reatt.addFlashAttribute("error", "가게 정보가 성공적으로 삭제되었습니다.");
		return "redirect:/food?food="+b.getFood() ;
	}
	
}
