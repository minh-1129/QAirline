import FlightList from './flight-components/FlightList';
import NewFlightInputForm from './flight-components/NewFlightInputForm';

function FlightPage() {
  return (
    <div>
      <h1>Flight Page</h1>
      <div className='grid grid-cols-2'>
        <div className='left-side'>
          <NewFlightInputForm />
        </div>
        <div className='right-side'>
          <FlightList />
        </div>
      </div>
      
    </div>
  );
}

export default FlightPage;