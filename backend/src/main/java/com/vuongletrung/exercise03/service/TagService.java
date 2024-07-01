package com.vuongletrung.exercise03.service;

import java.util.List;

import com.vuongletrung.exercise03.entity.Tag;

public interface TagService {
    Tag createTag(Tag tag);

    Tag getTagById(String tagId);

    List<Tag> getAllTags();

    Tag updateTag(Tag tag);

    void deleteTag(String tagId);
}