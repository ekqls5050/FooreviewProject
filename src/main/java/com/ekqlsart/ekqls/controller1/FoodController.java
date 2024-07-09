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
	    System.out.println("파일 업로드 여부 확인 : " + fileEx);
	    System.out.println("업로드 파일 이름 : " + b.getFilename());
	    System.out.println("업로드 파일 이름 : " + uploadFile.getOriginalFilename());

	    // 원하는 저장 경로 설정 원래는 자신의 컴퓨터 내에 서버에 저장했지만 프로젝트를 git에 저장하기 위해 프로젝트 파일 내부에 저장
	    String uploadFolder = "C:\\Users\\ekqls\\Documents\\workspace-sts-3.9.17.RELEASE\\FooreviewProject\\FinalProject0430\\src\\main\\webapp\\resources\\storeimg";
	    MultipartFile multipartFile = uploadFile;
	    System.out.println("uploadFolder: " + uploadFolder);

	    String uploadFileName = multipartFile.getOriginalFilename(); // 파일 원래 이름
	    System.out.println("uploadFileName: " + uploadFileName);

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
	        dao.insertBoard(b);
	    } catch (IllegalStateException | IOException e) {
	        e.printStackTrace();
	    }

	    // RedirectAttributes를 사용하여 성공 메시지 설정
	    reatt.addFlashAttribute("error", "성공적으로 가게 정보를 저장했습니다.");
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
