package com.ekqlsart.ekqls.controller1;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ekqlsart.ekqls.dao.MemberDao1;
import com.ekqlsart.ekqls.dto.member;


@Controller
public class LoginController {
    @Autowired
    MemberDao1 dao;
    
    @Autowired
    PasswordEncoder passwordEncoder;
    

    @GetMapping("/login")
    public String foodChoose() {
        return "firstPage";
    }
    

	@PostMapping("/login")
	public String join(String id, String pwd, boolean rememberId, String toUrl, HttpServletResponse resp, HttpSession session, RedirectAttributes reatt) throws Exception {
		member m = dao.selectMember(id);
		System.out.println(m.getPwd());
		System.out.println("id : " + id +" / pwd : " + pwd+passwordEncoder.matches(pwd, m.getPwd()));
		if(!(m!=null && m.getId().equals(id) && passwordEncoder.matches(pwd, m.getPwd()))) {
//			m!=null && m.getId().equals(id) && passwordEncoder.matches(pw, m.getPw());
			String msg = URLEncoder.encode("���̵�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.", "UTF-8");
			reatt.addFlashAttribute("error", "���̵� Ȥ�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			return "redirect:/login?msg="+msg;
		}
		if(rememberId) {
			Cookie cookie = new Cookie("id", id);
			resp.addCookie(cookie);
		}else {
			//id ���� ����ֱ� ���� ""�� ����
			Cookie cookie = new Cookie("id", "");
			cookie.setMaxAge(0);
			resp.addCookie(cookie);
		}
		
		session.setAttribute("id", m.getId());
		session.setAttribute("name", m.getName());
		session.setAttribute("nickname", m.getNickname());
		session.setAttribute("area", m.getArea());
		 toUrl = "null".equals(toUrl) || "".equals(toUrl) || null==toUrl ? "area" : toUrl;
		
		return "redirect:"+toUrl;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login"; 
	}
	
	@GetMapping("/mypage1")
	public String mypage(Model m,member mem,HttpSession session) throws Exception {
		String id = session.getAttribute("id") + "";
		mem = dao.selectMember(id);
		m.addAttribute("mem",mem);
		mem.getEmail();
		mem.getBirth();
		mem.getPwd();
		mem.getPwdcon();
		return "mypage";
	}
    
    @GetMapping("/myiddelete")
    public String myiddelete(String id,RedirectAttributes redatt) {
        try {
            int res = dao.iddelete(id);
            if (res == 1) {
            	redatt.addFlashAttribute("error","���������� �����߽��ϴ�.");
                return "redirect:/login"; // ���� �� ������ �������� �����̷�Ʈ
            } else {
                return "redirect:/errorPage"; // ���� �� ���� �������� �����̷�Ʈ
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/errorPage"; // ���� �߻� �� ���� �������� �����̷�Ʈ
        }
    }
	@PostMapping("/memedit")
	public String memedit(member m,RedirectAttributes reatt,String toUrl,HttpSession session) {
		try {
	        String encodedPwd = passwordEncoder.encode(m.getPwd());
	        
	        m.setPwd(encodedPwd);
	        m.setPwdcon(encodedPwd);
			dao.updateMember(m);
			session.setAttribute("area", m.getArea());
			toUrl = "null".equals(toUrl) || "".equals(toUrl) || null==toUrl ? "area" : toUrl;
			System.out.println(toUrl);
			
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		reatt.addFlashAttribute("success", "ȸ�������� ���������� �����߽��ϴ�.");
		return "redirect:"+toUrl;
	}
	
	@GetMapping("checkid")
	public String checkid() {
		return "checkid";
	}
	@GetMapping("checkpw")
	public String checkpw() {
		return "checkpw";
	}
}