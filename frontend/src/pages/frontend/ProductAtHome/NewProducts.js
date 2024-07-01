import React, { useEffect, useState } from 'react';
import { MdStar, MdStarBorder } from 'react-icons/md';
import { AiOutlineHeart, AiOutlineEye, AiOutlineReload, AiOutlineShoppingCart } from 'react-icons/ai';
import productservice from "../../../services/ProductService";
import { Link } from 'react-router-dom';

function NewProducts() {
    const [products, setProducts] = useState([]);
    const IMAGE_URL = "http://localhost:8080/upload/";
    useEffect(() => {
        productservice.GET_PRODUCTS_BY_TAG_ID('products', "e09fae3f-0916-42b3-94c0-a1e9951d79a0")
            .then(response => {
                setProducts(response.data);
            })
            .catch(error => {
                console.error('Error fetching products:', error);
            });
    }, []);

    return (
        <div className="product-main">
            <h2 className="title">New Products</h2>
            <div className="product-grid">
                {products.map(product => (
                    <div className="showcase" key={product.productId}>
                        <div className="showcase-banner">
                        {product.productGalleries.map((gallery, index) => (
                                    <img
                                        key={index}
                                        src={IMAGE_URL + gallery.imagePath}
                                        alt={gallery.imagePath}
                                        width={300}
                                        className="product-img default"// Điều chỉnh kích thước và khoảng cách giữa các hình ảnh
                                    />
                                ))}
                                {product.productGalleries.map((gallery, index) => (
                                    <img
                                        key={index}
                                        src={IMAGE_URL + gallery.placeholder}
                                        alt={gallery.placeholder}
                                        width={300}
                                        className="product-img hover"// Điều chỉnh kích thước và khoảng cách giữa các hình ảnh
                                    />
                                ))}
                           
                            {product.productType === "15%" && <p className="showcase-badge">15%</p>}
                            {product.productType === "sale" && <p className="showcase-badge angle black">sale</p>}
                            {product.productType === "new" && <p className="showcase-badge angle pink">new</p>}
                            <div className="showcase-actions">
                                <button className="btn-action">
                                    <AiOutlineHeart />
                                </button>
                                <button className="btn-action">
                                    <AiOutlineEye />
                                </button>
                                <button className="btn-action">
                                    <AiOutlineReload />
                                </button>
                                <button className="btn-action">
                                    <AiOutlineShoppingCart />
                                </button>
                            </div>
                        </div>
                        <div className="showcase-content">
                            <a href="#" className="showcase-category">
                                {product.productCategories.map(category => category.category.categoryName).join(', ')}
                            </a>
                            <Link to={`/chi-tiet-san-pham/${product.productId}`}>
                                <h3 className="showcase-title">{product.productName}</h3>
                            </Link>
                            <div className="showcase-rating">
                                <MdStar />
                                <MdStar />
                                <MdStar />
                                <MdStarBorder />
                                <MdStarBorder />
                            </div>
                            <div className="price-box">
                                <p className="price">${product.salePrice.toFixed(2)}</p>
                                <del>${product.comparePrice.toFixed(2)}</del>
                            </div>
                        </div>
                    </div>
                ))}
            </div>
        </div>
    );
}

export default NewProducts;
