import React, { useState, useEffect } from "react";
import axios from 'axios';
import { useParams } from "react-router-dom";
import { MdStar, MdStarHalf } from "react-icons/md";
import { FaFacebookF, FaTwitter, FaInstagram, FaWhatsapp, FaPinterest } from 'react-icons/fa';

function ProductDetail() {
    const [product, setProduct] = useState(null);
    const [mainImage, setMainImage] = useState('');
    const [originalMainImage, setOriginalMainImage] = useState('');
    const [imageList, setImageList] = useState([]);
    const { id } = useParams();
    const IMAGE_URL = "http://localhost:8080/upload/";

    useEffect(() => {
        axios.get(`http://localhost:8080/api/products/${id}`)
            .then(response => {
                setProduct(response.data);
                const initialImagePath = IMAGE_URL + response.data.productGalleries[0].imagePath;
                setMainImage(initialImagePath);
                setOriginalMainImage(initialImagePath); // Store the initial main image
                setImageList(response.data.productGalleries[0].relatedImage.split(';'));
            })
            .catch(error => {
                console.error('Error fetching product data:', error);
            });
    }, [id]);

    const handleImageClick = (image) => {
        const newImageUrl = IMAGE_URL + image;
        // Toggle between the clicked image and the original main image
        if (mainImage === newImageUrl) {
            setMainImage(originalMainImage);
        } else {
            setMainImage(newImageUrl);
        }
    };

    return (
        <div className="card-wrapper">
            <div className="card">
                <div className="product-imgs">
                    <div className="img-display">
                        <div className="img-showcase">
                            {mainImage && <img src={mainImage} alt="Main product" />}
                        </div>
                    </div>
                    <div className="img-select">
                        <div className="img-list">
                            <div className="img-item">
                                <a href="#" onClick={(e) => {
                                    e.preventDefault();
                                    setMainImage(originalMainImage);
                                }}>
                                    <img src={originalMainImage} alt="Original product" />
                                </a>
                            </div>
                            {imageList.length > 0 && (
                                imageList.map((image, index) => {
                                    const imageUrl = IMAGE_URL + image;
                                    return (
                                        <div className="img-item" key={index}>
                                            <a href="#" onClick={(e) => {
                                                e.preventDefault();
                                                handleImageClick(image);
                                            }}>
                                                {imageUrl !== "http://localhost:8080/upload/" && <img src={imageUrl} alt={`Related product ${index + 1}`} />}
                                            </a>
                                        </div>
                                    );
                                })
                            )}

                        </div>
                    </div>
                </div>
                <div className="product-content">
                    <h2 className="product-title">{product?.productName || 'Product Name'}</h2>
                    <div className="product-rating">
                        <MdStar />
                        <MdStar />
                        <MdStar />
                        <MdStar />
                        <MdStarHalf />
                    </div>
                    <div className="product-price">
                        <p className="last-price">Old Price: <span>${product?.comparePrice.toFixed(2)}</span></p>
                        <p className="new-price">New Price: <span>${product?.salePrice.toFixed(2)} (5%)</span></p>
                    </div>
                    <div className="product-detail">
                        <h2>About this item:</h2>
                        <p>{product?.productDescription}</p>
                    </div>
                    <div className="purchase-info">
                        <input type="number" min={1} defaultValue={1} />
                        <button type="button" className="btn">Add to Cart <i className="fas fa-shopping-cart" /></button>
                    </div>
                    <div className="social-links">
                        <p>Share At:</p>
                        <a href="#"><FaFacebookF /></a>
                        <a href="#"><FaTwitter /></a>
                        <a href="#"><FaInstagram /></a>
                        <a href="#"><FaWhatsapp /></a>
                        <a href="#"><FaPinterest /></a>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default ProductDetail;
