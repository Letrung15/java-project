package com.vuongletrung.exercise03.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vuongletrung.exercise03.entity.Supply;

public interface SupplyRepository extends JpaRepository<Supply, String> {

}