package com.vuongletrung.exercise03.service;

import java.util.List;

import com.vuongletrung.exercise03.entity.Customer;

public interface CustomerService {
    Customer createCustomer(Customer customer);

    Customer getCustomerById(String customerId);

    List<Customer> getAllCustomers();

    Customer updateCustomer(Customer customer);

    void deleteCustomer(String customerId);
}