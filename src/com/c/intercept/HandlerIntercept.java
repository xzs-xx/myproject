package com.c.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class HandlerIntercept implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println("1.afterCompletion");		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		System.out.println("1.postHandle");
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse arg1, Object arg2) throws Exception {
		System.out.println("1.preHandle");
		StringBuffer url = request.getRequestURL();
		if(url.indexOf("login.do")>=0){
			return true;//��ʾ����
		}
		//�ж�session
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
		if(username!=null){
			System.out.println(username+":"+"");
			return true;
		}else{
			System.out.println(username+":"+"");
			request.getRequestDispatcher("/login.jsp").forward(request, arg1);
		
		}
		return false;
	}

}
