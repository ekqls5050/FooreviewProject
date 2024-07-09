package com.ekqlsart.ekqls.controller1;



import java.security.SecureRandom;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ekqlsart.ekqls.dao.MailService;
import com.ekqlsart.ekqls.dao.MemberDao1;
import com.ekqlsart.ekqls.dto.member;

@Controller
public class EmailController {
	
	
	@Autowired
	MemberDao1 dao;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private MailService mailService;

	@RequestMapping("/noticeMailid")
	public String sendEmailid(String id, String email,String name, String year, String month, String day,String domain,String birth,RedirectAttributes reatt) throws Exception {
		member m = new member();
		m.setName(name);
		m.setEmail(email+ "@" + domain);
		email = m.getEmail();
		id = m.getId();
		member dto=dao.selectcheckid(m);
		System.out.println(m);
		
		System.out.println("실행");
		System.out.println(dto);
		ModelAndView mv = new ModelAndView();
		
	    if (dto != null) {
	        String addr = m.getEmail();
	        String subject = "프리뷰 아이디 찾기에 대한 답변입니다.";
	        String body = name + "님의 아이디는 " + dto.getId() + "입니다";

	        mailService.sendEmail(email,addr, subject, body);
	        reatt.addFlashAttribute("success", "성공적으로 귀하의 이메일에 아이디 정보를 보냈습니다. 이메일을 확인해주세요.");
	        mv.setViewName("login"); 
	    } else {
	   
	    	reatt.addFlashAttribute("error", "입력하신 정보가 일치하지 않습니다.");
	        mv.setViewName("sendEmailid");
	    }
		return "redirect:/login";
	}
	public static class PasswordUtil {
	    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    private static final int PASSWORD_LENGTH = 8;

	    public static String generateRandomPassword() {
	        SecureRandom random = new SecureRandom();
	        StringBuilder password = new StringBuilder(PASSWORD_LENGTH);

	        for (int i = 0; i < PASSWORD_LENGTH; i++) {
	            int index = random.nextInt(CHARACTERS.length());
	            password.append(CHARACTERS.charAt(index));
	        }

	        return password.toString();
	    }
	}
	@RequestMapping("/noticeMailpw")
	public String sendEmailpw(String id, String email,String name,String pw ,String year, String month, String day,String domain,String birth,RedirectAttributes reatt) throws Exception {
	    member m = new member();
	    m.setName(name);
	    m.setId(id);
	    m.setEmail(email+ "@" + domain);
	    m.setBirth(year + "-" + month + "-" + day);
	    id = m.getId();
	    email = m.getEmail();
	    birth = m.getBirth();
	    
	    member dto = dao.selectcheckpw(m);
	    System.out.println(m);
	    
	    System.out.println("실행");
	    ModelAndView mv = new ModelAndView();
	     if (dto != null) {
	    
	 		UUID uid = UUID.randomUUID();
	 		pw = uid.toString().substring(0, 8);
	 		m.setPwd(passwordEncoder.encode(pw));
	 		m.setPwdcon(passwordEncoder.encode(pw));
	 		dto.setPwd(passwordEncoder.encode(pw));
	 		dto.setPwdcon(passwordEncoder.encode(pw));
	         dao.updateMember(dto);
	            
	            String addr = m.getEmail();
	            String subject = "프리뷰 비밀번호 찾기에 대한 답변입니다.";
	            String body = name + "님의 임시 비밀번호는 " + pw + "입니다. 로그인후 마이페이지에서 비밀번호를 변경해주세요.";

	            mailService.sendEmail(email,addr, subject, body);
	            reatt.addFlashAttribute("success", "성공적으로 귀하의 이메일에 임시 비밀번호를 보냈습니다. 로그인 후 마이페이지에서 수정해주세요.");
	            return "redirect:/login";  // 여기를 수정하여 리디렉션을 변경합니다.
	        } else {
	            reatt.addFlashAttribute("error", "입력하신 정보가 일치하지 않습니다.");
	            return "rediect:/noticeMailpw";  // 여기도 수정하여 리디렉션을 변경합니다.
	        }
	}
}