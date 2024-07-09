package com.ekqlsart.ekqls.controller1;

import java.io.File;
import java.io.IOException;
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


@Controller
public class FoodController {
	
	@Autowired
	BoardDao1 dao;
	@Autowired
	CommentDao1 dao2;
	
	@Autowired
	LikeboardDao1 dao3;
	
	@GetMapping("/food")
	public String foodCollect(Model m, String food,HttpSession session, HttpServletRequest req) {
		List<board> list = dao.selectList(food);
	    String toUrl = req.getRequestURL().toString();
	    String queryString = req.getQueryString();
	    if (queryString != null) {
	        toUrl += "?" + queryString;
	    }
	    System.out.println("toUrl=" + toUrl);
		m.addAttribute("blist", list);
		System.out.println(list);
		System.out.println(food);
		

        String commenter = session.getAttribute("nickname")+"";
        String id=session.getAttribute("id")+"";
        int idc = dao2.selectidc(commenter);
        int idl = dao3.selectidl(id);
        m.addAttribute("idc", idc);
        m.addAttribute("idl", idl);
        m.addAttribute("toUrl",toUrl);
                
        System.out.println("idc: "+idc);
        System.out.println("idl:" +idl);
        
        
        
        
		return "foood";
	}
	
	@GetMapping("/menu")
	public String menu() {
		return "boardwrite2";
	}
	
	@PostMapping("/menu")
	public String menu2(board b, RedirectAttributes reatt, String food, Integer fileEx, MultipartFile uploadFile, String HH, String mm, String HH2, String mm2, HttpSession session) {
	    b.setHm(HH + ":" + mm + " ~ " + HH2 + ":" + mm2);
	    System.out.println("board dto : " + b);
	    System.out.println("���� ���ε� ���� Ȯ�� : " + fileEx);
	    System.out.println("���ε� ���� �̸� : " + b.getFilename());
	    System.out.println("���ε� ���� �̸� : " + uploadFile.getOriginalFilename());

	    // ���ϴ� ���� ��� ���� ������ �ڽ��� ��ǻ�� ���� ������ ���������� ������Ʈ�� git�� �����ϱ� ���� ������Ʈ ���� ���ο� ����
	    String uploadFolder = "C:\\Users\\ekqls\\Documents\\workspace-sts-3.9.17.RELEASE\\FooreviewProject\\FinalProject0430\\src\\main\\webapp\\resources\\storeimg";
	    MultipartFile multipartFile = uploadFile;
	    System.out.println("uploadFolder: " + uploadFolder);

	    String uploadFileName = multipartFile.getOriginalFilename(); // ���� ���� �̸�
	    System.out.println("uploadFileName: " + uploadFileName);

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
	        dao.insertBoard(b);
	    } catch (IllegalStateException | IOException e) {
	        e.printStackTrace();
	    }

	    // RedirectAttributes�� ����Ͽ� ���� �޽��� ����
	    reatt.addFlashAttribute("error", "���������� ���� ������ �����߽��ϴ�.");
	    return "redirect:/food?food=" + food;
	}
	
	@GetMapping("/likeboard")
	public String likeboard(String id,HttpSession session,Model m) {
		id = session.getAttribute("id")+"";
		System.out.println("id: "+id);
		String commenter = session.getAttribute("nickname")+"";
        int idc = dao2.selectidc(commenter);
        int idl = dao3.selectidl(id);
        System.out.println(idl);
        m.addAttribute("idc", idc);
        m.addAttribute("idl", idl);
		List<board> list = dao.selectlikeb(id);
		System.out.println(list);
		m.addAttribute("likelist", list);
        
		return "likeboard";
	}

	@GetMapping("/commentboard")
	public String commentboard(String id,HttpSession session,Model m) {
		id = session.getAttribute("id")+"";
		System.out.println("id: "+id);
		String commenter = session.getAttribute("nickname")+"";
        int idc = dao2.selectidc(commenter);
        int idl = dao3.selectidl(id);
        System.out.println(idl);
        m.addAttribute("idc", idc);
        m.addAttribute("idl", idl);
		List<board> list = dao.selectCommentBoard(commenter);
		System.out.println(list);
		m.addAttribute("colist", list);
        
		return "commentboard";
	}
}
