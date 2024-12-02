package com.myaws.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	// 로그인 후에 회원 정보를 세션에 담는다
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 가로채기 전에 처리하는 메소드
		HttpSession session = request.getSession();
		
		if (session.getAttribute("user_key") != null) {
			session.removeAttribute("user_key");
			session.removeAttribute("userId");
			session.removeAttribute("userName");
			session.invalidate();
		}
		
		return true;
	}

	@Override
	public void postHandle(
			HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
		
		// RedirectAttributes나 Model 객체에 담은 값을 꺼낸다
		String user_key = modelAndView.getModel().get("user_key").toString();
		String userId = modelAndView.getModel().get("userId").toString();
		String userName = modelAndView.getModel().get("userName").toString();
		
		modelAndView.getModel().clear(); // 파라미터 model값을 지운다
		
		HttpSession session = request.getSession();
		if (user_key != null) {
			session.setAttribute("user_key", user_key);
			session.setAttribute("userId", userId);
			session.setAttribute("userName", userName);
		}
	}	
}
