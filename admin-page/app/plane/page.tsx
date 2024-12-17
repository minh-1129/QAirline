import PlaneList from "./plane-components/PlaneList";
import PlaneInfoInputForm from "./plane-components/PlaneInfoInputForm";

function PlanePage() {
  return (
    <div>
      <h1>Plane Page</h1>
      <div className="grid grid-cols-[1fr_2fr]">
        <div className="left-side">
          <PlaneInfoInputForm />
        </div>
        <div className="right-side">
          <PlaneList />
        </div>
      </div>
    </div>
  );
}

export default PlanePage;
