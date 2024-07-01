import React, { useEffect } from "react";
import Sidebar from "./Sidebar";
import Content from "./Content";
import Footer from "./Footer";
import Header from "./Header/index";

function LayoutAdmin() {
  useEffect(() => {
    // Dynamic import for the SCSS file
    import("../../assets/sass/styleadmin.scss").then(() => {
      console.log("Admin styles loaded.");
    });

    return () => {
      // Optional: Cleanup actions when the component is unmounted
    };
  }, []); // Empty dependency array ensures this runs only once on mount

  return (
    <div>
      <Sidebar />
      <div className="wrapper d-flex flex-column min-vh-100">
        <Header />
        <div className="body flex-grow-1">
          <Content />
        </div>
        <Footer />
      </div>
    </div>
  );
}

export default LayoutAdmin;
