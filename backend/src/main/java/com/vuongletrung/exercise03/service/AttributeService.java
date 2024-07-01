package com.vuongletrung.exercise03.service;

import java.util.List;

import com.vuongletrung.exercise03.entity.Attribute;

public interface AttributeService {
    Attribute createAttribute(Attribute attribute);

    Attribute getAttributeById(String attributeId);

    List<Attribute> getAllAttributes();

    Attribute updateAttribute(Attribute attribute);

    void deleteAttribute(String attributeId);
}