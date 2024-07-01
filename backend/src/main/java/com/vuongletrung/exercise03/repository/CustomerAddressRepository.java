package com.vuongletrung.exercise03.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vuongletrung.exercise03.entity.CustomerAddress;

public interface CustomerAddressRepository extends JpaRepository<CustomerAddress, String> {

}