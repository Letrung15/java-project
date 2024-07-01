package com.vuongletrung.exercise03.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vuongletrung.exercise03.entity.StaffAccount;

public interface StaffAccountRepository extends JpaRepository<StaffAccount, String> {

}