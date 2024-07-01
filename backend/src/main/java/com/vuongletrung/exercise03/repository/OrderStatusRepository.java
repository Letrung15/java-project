package com.vuongletrung.exercise03.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vuongletrung.exercise03.entity.OrderStatus;

public interface OrderStatusRepository extends JpaRepository<OrderStatus, String> {

}