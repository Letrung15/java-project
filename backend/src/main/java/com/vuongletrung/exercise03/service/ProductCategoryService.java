package com.vuongletrung.exercise03.service;

import java.util.List;

import com.vuongletrung.exercise03.entity.ProductCategory;

public interface ProductCategoryService {
    ProductCategory createProductCategory(ProductCategory productCategory);

    ProductCategory getProductCategoryById(String productCategoryId);

    List<ProductCategory> getAllProductCategories();

    List<ProductCategory> getProductCategoriesByProductId(String productId);

    ProductCategory updateProductCategory(ProductCategory productCategory);

    void deleteProductCategory(String productCategoryId);

    void deleteProductCategoriesByProductId(String productId);

    void deleteProductCategoriesByProductIdAndCategoryId(String productId, String categoryId);
}