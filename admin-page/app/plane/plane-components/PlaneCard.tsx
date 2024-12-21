import Image from "next/image";
import planeImage from "../../images/aircraft.jpg";

interface PlaneDetails {
  manufacturer: string;
  name: string;
  capacity: string;
  aircraft_id: number;
  handleDeletePlane: (flightId: number) => void
}

function PlaneCard(props: PlaneDetails) {

  return (
    <div className="plane-container flex flex-col items-center bg-white shadow-lg rounded-lg p-6 space-y-4 md:space-y-0 md:space-x-6 border-2">
      <div className="plane-img w-full flex justify-center items-center bg-gray-100 rounded-lg">
        <Image src={planeImage} alt="Plane Image" width={500} height={300} />
      </div>
      <div className="plane-info flex-1">
        <p className="plane-name text-xl font-bold text-gray-800">
          {props.manufacturer.toUpperCase()} {props.name}
        </p>
        <p className="plane-capacity text-gray-600 mt-2">
          Capacity: {props.capacity}
        </p>
      </div>
      <div className="plane-actions">
        <button
          className="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600"
          onClick={() => props.handleDeletePlane(props.aircraft_id)}
        >
          Delete Plane
        </button>
      </div>
    </div>
  );
}

export default PlaneCard;
