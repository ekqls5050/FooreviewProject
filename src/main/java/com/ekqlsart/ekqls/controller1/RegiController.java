package com.ekqlsart.ekqls.controller1;

import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ekqlsart.ekqls.dao.MemberDao1;
import com.ekqlsart.ekqls.dto.member;

@Controller
public class RegiController {
	
	@Autowired
	MemberDao1 dao;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
    @GetMapping("/register")
    public String register(member m, Model model, HttpSession session) {
        if (session.getAttribute("member") != null) {
            model.addAttribute("member", session.getAttribute("member"));
        }
        return "regiPage";
    }
    
    @PostMapping("/register")
    public String register(member m,String pwd,String pwdcon,String year, String month, String day, String email, String email_id, String domain, RedirectAttributes reatt, Model model, HttpSession session) {
        m.setBirth(year + "-" + month + "-" + day);
        m.setEmail(email_id + "@" + domain); 
        m.setPwd(pwd);
        m.setPwdcon(pwdcon);

        // 비밀번호 확인
        if (!m.getPwd().equals(m.getPwdcon())) {
            reatt.addFlashAttribute("error", "비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            session.setAttribute("member", m);
            return "redirect:/register"; 
        }

        // 비밀번호 암호화
        String encodedPwd = passwordEncoder.encode(m.getPwd());

        m.setPwd(encodedPwd);
        m.setPwdcon(encodedPwd);

        System.out.println(encodedPwd);

        try {
            member idcheck = dao.selectMember(m.getId());
            if (idcheck != null) {
                reatt.addFlashAttribute("error", "이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.");
                session.setAttribute("member", m);
                return "redirect:/register"; 
            }

            // 닉네임 중복 체크
            member nickcheck = dao.selectnickname(m.getNickname());
            if (nickcheck != null) {
                reatt.addFlashAttribute("error", "이미 사용 중인 닉네임입니다. 다른 닉네임을 입력해주세요.");
                session.setAttribute("member", m);
                return "redirect:/register"; 
            }

            // 회원 가입 처리
            int res = dao.insertMember(m);
            if (res == 1) {
                reatt.addFlashAttribute("success", "회원가입에 성공했습니다.");
                return "redirect:/login"; 
            } else {
                reatt.addFlashAttribute("error", "회원가입 실패");
                reatt.addAttribute(m);
                return "redirect:/register"; 
            }
        } catch (Exception e) {
            e.printStackTrace();
            reatt.addFlashAttribute("error", "회원가입 중 오류가 발생했습니다.");
            session.setAttribute("member", m);
            return "redirect:/register"; 
        }
    }

	@GetMapping("/idcheck")
	@ResponseBody
	public String idCheck(String id){
		try {
			member m = dao.selectMember(id);
			System.out.println(m);
			if(m==null) {
				return "0";
			}
			return "1";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "1";
		}
	}
	
	@GetMapping("/nickcheck")
	@ResponseBody
	public String nickCheck(String nickname){
		try {
			member m = dao.selectnickname(nickname);
			if(m==null) {
				return "0";
			}
			return "1";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "1";
		}
	}
}
