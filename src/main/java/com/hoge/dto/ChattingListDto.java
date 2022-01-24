package com.hoge.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * sender와 reciever의 정보를 반환하는 dto
 * @author 성하민
 *
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChattingListDto {
	
	private int chatRoomNo;
	private int hostNo;
	private int userNo;
	
	private String name; //유저이름 or 호스트이름
	private String image; //유저 or 호스트 이미지
	
	private String lastMessage;
	private Date updatedDate;
	

	

}
