import Home from "../pages/frontend/Home";
import ProductDetail from "../pages/frontend/Product/ProductDetail";

const RouterPublic = [
    { path: "/", component: Home },
    { path: "/trang-chu", component: Home },
    {path: "/chi-tiet-san-pham/:id", component: ProductDetail},
]
export default RouterPublic;