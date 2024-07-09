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
	        // ���ƿ� ��� �޼ҵ� ȣ��
	        Map<String, Object> likeMap = new HashMap<>();
	        likeMap.put("id", id);
	        likeMap.put("bno", num);
	        res = dao3.deleteLike(likeMap);
	        // ���ƿ� �� ���� ó��
	        likeMap.put("likeCnt", -1); // ���ƿ� ���� ���ҽ�ų ��
	        res = dao.updateLikeCnt(likeMap);
	    } else {
	        // ���ƿ� �߰� �޼ҵ� ȣ��
	        Map<String, Object> likeMap = new HashMap<>();
	        likeMap.put("id", id);
	        likeMap.put("bno", num);
	        res = dao3.insertLike(likeMap);
	        // ���ƿ� �� ���� ó��
	        likeMap.put("likeCnt", 1); // ���ƿ� ���� ������ų ��
	        res = dao.updateLikeCnt(likeMap);
	    }

	    // ���� �������� �����̷���
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
	        // ���並 �ۼ����� ���� ��쿡�� ���� �ۼ� �������� �̵�
	        return "commentwrite"; 
	    } else {
	    	reatt.addFlashAttribute("error", "�̹� ���並 �ۼ��߽��ϴ�. 1�δ� ���Խù� 1���� ���丸 �ۼ� �����մϴ�.");
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
        	reatt.addFlashAttribute("success", "����� ���������� �ۼ��߽��ϴ�.");
            return "redirect:/view?num="+num; 
        } else {
        	reatt.addFlashAttribute("error", "��� �� �ٽ� �õ����ֽʽÿ�.");
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
	        reatt.addFlashAttribute("error", "������ �����߽��ϴ�.");
	        return "redirect:/view?num=" + c.getBno();
	    } else {
	        reatt.addFlashAttribute("error", "������ �����߽��ϴ�.");
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
	    System.out.println("���� ���ε� ���� Ȯ�� : " + fileEx);
	    System.out.println("���ε� ���� �̸� : " + b.getFilename());
	    System.out.println("���ε� ���� �̸� : " +uploadFile.getOriginalFilename());
	    
	    String uploadFolder = "C:\\Users\\ekqls\\Documents\\workspace-sts-3.9.17.RELEASE\\FooreviewProject\\FinalProject0430\\src\\main\\webapp\\resources\\storeimg"; // resources/_____.png
	    MultipartFile multipartFile = uploadFile;
	    System.out.println("uploadFolder: " + uploadFolder);
	    
	    String uploadFileName = multipartFile.getOriginalFilename(); // ���� ���� �̸�
	    System.out.println("uplodaFileName: " + uploadFileName);
	    
	    // ��θ� �����ϰ� ���� �̸��� ������
	    uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1); // ��� ���� ��¥ ���� �̸�
	    System.out.println("last file name: " + uploadFileName);
	    
	    // UUID�� ����Ͽ� ���� �̸� ����
	    UUID uuid = UUID.randomUUID(); // ������ �̸�
	    uploadFileName = uuid.toString() + "_" + uploadFileName;
	    System.out.println("��ȯ �� �����̸�: " + uploadFileName);
	    
	    // ������ ������ ��ġ�� ���� ��ü ����
	    File saveFile = new File(uploadFolder, uploadFileName); // �ڹٿ��� File ��ü
	    
	    
		
		
		
		try {
	        // ������ ������ ��ġ�� ����
	        multipartFile.transferTo(saveFile); // ��ǻ�Ϳ� ����
	        b.setFilename(uploadFileName);
	        dao.updateBoard(b);
	    } catch (IllegalStateException | IOException e) {
	        e.printStackTrace();
	    }
		
		reatt.addFlashAttribute("success", "���������� ���������� �����߽��ϴ�.");
		return "redirect:/view?num="+num;
	}

	@GetMapping("/deleteboard")
	public String debo(board b,RedirectAttributes reatt) {
		dao.deleteBoard(b);
		reatt.addFlashAttribute("error", "���� ������ ���������� �����Ǿ����ϴ�.");
		return "redirect:/food?food="+b.getFood() ;
	}
	
}
