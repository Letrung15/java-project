import React from "react";
import CIcon from "@coreui/icons-react";
import {
  cilBell,
  cilCalculator,
  cilChartPie,
  cilCursor,
  cilDescription,
  cilDrop,
  cilNotes,
  cilPencil,
  cilPuzzle,
  cilSpeedometer,
  cilStar,
} from "@coreui/icons";
import { CNavGroup, CNavItem, CNavTitle } from "@coreui/react";

const _nav = [
  {
    component: CNavItem,
    name: "Dashboard",
    to: "/admin/dashboard",
    icon: <CIcon icon={cilSpeedometer} customClassName="nav-icon" />,
    badge: {
      color: "info",
      text: "NEW",
    },
  },
  {
    component: CNavGroup,
    name: "Product",
    to: "/admin/product",
    icon: <CIcon icon={cilPuzzle} customClassName="nav-icon" />,
    items: [
      {
        component: CNavItem,
        name: "All Product",
        to: "/admin/product/all-product",
      },
      {
        component: CNavItem,
        name: "Add New Product",
        to: "/admin/product/add-new-product",
      },
    ],
  },
  {
    component: CNavItem,
    name: "Login",
    to: "/admin/login",
    icon: <CIcon icon={cilChartPie} customClassName="nav-icon" />,
  },
  {
    component: CNavItem,
    name: "Register",
    to: "/admin/register",
    icon: <CIcon icon={cilCalculator} customClassName="nav-icon" />,
  },
];

export default _nav;
