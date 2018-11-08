import React from "react";

import { Link } from "gatsby";

import Header from "../components/header";

const Layout = ({ children }) => {
  return (
    <div>
      <Header />
      <div>
        <Link to="/tags">All Tags</Link>
      </div>
      <div>
        <Link to="/years">By Year</Link>
      </div>
      <div>{children}</div>
    </div>
  );
};

export default Layout;
