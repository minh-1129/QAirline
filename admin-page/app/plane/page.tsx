import PlaneList from "./plane-components/PlaneList";
import PlaneInfoInputForm from "./plane-components/PlaneInfoInputForm";
import "./plane-page.css";
import Header from "../components/Header";

function PlanePage() {
  return (
    <>
      <Header />
      <div>
        <h1 className="page-title">Plane Management</h1>
        <div className="grid grid-cols-[1fr_2fr]">
          <div className="left-side">
            <PlaneInfoInputForm />
          </div>
          <div className="right-side">
            <PlaneList />
          </div>
        </div>
      </div>
    </>
  );
}

export default PlanePage;
