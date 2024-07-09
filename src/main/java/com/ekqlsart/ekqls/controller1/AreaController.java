package com.ekqlsart.ekqls.controller1;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ekqlsart.ekqls.dao.CommentDao1;
import com.ekqlsart.ekqls.dao.LikeboardDao1;
import com.ekqlsart.ekqls.dao.MemberDao1;
import com.ekqlsart.ekqls.dto.member;

@Controller
public class AreaController {
	
	@Autowired
	MemberDao1 dao;
	
	@Autowired
	CommentDao1 dao2;
	
	@Autowired
	LikeboardDao1 dao3;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
    @GetMapping("/area")
    public String foodChoose(Model m ,HttpSession session) {
    	
        String commenter = session.getAttribute("nickname")+"";
        String id=session.getAttribute("id")+"";
        int idc = dao2.selectidc(commenter);
        int idl = dao3.selectidl(id);
        m.addAttribute("idc", idc);
        m.addAttribute("idl", idl);
        return "areaChoose";
    }
    
    @GetMapping("/admin")
    public String admin(Model m, HttpSession session) {
        List<member> adlist;
        String commenter = session.getAttribute("nickname")+"";
        String id=session.getAttribute("id")+"";
        int idc = dao2.selectidc(commenter);
        int idl = dao3.selectidl(id);
        m.addAttribute("idc", idc);
        m.addAttribute("idl", idl);
		try {
			adlist = dao.selectAll1();
			m.addAttribute("adlist", adlist);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "admin";
    }
    
    @RequestMapping("adminedit")
    public String adminedit(Model m,String id) {
    	
    	 member m2 = new member() ;
    	try {
			m2 = dao.admin(id);
			m.addAttribute("ad", m2); 
			m2.getNickname();
			m2.getEmail();
			m2.getBirth();
			m2.getPwd();
			m2.getPwdcon();
			System.out.println(m2);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "adminedit";
    }
    
	@PostMapping("/adminedit2")
	public String memedit(member m,RedirectAttributes reatt) {
		try {
			System.out.println("member="+m);
	        String encodedPwd = passwordEncoder.encode(m.getPwd());
	        
	        m.setPwd(encodedPwd);
	        m.setPwdcon(encodedPwd);
			dao.updateMember2(m);
			
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		reatt.addFlashAttribute("success", "회원정보를 성공적으로 수정했습니다.");
		return "redirect:/admin";
	}
    
    @GetMapping("/iddelete")
    public String iddelete(String id,RedirectAttributes redatt) {
        try {
            int res = dao.iddelete(id);
            if (res == 1) {
            	redatt.addFlashAttribute("error","성공적으로 삭제했습니다.");
                return "redirect:/admin"; // 성공 시 관리자 페이지로 리다이렉트
            } else {
                return "redirect:/errorPage"; // 실패 시 에러 페이지로 리다이렉트
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/errorPage"; // 예외 발생 시 에러 페이지로 리다이렉트
        }
    }
    
    
}
