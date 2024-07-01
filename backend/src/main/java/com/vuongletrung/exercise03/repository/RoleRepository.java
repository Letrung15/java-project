package com.vuongletrung.exercise03.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vuongletrung.exercise03.entity.Role;

public interface RoleRepository extends JpaRepository<Role, String> {

}