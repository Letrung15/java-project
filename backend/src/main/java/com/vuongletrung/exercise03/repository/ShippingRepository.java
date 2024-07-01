package com.vuongletrung.exercise03.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vuongletrung.exercise03.entity.Shipping;

public interface ShippingRepository extends JpaRepository<Shipping, Integer> {

}