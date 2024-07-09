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
		
		System.out.println("����");
		System.out.println(dto);
		ModelAndView mv = new ModelAndView();
		
	    if (dto != null) {
	        String addr = m.getEmail();
	        String subject = "������ ���̵� ã�⿡ ���� �亯�Դϴ�.";
	        String body = name + "���� ���̵�� " + dto.getId() + "�Դϴ�";

	        mailService.sendEmail(email,addr, subject, body);
	        reatt.addFlashAttribute("success", "���������� ������ �̸��Ͽ� ���̵� ������ ���½��ϴ�. �̸����� Ȯ�����ּ���.");
	        mv.setViewName("login"); 
	    } else {
	   
	    	reatt.addFlashAttribute("error", "�Է��Ͻ� ������ ��ġ���� �ʽ��ϴ�.");
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
	    
	    System.out.println("����");
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
	            String subject = "������ ��й�ȣ ã�⿡ ���� �亯�Դϴ�.";
	            String body = name + "���� �ӽ� ��й�ȣ�� " + pw + "�Դϴ�. �α����� �������������� ��й�ȣ�� �������ּ���.";

	            mailService.sendEmail(email,addr, subject, body);
	            reatt.addFlashAttribute("success", "���������� ������ �̸��Ͽ� �ӽ� ��й�ȣ�� ���½��ϴ�. �α��� �� �������������� �������ּ���.");
	            return "redirect:/login";  // ���⸦ �����Ͽ� ���𷺼��� �����մϴ�.
	        } else {
	            reatt.addFlashAttribute("error", "�Է��Ͻ� ������ ��ġ���� �ʽ��ϴ�.");
	            return "rediect:/noticeMailpw";  // ���⵵ �����Ͽ� ���𷺼��� �����մϴ�.
	        }
	}
}