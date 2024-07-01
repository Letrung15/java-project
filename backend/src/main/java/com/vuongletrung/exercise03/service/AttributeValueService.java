package com.vuongletrung.exercise03.service;

import java.util.List;

import com.vuongletrung.exercise03.entity.AttributeValue;

public interface AttributeValueService {
    AttributeValue createAttributeValue(AttributeValue attributeValue);

    AttributeValue getAttributeValueById(String attributeValueId);

    List<AttributeValue> getAllAttributeValues();

    AttributeValue updateAttributeValue(AttributeValue attributeValue);

    void deleteAttributeValue(String attributeValueId);
}