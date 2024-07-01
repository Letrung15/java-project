package com.vuongletrung.exercise03.service;

import java.util.List;

import com.vuongletrung.exercise03.entity.VariantOption;

public interface VariantOptionService {
    VariantOption createVariantOption(VariantOption variantOption);

    VariantOption getVariantOptionById(String variantOptionId);

    List<VariantOption> getAllVariantOptions();

    VariantOption updateVariantOption(VariantOption variantOption);

    void deleteVariantOption(String variantOptionId);
}