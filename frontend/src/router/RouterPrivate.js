import React from 'react';
import Dashboard from '../pages/backend/Dashbord/index';
import ProductList from '../pages/backend/Product/ProductList';
import ProductCreateLater from '../pages/backend/Product/ProductCreateLater';
import ProductUpdateLater from '../pages/backend/Product/ProductUpdateLater';
import Login from '../pages/backend/Login/index';




const RouterPrivate = [
    { path: '/admin', exact: true, name: 'Home', element: Dashboard },
    { path: '/admin/dashboard', name: 'Dashboard', element: Dashboard },
    { path: '/admin/product', name: 'Product', element: ProductList, exact: true },
    { path: '/admin/product/all-product', name: 'All Product', element: ProductList },
    { path: '/admin/product/add-new-product', name: 'Add New Product', element: ProductCreateLater },
    { path: '/admin/product/product-update/:id', name: 'Update Product', element: ProductUpdateLater },
    { path: '/admin/login', name: 'Login', element: Login },
]
export default RouterPrivate;