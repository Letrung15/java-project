package com.vuongletrung.exercise03.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.vuongletrung.exercise03.entity.Gallery;

public interface GalleryService {
    Gallery createGallery(Gallery gallery);

    Gallery getGalleryById(String galleryId);

    List<Gallery> getAllGalleries();

    List<Gallery> getGalleriesByProductId(String productId);

    Gallery updateGallery(Gallery gallery);

    void deleteGallery(String galleryId);

    void deleteGalleriesByProductId(String productId);

    // New
    void saveGalleryImages(List<MultipartFile> files, String productId, String staffAccountId);

    List<String> getGalleryImages(String productId);

    void deleteImageFiles(List<String> imageUrls);

}