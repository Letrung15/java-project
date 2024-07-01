package com.vuongletrung.exercise03.service;

import java.util.List;

import com.vuongletrung.exercise03.entity.ProductSupply;

public interface ProductSupplyService {
    ProductSupply createProductSupply(ProductSupply product);

    ProductSupply getProductSupplyById(String productId);

    List<ProductSupply> getAllProductSupplys();

    ProductSupply updateProductSupply(ProductSupply product);

    void deleteProductSupply(String productId);
}