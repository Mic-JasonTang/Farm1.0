package com.Jason.Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 
* @ClassName: ErrorFilter 
* @Description:捕获错误，转到错误页面
* @author: Jason
* @date: 2016年4月30日 下午2:53:39 
*
 */
public class UsernameCheckFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResopnse = (HttpServletResponse) response;
//		System.out.println(httpRequest.getSession().getAttribute("username"));
		if(httpRequest.getSession().getAttribute("username") == null) {
			//如果检测到用户名是空，就跳转到登录页面
			httpResopnse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
			return;
		} else { //放行
			filterChain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
