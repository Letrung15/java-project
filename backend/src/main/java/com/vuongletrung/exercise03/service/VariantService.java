package com.vuongletrung.exercise03.service;

import java.util.List;

import com.vuongletrung.exercise03.entity.Variant;

public interface VariantService {
    Variant createVariant(Variant variant);

    Variant getVariantById(String variantId);

    List<Variant> getAllVariants();

    Variant updateVariant(Variant variant);

    void deleteVariant(String variantId);
}