package com.hoge.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HogeUserDto {

	private String id;
	private String name;
	private String pwd;
	private String email;
	private String tel;
	private String gender;
}