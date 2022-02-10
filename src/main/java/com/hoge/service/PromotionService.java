package com.hoge.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.dto.PromotionDto;
import com.hoge.form.Criteria;
import com.hoge.mapper.PromotionMapper;
import com.hoge.vo.other.PromotionDiscount;

@Service
public class PromotionService {
	
	@Autowired
	private PromotionMapper promotionMapper;
	
	public List<PromotionDiscount> getPromotionDiscountDetail(int accommoNo, Date checkIn, Date checkOut) {
		return promotionMapper.getPromotionDiscount(accommoNo, checkIn, checkOut);
		
	
	}

	

	public List<PromotionDto> getAccDiscountPromotions(Criteria criteria){
		return promotionMapper.getAccDiscountPromotions(criteria);
	}
	public List<PromotionDto> getAccOfferPromotions(Criteria criteria){
		return promotionMapper.getAccOfferPromotions(criteria);
	}
	public List<PromotionDto> getActDiscountPromotions(Criteria criteria){
		return promotionMapper.getActDiscountPromotions(criteria);
	}
	public List<PromotionDto> getActOfferPromotions(Criteria criteria){
		return promotionMapper.getActOfferPromotions(criteria);
		
	}

	public int getAccDiscountPromotionCount(Criteria criteria) {
		return promotionMapper.getAccDiscountPromotionCount(criteria);
		
	}
	public int getAccOfferPromotionCount(Criteria criteria) {
		return promotionMapper.getAccOfferPromotionCount(criteria);
	}
	public int getActDiscountPromotionCount(Criteria criteria) {
		return promotionMapper.getActDiscountPromotionCount(criteria);
	}
	public int getActOfferPromotionCount(Criteria criteria) {
		return promotionMapper.getActOfferPromotionCount(criteria);
	}
}
