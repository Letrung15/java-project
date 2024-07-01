package com.vuongletrung.exercise03.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vuongletrung.exercise03.entity.CardItem;

public interface CardItemRepository extends JpaRepository<CardItem, String> {

}
