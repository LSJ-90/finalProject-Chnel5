package com.hoge.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoge.dto.AccommoListDto;
import com.hoge.form.Criteria;
import com.hoge.pagination.Pagination;
import com.hoge.service.AccommodationService;

@Controller
@RequestMapping("/accommo")
public class AccommodationController {
	
	static final Logger logger = LogManager.getLogger(AccommodationController.class);
	
	@Autowired
	private AccommodationService accommodationService;
	
	// 염주환
	@GetMapping("/list")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") String page,
			Criteria criteria, Model model) {
		
		int totalRecords = accommodationService.getTotalRows(criteria);
		
		Pagination pagination = new Pagination(page, totalRecords, 20);
		
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		
		// 여기부터 수정하기
		List<AccommoListDto> accommoListDtos = accommodationService.searchAccommoListDto(criteria);
		
		model.addAttribute("accommos", accommoListDtos);
		model.addAttribute("pagination", pagination);
		
		return "accommo/list.tiles";
	}
}