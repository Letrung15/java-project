package com.vuongletrung.exercise03.service.impl;

import lombok.AllArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.vuongletrung.exercise03.entity.Gallery;
import com.vuongletrung.exercise03.entity.Product;
import com.vuongletrung.exercise03.entity.StaffAccount;
import com.vuongletrung.exercise03.repository.GalleryRepository;
import com.vuongletrung.exercise03.repository.StaffAccountRepository;
import com.vuongletrung.exercise03.service.GalleryService;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.ArrayList;
import java.util.Arrays;

@Service
@AllArgsConstructor
public class GalleryServiceImpl implements GalleryService {
    @Autowired
    private GalleryRepository galleryRepository;

    @Autowired
    private StaffAccountRepository staffAccountRepository;

    private final String UPLOAD_DIR = "D:/java-project/exercise03/src/main/resources/static/upload/";

    @Override
    public Gallery createGallery(Gallery gallery) {
        return galleryRepository.save(gallery);
    }

    @Override
    public Gallery getGalleryById(String galleryId) {
        Optional<Gallery> optionalGallery = galleryRepository.findById(galleryId);
        return optionalGallery.orElse(null);
    }

    @Override
    public List<Gallery> getAllGalleries() {
        return galleryRepository.findAll();
    }

    @Override
    public Gallery updateGallery(Gallery gallery) {
        Optional<Gallery> optionalExistingGallery = galleryRepository.findById(gallery.getGalleryId());
        if (optionalExistingGallery.isPresent()) {
            Gallery existingGallery = optionalExistingGallery.get();
            existingGallery.setImagePath(gallery.getImagePath());
            existingGallery.setThumbnail(gallery.isThumbnail());
            existingGallery.setRelatedImage(gallery.getRelatedImage());
            existingGallery.setPlaceholder(gallery.getPlaceholder());
            existingGallery.setUpdatedAt(LocalDateTime.now());

            Gallery updatedGallery = galleryRepository.save(existingGallery);
            return updatedGallery;
        }

        return null;
    }

    @Override
    public void deleteGallery(String galleryId) {
        galleryRepository.deleteById(galleryId);
    }

    @Override
    public void deleteGalleriesByProductId(String productId) {
        List<Gallery> galleries = galleryRepository.findByProductProductId(productId);
        galleryRepository.deleteAll(galleries);
    }

    @Override
    public List<Gallery> getGalleriesByProductId(String productId) {
        return galleryRepository.findByProductProductId(productId);
    }

    // New

    @Override
    public void saveGalleryImages(List<MultipartFile> files, String productId, String staffAccountId) {
        if (files == null || files.isEmpty())
            return;
        File uploadDirFile = new File(UPLOAD_DIR);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();
        }

        StaffAccount creatorUpdater = staffAccountRepository.findById(staffAccountId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid staff account ID"));

        List<Gallery> existingGalleries = galleryRepository.findByProductProductId(productId);
        Gallery gallery;
        if (!existingGalleries.isEmpty()) {
            gallery = existingGalleries.get(0);
        } else {
            gallery = new Gallery();
            gallery.setProduct(new Product(productId));
        }

        gallery.setCreatedBy(creatorUpdater);
        gallery.setUpdatedBy(creatorUpdater);

        String imagePath = null;
        String relatedImage = "";
        String placeholder = null;

        try {
            for (int i = 0; i < files.size(); i++) {
                String fileName = System.currentTimeMillis() + "-" + files.get(i).getOriginalFilename();
                String filePath = UPLOAD_DIR + fileName;
                files.get(i).transferTo(new File(filePath));

                if (i == 0) {
                    imagePath = fileName;
                }
                if (i == files.size() - 1) {
                    placeholder = fileName;
                }
                if (i == 1 && files.size() == 2 || i > 0 && i <= files.size() - 1) {
                    relatedImage += (relatedImage.isEmpty() ? "" : ";") + fileName;
                }
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to save images", e);
        }

        gallery.setImagePath(imagePath);
        gallery.setRelatedImage(relatedImage);
        gallery.setPlaceholder(placeholder);
        galleryRepository.save(gallery);
    }

    @Override
    public List<String> getGalleryImages(String productId) {
        List<Gallery> galleries = galleryRepository.findByProductProductId(productId);
        List<String> imageUrls = new ArrayList<>();
        if (!galleries.isEmpty()) {
            for (Gallery gallery : galleries) {
                if (gallery.getImagePath() != null) {
                    imageUrls.add(new File(gallery.getImagePath()).getName());
                }
                if (gallery.getRelatedImage() != null && !gallery.getRelatedImage().isEmpty()) {
                    Arrays.stream(gallery.getRelatedImage().split(";"))
                            .forEach(path -> imageUrls.add(new File(path).getName()));
                }
                // if (gallery.getPlaceholder() != null) {
                // imageUrls.add(new File(gallery.getPlaceholder()).getName());
                // }
            }
        }
        return imageUrls;
    }

    @Override
    public void deleteImageFiles(List<String> imageUrls) {
        for (String imageUrl : imageUrls) {
            File file = new File(UPLOAD_DIR + imageUrl);
            if (file.exists()) {
                if (!file.delete()) {
                    System.out.println("Failed to delete " + imageUrl); // Log or handle the failure as necessary
                }
            }
        }
    }

}
