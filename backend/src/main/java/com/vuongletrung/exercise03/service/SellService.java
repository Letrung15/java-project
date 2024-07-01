package com.vuongletrung.exercise03.service;

import java.util.List;

import com.vuongletrung.exercise03.entity.Sell;

public interface SellService {
    Sell createSell(Sell sell);

    Sell getSellById(String sellId);

    List<Sell> getAllSells();

    Sell updateSell(Sell sell);

    void deleteSell(String sellId);
}