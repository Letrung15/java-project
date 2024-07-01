package com.vuongletrung.exercise03.controller;

import lombok.AllArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.vuongletrung.exercise03.entity.Gallery;
import com.vuongletrung.exercise03.service.GalleryService;

import java.util.List;

@CrossOrigin(origins = "*", methods = { RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT,
        RequestMethod.DELETE })
@RestController
@AllArgsConstructor
@RequestMapping("api/galleries")
public class GalleryController {

    @Autowired
    private GalleryService galleryService;

    // private final String UPLOAD_DIR =
    // "C:/Sol/ChuyenDeWed2_ThayTu/java-projects-test-test/example09/src/assets/images/products/";
    @PostMapping("/upload/{productId}/{staffAccountId}")
    public ResponseEntity<?> uploadImages(@RequestParam("files") List<MultipartFile> files,
            @PathVariable String productId, @PathVariable String staffAccountId) {
        galleryService.saveGalleryImages(files, productId, staffAccountId);
        return ResponseEntity.ok("Images uploaded successfully");
    }

    @GetMapping("/images/{productId}")
    public ResponseEntity<List<String>> getImages(@PathVariable String productId) {
        List<String> imageUrls = galleryService.getGalleryImages(productId);
        return ResponseEntity.ok(imageUrls);
    }

    @PostMapping("/update/{productId}/{staffAccountId}")
    public ResponseEntity<?> updateGalleryImages(
            @RequestParam(value = "files", required = false) List<MultipartFile> files,
            @PathVariable String productId, @PathVariable String staffAccountId) {
        try {
            // Fetch and delete existing gallery images
            List<String> imageUrls = galleryService.getGalleryImages(productId);
            galleryService.deleteImageFiles(imageUrls);

            // Delete existing gallery images
            List<Gallery> existingGalleries = galleryService.getGalleriesByProductId(productId);
            if (!existingGalleries.isEmpty()) {
                existingGalleries.forEach(gallery -> {
                    galleryService.deleteGallery(gallery.getGalleryId());
                });
            }

            // Check if there are files to save
            if (files != null && !files.isEmpty()) {
                galleryService.saveGalleryImages(files, productId, staffAccountId);
            }

            return ResponseEntity.ok("Gallery updated successfully with new images.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Failed to update gallery: " + e.getMessage());
        }
    }

    // Create Gallery REST API
    @PostMapping
    public ResponseEntity<Gallery> createGallery(@RequestBody Gallery gallery) {
        Gallery savedGallery = galleryService.createGallery(gallery);
        return new ResponseEntity<>(savedGallery, HttpStatus.CREATED);
    }

    // Get Gallery by id REST API
    // http://localhost:8080/api/galleries/{id}
    @GetMapping("{id}")
    public ResponseEntity<Gallery> getGalleryById(@PathVariable("id") String galleryId) {
        Gallery gallery = galleryService.getGalleryById(galleryId);
        return new ResponseEntity<>(gallery, HttpStatus.OK);
    }

    // Get All Galleries REST API
    // http://localhost:8080/api/galleries
    @GetMapping
    public ResponseEntity<List<Gallery>> getAllGalleries() {
        List<Gallery> galleries = galleryService.getAllGalleries();
        return new ResponseEntity<>(galleries, HttpStatus.OK);
    }

    // Update Gallery REST API
    @PutMapping("{id}")
    // http://localhost:8080/api/galleries/{id}
    public ResponseEntity<Gallery> updateGallery(@PathVariable("id") String galleryId,
            @RequestBody Gallery gallery) {
        gallery.setGalleryId(galleryId);
        Gallery updatedGallery = galleryService.updateGallery(gallery);
        if (updatedGallery != null) {
            return new ResponseEntity<>(updatedGallery, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Delete Gallery REST API
    @DeleteMapping("{id}")
    public ResponseEntity<String> deleteGallery(@PathVariable("id") String galleryId) {
        galleryService.deleteGallery(galleryId);
        return new ResponseEntity<>("Gallery successfully deleted!", HttpStatus.OK);
    }

    @DeleteMapping("/product/{productId}")
    public ResponseEntity<String> deleteGalleriesByProductId(@PathVariable("productId") String productId) {
        List<String> imageUrls = galleryService.getGalleryImages(productId);
        galleryService.deleteImageFiles(imageUrls);
        galleryService.deleteGalleriesByProductId(productId);
        return new ResponseEntity<>("All Galleries with productId " + productId + " successfully deleted!",
                HttpStatus.OK);
    }

    // Lất tất cả Gallery có chứa productId
    @GetMapping("/product/{productId}")
    public ResponseEntity<List<Gallery>> getGalleriesByProductId(@PathVariable("productId") String productId) {
        List<Gallery> galleries = galleryService.getGalleriesByProductId(productId);
        return new ResponseEntity<>(galleries, HttpStatus.OK);
    }

}
