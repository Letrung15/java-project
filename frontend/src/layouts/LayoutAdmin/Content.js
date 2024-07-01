import React, { Suspense } from "react";
import { Navigate, Route, Routes } from "react-router-dom";
import { CContainer, CSpinner } from "@coreui/react";
import RouterPrivate from "../../router/RouterPrivate";

function Content() {
  return (
    <CContainer className="px-4">
      <Suspense fallback={<CSpinner color="primary" />}>
        <Routes>
          {RouterPrivate.map((route, idx) => {
            return (
              route.element && (
                <Route
                  key={idx}
                  path={route.path.substring(6)}
                  element={<route.element />}
                />
              )
            );
          })}
          <Route index element={<Navigate to="/admin/dashboard" replace />} />
        </Routes>
      </Suspense>
    </CContainer>
  );
}

export default Content;
