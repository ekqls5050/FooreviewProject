package com.ekqlsart.ekqls.controller1;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ekqlsart.ekqls.dao.CommentDao1;
import com.ekqlsart.ekqls.dao.LikeboardDao1;

@Controller
public class FoodChooseController {
	
	@Autowired
	CommentDao1 dao2;
	
	@Autowired
	LikeboardDao1 dao3;
	
    @GetMapping("/foodChoose")
    public String foodChoose(Model m, HttpSession session,HttpServletRequest req) {
    	String toUrl = req.getRequestURL().toString();
	    String queryString = req.getQueryString();
	    if (queryString != null) {
	        toUrl += "?" + queryString;
	    }
	    m.addAttribute("toUrl",toUrl);
        String commenter = session.getAttribute("nickname")+"";
        String id=session.getAttribute("id")+"";
        int idc = dao2.selectidc(commenter);
        int idl = dao3.selectidl(id);
        m.addAttribute("idc", idc);
        m.addAttribute("idl", idl);
        String[] arr = {"1st","2nd","3rd","4th","5th","6th","7th","8th","9th","10th"};
        m.addAttribute("order", arr);
		List<Map<String, Object>> reviewerCounts = dao2.selectCommenterReviewCounts();
		m.addAttribute("reviewerCounts", reviewerCounts);
		System.out.println(reviewerCounts);
        return "foodChoose";
    }
}
