import { Outlet } from "react-router-dom";
import { OverlayProvider } from "../../FatherContext/OverlayContext";
import { SidebarProvider } from "../../FatherContext/SidebarContext";
import DataOverlay from "../../pages/frontend/Home/DataOverlay";
import Modal from "../../pages/frontend/Home/Modal";
import Notification from "../../pages/frontend/Home/Notification";
import Header from "./Header";
import Footer from "./Footer";
import { useEffect } from "react";
function LayoutSite() {
  useEffect(() => {
    // Dynamic import for the SCSS file
    import("../../assets/sass/app.scss").then(() => {
      console.log("Admin styles loaded.");
    });

    return () => {
      // Optional: Cleanup actions when the component is unmounted
    };
  }, []);
  return (
    <div>
      <OverlayProvider>
        <SidebarProvider>
          <DataOverlay />
          <Modal />
          <Notification />
          <Header />
          <Outlet />
          <Footer />
        </SidebarProvider>
      </OverlayProvider>
    </div>
  );
}

export default LayoutSite;
