package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.form.CriteriaAdminUser;
import com.hoge.vo.other.User;


/**
 * 유저 기능에 관한 메서드명을 정의하였다.
 * @author 이승준
 *
 */
@Mapper
public interface UserMapper {
	
	// 이승준 테스트용, 모든 유저정보를 가져온다.
	List<User> getAllUsers();
	
	// 이승준 아이디에 맞는 유저정보를 가져온다.
	User getUserById(String id);
	
	// 이승준 회원가입을 위한 메소드이다.
	void insertUser(User newUser);
	
	// 이승준 아이디 중복여부체크
	int userCheckByid(String id);
	
	// 성하민
	int getUsersTotalRows(CriteriaAdminUser CAU);
	
	// 성하민
	List<User> searchUsers(CriteriaAdminUser CAU);

	

}
