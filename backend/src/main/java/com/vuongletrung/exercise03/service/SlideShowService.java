package com.vuongletrung.exercise03.service;

import java.util.List;

import com.vuongletrung.exercise03.entity.SlideShow;

public interface SlideShowService {
    SlideShow createSlideShow(SlideShow slideShow);

    SlideShow getSlideShowById(String SlideShowId);

    List<SlideShow> getAllSlideShows();

    SlideShow updateSlideShow(SlideShow slideShow);

    void deleteSlideShow(String SlideShowId);
}