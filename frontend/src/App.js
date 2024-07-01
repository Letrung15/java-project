import { BrowserRouter, Navigate, Route, Routes } from "react-router-dom";
import RouterSite from "./router";
import LayoutSite from "./layouts/LayoutSite";
import React, { useEffect } from "react";

import LayoutAdmin from "./layouts/LayoutAdmin/index.js";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<LayoutSite />}>
          {RouterSite.RouterPublic.map(function (route, index) {
            const Page = route.component;
            return <Route key={index} path={route.path} element={<Page />} />;
          })}
        </Route>

        <Route path="/admin/*" element={<LayoutAdmin />} />
        {/* No routes defined here because Content.js handles all admin routes internally */}
      </Routes>
    </BrowserRouter>
  );
}

export default App;
