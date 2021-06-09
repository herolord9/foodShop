package com.webshop.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author 黄勇康
 *
 * @date  2017-
 *
 * @功能 过滤，登录认证
 */
public class AuthFilter implements Filter {

	FilterConfig config;
	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		/*获得不过滤参数
		String noFilterPath = config.getInitParameter("noFilterPath");
		
		String[] pathArray = null;
		if(noFilterPath != null) {
			pathArray = noFilterPath.split(";");
		}
		
		for(int i = 0; i < pathArray.length; i++) {
			if("".equals(pathArray[i]) || pathArray[i] == null) continue;
			if(req.getRequestURI().indexOf(pathArray[i]) != -1) {
	//System.out.println(req.getRequestURI());
				chain.doFilter(req, resp);
				return;
			}
		}
		*/
		//System.out.println(session.getAttribute("user")+"过滤器");
		if(session.getAttribute("user") != null) {
			chain.doFilter(req, resp);
		} else {
			resp.sendRedirect("home.jsp");
		}
		return;
	}
	
	public void init(FilterConfig arg0) throws ServletException {
		//config = arg0;
	}
	public void destroy() {
		// TODO Auto-generated method stub

	}
}
