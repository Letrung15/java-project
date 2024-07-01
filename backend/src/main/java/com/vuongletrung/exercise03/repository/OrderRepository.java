package com.vuongletrung.exercise03.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vuongletrung.exercise03.entity.Order;

public interface OrderRepository extends JpaRepository<Order, String> {

}