import React, { useState, useEffect } from 'react';
import productservice from "../../../services/ProductService";
import { Link } from 'react-router-dom';

function TopRated() {
    const [products, setProducts] = useState([]);
    const IMAGE_URL = "http://localhost:8080/upload/";
    useEffect(() => {
        productservice.GET_PRODUCTS_BY_TAG_ID('products', "e58831bd-4d5e-46e5-bd64-23794fe240fd")
            .then(response => {
                setProducts(response.data);
            })
            .catch(error => {
                console.error('Error fetching products:', error);
            });
    }, []);

    return (
        <>
            <div className="product-showcase">
                <h2 className="title">Top Rated</h2>

                {products.length > 0 && (
                    <div className="showcase-wrapper  has-scrollbar">
                        {products.reduce((acc, product, index) => {
                            if (index % 4 === 0) {
                                acc.push(
                                    <div className="showcase-container" key={index}>
                                        {products.slice(index, index + 4).map(product => (
                                            <div className="showcase" key={product.productId}>
                                                <Link  to={`/chi-tiet-san-pham/${product.productId}`} className="showcase-img-box">
                                                {product.productGalleries.map((gallery, index) => (
                                                        <img
                                                            key={index}
                                                            src={IMAGE_URL + gallery.imagePath}
                                                            alt={gallery.imagePath}
                                                            width={70}
                                                        className="showcase-img" // Điều chỉnh kích thước và khoảng cách giữa các hình ảnh
                                                        />
                                                    ))}
                                                </Link>
                                                <div className="showcase-content">
                                                    <Link  to={`/chi-tiet-san-pham/${product.productId}`}>
                                                        <h4 className="showcase-title">
                                                            {product.productName}
                                                        </h4>
                                                    </Link>
                                                    <a href="#" className="showcase-category">
                                                        {product.productCategories.map(category => category.category.categoryName).join(', ')}
                                                    </a>
                                                    <div className="price-box">
                                                        <p className="price">${product.salePrice.toFixed(2)}</p>
                                                        <del>${product.comparePrice.toFixed(2)}</del>
                                                    </div>
                                                </div>
                                            </div>
                                        ))}
                                    </div>
                                );
                            }
                            return acc;
                        }, [])}
                    </div>
                )}

            </div>
        </>
    );
}

export default TopRated;
