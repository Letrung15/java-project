package com.vuongletrung.exercise03.service;

import java.util.List;

import com.vuongletrung.exercise03.entity.Product;

public interface ProductService {
    Product createProduct(Product product);

    Product getProductById(String productId);

    List<Product> getAllProducts();

    List<Product> getProductsByTagId(String tagId);

    List<Product> searchProductsByName(String productName);

    Product updateProduct(Product product);

    void deleteProduct(String productId);
}