package com.vuongletrung.exercise03.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vuongletrung.exercise03.entity.Sell;

public interface SellRepository extends JpaRepository<Sell, String> {

}