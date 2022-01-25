package com.hoge.controller;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hoge.dto.HogeUserDto;
import com.hoge.dto.KakaoUserDto;
import com.hoge.service.UserService;
import com.hoge.util.SessionUtils;
import com.hoge.vo.other.User;

import lombok.extern.slf4j.Slf4j;

/**
 * 사용자 을 위한 컨트롤러
 * @author 이승준
 *
 */
@Controller
@Slf4j
public class UserAuthController {
	
	@Autowired
	private UserService userService;
	
	// 이승준: 로그인폼 페이지 리턴
	@GetMapping("/login")
	public String login() throws Exception {
		
		return "form/loginForm.tiles";
	}
	
	// 이승준: 로그인 성공 시 홈 페이지로 리다이렉트(관리자일 경우 관리자페이지 메인으로 리다이렉트)
	@PostMapping("/login")
	public String login(String id, String pwd) {
		
		User savedUser = userService.login(id, pwd);
		SessionUtils.addAttribute("LOGIN_USER", savedUser);
		
		if ("admin01".equals(savedUser.getId()) || "admin02".equals(savedUser.getId())) {
			return "redirect:admin/main";
		}
		
		return "redirect:home";
	}
	
	// 이승준: 회원가입 페이지로 리턴
	@GetMapping("/register")
	public String register() {
		
		return "form/registerForm.tiles";
	}
	
	// 이승준: 아이디 중복여부 체크
	@PostMapping("/register/checkId")
	@ResponseBody
	public int register(@RequestParam("userId") String id) {
		
		return userService.userCheckById(id);
	}
	
	// 이승준: 회원가입 
	@PostMapping("/register")
	public String register(HogeUserDto user) {
		User newUser = User.builder()
				.id(user.getId())
				.pwd(DigestUtils.sha512Hex(user.getPwd()))
				.name(user.getName())
				.tel(user.getTel())
				.email(user.getEmail())
				.gender(user.getGender())
				.build();
		
		userService.register(newUser);
		SessionUtils.addAttribute("LOGIN_USER", newUser);
		
		return "redirect:home";
	}
	
	// 이승준: 카카오톡 로그인
	@PostMapping("/loginKakao")
	public String loginKakao(KakaoUserDto kakaoUser) {
		
		log.info("카카오 로그인 인증정보 : " + kakaoUser );
		
		User user = User.builder()
					.id(kakaoUser.getId())
					.name(kakaoUser.getName())
					.email(kakaoUser.getEmail())
					.gender(kakaoUser.getGender())
					.build();
		
		User savedUser = userService.loginKakao(user);
		
		if (savedUser != null) {
			SessionUtils.addAttribute("LOGIN_USER", savedUser);
		} else {
			SessionUtils.addAttribute("LOGIN_USER", user);
		}
		
		return "redirect:home";
	}
	
	// 이승준: 로그아웃 시 홈 페이지로 리다이렉트
	@GetMapping("/logout")
	public String logout() {
		SessionUtils.sessionInvlidate();
		return "redirect:home";
	}
}