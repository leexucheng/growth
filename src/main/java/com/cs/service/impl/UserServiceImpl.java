package com.cs.service.impl;

import javax.annotation.Resource;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.cs.dao.DbsLoginMapper;
import com.cs.model.DbsLogin;

public class UserServiceImpl implements UserDetailsService {

	@Resource
	DbsLoginMapper loginDao;
	
	@Override
	public UserDetails loadUserByUsername(String username)  {
		UserDetails details = null;

		try {
			
			DbsLogin login = loginDao.selectUniqueSysUser(username);
			
			if(login != null)
				details = new User(username, login.getPassword(), AuthorityUtils.createAuthorityList("ROLE_USER"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return details;
	}

}
