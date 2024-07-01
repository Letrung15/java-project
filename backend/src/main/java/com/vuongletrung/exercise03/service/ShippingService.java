package com.vuongletrung.exercise03.service;

import java.util.List;

import com.vuongletrung.exercise03.entity.Shipping;

public interface ShippingService {
    Shipping createShipping(Shipping shipping);

    Shipping getShippingById(Integer shippingId);

    List<Shipping> getAllShippings();

    Shipping updateShipping(Shipping shipping);

    void deleteShipping(Integer shippingId);
}