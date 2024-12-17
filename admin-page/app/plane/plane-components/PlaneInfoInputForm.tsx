import React from 'react'

function PlaneInfoInputForm() {
  return (
    <form className="max-w-lg mx-auto bg-white shadow-lg rounded-lg p-6 space-y-6">
      <div>
        <label
          htmlFor="plane-picture"
          className="block text-sm font-medium text-gray-700"
        >
          Plane Picture
        </label>
        <input
          type="file"
          id="plane-picture"
          name="plane-picture"
          className="mt-1 block w-full text-sm text-gray-500 border border-gray-300 rounded-lg p-2 file:mr-4 file:py-2 file:px-4 file:rounded file:border-0 file:text-sm file:font-semibold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100"
        />
      </div>

      <div>
        <label
          htmlFor="plane-id"
          className="block text-sm font-medium text-gray-700"
        >
          Plane ID
        </label>
        <input
          type="text"
          id="plane-id"
          name="plane-id"
          className="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm"
          placeholder="Enter Plane ID"
        />
      </div>

      <div>
        <label
          htmlFor="manufacturer"
          className="block text-sm font-medium text-gray-700"
        >
          Manufacturer
        </label>
        <input
          type="text"
          id="manufacturer"
          name="manufacturer"
          className="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm"
          placeholder="Enter Manufacturer"
        />
      </div>

      <div>
        <label
          htmlFor="name"
          className="block text-sm font-medium text-gray-700"
        >
          Plane Name
        </label>
        <input
          type="text"
          id="name"
          name="name"
          className="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm"
          placeholder="Enter Plane Name"
        />
      </div>

      <div>
        <label
          htmlFor="capacity"
          className="block text-sm font-medium text-gray-700"
        >
          Capacity
        </label>
        <input
          type="number"
          id="capacity"
          name="capacity"
          className="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm"
          placeholder="Enter Capacity"
        />
      </div>

      <div className="text-right">
        <button
          type="submit"
          className="px-4 py-2 bg-blue-500 text-white rounded-lg shadow hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
        >
          Submit
        </button>
      </div>
    </form>
  );
}

export default PlaneInfoInputForm;
