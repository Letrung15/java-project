import React, { useEffect, useState } from 'react';
import {
    CCard,
    CCardBody,
    CCardHeader,
    CTable,
    CTableHead,
    CTableBody,
    CTableRow,
    CTableHeaderCell,
    CTableDataCell,
    CButton,
    CCol,
    CRow,
    CFormInput,
    CPagination,
    CTooltip
} from '@coreui/react';
import { Link } from 'react-router-dom';
import productservice from '../../../services/ProductService';
import axios from 'axios';

const IMAGE_URL = "http://localhost:8080/upload/";

const formatPrice = (price) => {
    return Number(price).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};

const joinWithCommas = (items) => items.map(item => item.tagName || item.categoryName).join(', ');

export default function ProductList() {
    const [products, setProducts] = useState([]);
    const [currentPage, setCurrentPage] = useState(1);
    const [productsPerPage] = useState(4);
    const [searchKeyword, setSearchKeyword] = useState('');

    useEffect(() => {
        productservice.GET_ALL_PRODUCTS(`products`).then(response => {
            if (Array.isArray(response.data)) {
                setProducts(response.data);
            }
        }).catch(error => {
            console.error('Error fetching products:', error);
        });
    }, []);


    const deleteProductID = async (id) => {
        try {
            // Xóa productTags có productId là id
            await productservice.DELETE_PRODUCT_TAGS_BY_PRODUCT_ID('productTags', id);
            console.log('Product tags deleted successfully');

            // Xóa productCategories có productId là id
            await productservice.DELETE_PRODUCT_CATEGORIES_BY_PRODUCT_ID('productCategories', id);
            console.log('Product categories deleted successfully');

            // Xóa productGalleries có productId là id
            await productservice.DELETE_GALLERY_BY_PRODUCT_ID('galleries', id);
            console.log('productGalleries deleted successfully');

            // Xóa product có productId là id
            const response = await productservice.DELETE_PRODUCT_ID(`products/${id}`);
            console.log('Product deleted successfully');

            // Kiểm tra nếu xóa thành công thì cập nhật danh sách sản phẩm
            if (response.data) {
                setProducts(products.filter(product => product.productId !== id));
            }
        } catch (error) {
            console.error('Error deleting product:', error);
        }
    };


    const handleSearch = () => {
        productservice.GET_SEARCH_PRODUCTS("products", searchKeyword)
            .then(response => {
                if (response.data) {
                    setProducts(response.data);
                }
            })
            .catch(error => {
                console.error('Failed to search products:', error);
            });
    };

    const handleChangeSearch = (event) => {
        setSearchKeyword(event.target.value);
    };

    const totalPages = Math.ceil(products.length / productsPerPage);

    // Create a function to render the pagination UI
    const renderPagination = () => {
        let pages = [];
        for (let i = 1; i <= totalPages; i++) {
            pages.push(
                <button
                    key={i}
                    onClick={() => setCurrentPage(i)}
                    style={{ margin: "0 5px", padding: "5px 10px", cursor: "pointer", backgroundColor: currentPage === i ? '#007bff' : '#fff', color: currentPage === i ? '#fff' : '#007bff' }}
                >
                    {i}
                </button>
            );
        }
        return pages;
    };

    const fields = [
        { key: 'productName', _style: { width: '20%' } },
        { key: 'images', label: 'Images', _style: { width: '20%' }, sorter: false, filter: false },
        { key: 'price', label: 'Price', _style: { width: '20%' } },
        { key: 'quantity', _style: { width: '20%' } },
        { key: 'actions', label: 'Actions', _style: { width: '20%' }, sorter: false, filter: false }
    ];

    return (
        <CRow>
            <CCol xs={12}>
                <CCard>
                    <CCardHeader>
                        Product List
                        <CFormInput
                            type="text"
                            value={searchKeyword}
                            onChange={handleChangeSearch}
                            placeholder="Search Product..."
                            className="my-2"
                        />
                        <CButton color="primary" onClick={handleSearch}>Search</CButton>
                    </CCardHeader>
                    <CCardBody style={{ maxWidth: '1290px', overflow: 'auto' }}>
                        <CTable hover striped>
                            <CTableHead>
                                <CTableRow>
                                    <CTableHeaderCell>Name</CTableHeaderCell>
                                    <CTableHeaderCell>Images</CTableHeaderCell>
                                    <CTableHeaderCell>Tag</CTableHeaderCell>
                                    <CTableHeaderCell>Category</CTableHeaderCell>
                                    <CTableHeaderCell>Sale Price</CTableHeaderCell>
                                    <CTableHeaderCell>Comepare Price</CTableHeaderCell>
                                    <CTableHeaderCell>Buying Price</CTableHeaderCell>
                                    <CTableHeaderCell>Quantity</CTableHeaderCell>
                                    <CTableHeaderCell>Short Description</CTableHeaderCell>
                                    <CTableHeaderCell>Product Description</CTableHeaderCell>
                                    <CTableHeaderCell>Note</CTableHeaderCell>
                                    <CTableHeaderCell>Published</CTableHeaderCell>
                                    <CTableHeaderCell>DisableOutOfStock</CTableHeaderCell>
                                    <CTableHeaderCell>Actions</CTableHeaderCell>
                                </CTableRow>
                            </CTableHead>
                            <CTableBody>
                                {products.slice(
                                    (currentPage - 1) * productsPerPage,
                                    currentPage * productsPerPage
                                ).map((product, index) => (
                                    <CTableRow key={index}>
                                        <CTableDataCell>{product.productName}</CTableDataCell>
                                        <CTableDataCell>
                                            {product.productGalleries.map((gallery, index) => (
                                                <img
                                                    key={index}
                                                    src={IMAGE_URL + gallery.imagePath}
                                                    alt={gallery.imagePath}
                                                    style={{ width: '100px', marginRight: '10px' }}
                                                />
                                            ))}
                                        </CTableDataCell>
                                        <CTableDataCell>
                                            {product.productTags && product.productTags.length > 0 ? (
                                                product.productTags.map(tag => tag.tag.tagName).join(', ')
                                            ) : (
                                                <img
                                                    src={require(`../../../assets/images/products/chamhoi.png`)}
                                                    alt={product.productName}
                                                    style={{ width: '50px', height: '50px', objectFit: 'cover' }}
                                                />
                                            )}
                                        </CTableDataCell>
                                        <CTableDataCell>
                                            {product.productCategories && product.productCategories.length > 0 ? (
                                                product.productCategories.map(category => category.category.categoryName).join(', ')
                                            ) : (
                                                <img
                                                    src={require(`../../../assets/images/products/chamhoi.png`)}
                                                    alt={product.productName}
                                                    style={{ width: '50px', height: '50px', objectFit: 'cover' }}
                                                />
                                            )}
                                        </CTableDataCell>
                                        <CTableDataCell>{formatPrice(product.salePrice)}</CTableDataCell>
                                        <CTableDataCell>{formatPrice(product.comparePrice)}</CTableDataCell>
                                        <CTableDataCell>{formatPrice(product.buyingPrice)}</CTableDataCell>
                                        <CTableDataCell>{product.quantity}</CTableDataCell>
                                        <CTableDataCell>{product.shortDescription.slice(0, 50) + '...'}</CTableDataCell>
                                        <CTableDataCell>
                                            {product.productDescription.slice(0, 50) + '...'}
                                        </CTableDataCell>
                                        <CTableDataCell>
                                            {product.note.slice(0, 50) + '...'}
                                        </CTableDataCell>
                                        <CTableDataCell>{product.published ? 'True' : 'False'}</CTableDataCell>
                                        <CTableDataCell>{product.disableOutOfStock ? 'True' : 'False'}</CTableDataCell>
                                        <CTableDataCell>
                                            <Link to={`/admin/product/product-update/${product.productId}`}>
                                                <CButton color="info">Edit</CButton>
                                            </Link>
                                            <CButton color="danger" onClick={() => deleteProductID(product.productId)}>Delete</CButton>
                                        </CTableDataCell>
                                    </CTableRow>
                                ))}
                            </CTableBody>

                        </CTable>
                      
                    </CCardBody>
                    <div style={{ display: 'flex', justifyContent: 'center', padding: '20px' }}>
                        {renderPagination()}
                    </div>
                </CCard>
            </CCol>
        </CRow>
    );
}