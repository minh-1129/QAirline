import FlightList from "./flight-components/FlightList";
import NewFlightInputForm from "./flight-components/NewFlightInputForm";
import "./flight-page.css";
import Header from "../components/Header";

function FlightPage() {
  return (
    <>
      <Header />
      <div className="px-6">
        <h1 id="page-title">Flight Page</h1>
        <div className="grid grid-cols-2">
          <div className="left-side">
            <NewFlightInputForm />
          </div>
          <div className="right-side">
            <FlightList />
          </div>
        </div>
      </div>
    </>
  );
}

export default FlightPage;
